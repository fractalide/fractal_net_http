#[macro_use]
extern crate rustfbp;
extern crate capnp;
extern crate tiny_http;
extern crate regex;

use regex::RegexSet;

use tiny_http::{Server, Response, Request, Method};

use std::sync::mpsc::Receiver;
use std::thread;

pub struct State {
    server: Option<Sender<bool>>,
    recv: Option<Receiver<Request>>,
    requests: HashMap<u64, Request>,
    id: u64,
}

impl State {
    fn new() -> State {
        State {
            server: None,
            recv: None,
            requests: HashMap::new(),
            id: 0,
        }
    }

    fn listen(&mut self, address: &str, sender: MsgSender) -> Result<()> {
        let server = Server::http(address).unwrap();
        let (s, r) = channel();
        let (s_recv, r_recv) = channel();
        thread::spawn(move || {
            for mut request in server.incoming_requests() {
                if let Ok(_) = r.try_recv() {
                    break;
                }

                s_recv.send(request).unwrap();
                sender.send(Msg::new()).unwrap();
            }
        });

        self.recv = Some(r_recv);
        self.server = Some(s);
        Ok(())
    }
}

agent! {
  input(listen: net_http_address
      , halt: any
      , request: any
      , response: net_http_response),
  outarr(GET: net_http_request
      , POST: net_http_request
      , PUT: net_http_request
      , DELETE: net_http_request
      , HEAD: net_http_request
      , CONNECT: net_http_request
      , OPTIONS: net_http_request
      , TRACE: net_http_request
      , PATCH: net_http_request),
  state(State => State::new()),
  fn run(&mut self) -> Result<Signal> {
      if let Ok(mut msg) = self.input.listen.try_recv() {
          // TODO :: clean the state
          {
              let reader: net_http_address::Reader = msg.read_schema()?;
              self.state.listen(reader.get_address()?, self.input.request.get_sender())?;
          }
      }

      if let Ok(_) = self.input.halt.try_recv() {
          return Ok(End);
      }

      if let Ok(msg) = self.input.request.try_recv() {

          if let Some(ref recv) = self.state.recv {
              let mut request = recv.recv()?;

              let select_out = get_output_port(&self, request.method(), request.url())?;
              if let Some(select_out) = select_out {
                  if self.state.id == u64::max_value() {
                      self.state.id = 0;
                  } else {
                      self.state.id += 1;
                  }

                  // Build the request
                  let mut msg = Msg::new();
                  {
                      let mut builder: net_http_request::Builder = msg.build_schema();
                      // ID
                      builder.set_id(self.state.id);
                      // URL
                      builder.set_url(request.url());
                      // Headers
                      {
                          let mut heads = builder.borrow().init_headers(request.headers().len() as u32);
                          for (i, header) in (0..).zip(request.headers()) {
                              heads.borrow().get(i).set_key(header.field.as_str().as_str());
                              heads.borrow().get(i).set_value(header.value.as_str());
                          }
                      }
                      // Method
                      match *request.method() {
                          tiny_http::Method::Get => builder.set_method(edge_capnp::NetHttpRequestMethod::Get),
                          tiny_http::Method::Post => builder.set_method(edge_capnp::NetHttpRequestMethod::Post),
                          tiny_http::Method::Put => builder.set_method(edge_capnp::NetHttpRequestMethod::Put),
                          tiny_http::Method::Delete => builder.set_method(edge_capnp::NetHttpRequestMethod::Delete),
                          _ => {}
                          // TODO : handle well other method
                          // Head,
                          // Connect,
                          // Options,
                          // Trace,
                          // Patch,
                          // NonStandard(AsciiString),
                      }
                      // Version
                      {
                          let mut vers = builder.borrow().init_http_version();
                          vers.set_main(request.http_version().0);
                          vers.set_sub(request.http_version().1);
                      }
                      // Content
                      let mut content = String::new();
                      request.as_reader().read_to_string(&mut content).unwrap();
                      builder.set_content(&content);
                  }

                  select_out.send(msg)?;
                  self.state.requests.insert(self.state.id, request);
              } else {
                  let response = Response::from_string("")
                      .with_status_code(404);
                  request.respond(response);
              }
          }
      }

      if let Ok(mut msg) = self.input.response.try_recv() {
          let reader: net_http_response::Reader = msg.read_schema()?;
          let response = Response::from_string(reader.get_response()?);
          if let Some(req) = self.state.requests.remove(&reader.get_id()) {
              let resp = response.with_status_code(reader.get_status_code());
              req.respond(resp);
          }
      }
      Ok(Continue)
  }
}

fn get_output_port(agent: &ThisAgent, port: &Method, url: &str) -> Result<Option<MsgSender>> {
    let output = match *port {
	tiny_http::Method::Get => { &agent.outarr.GET },
	tiny_http::Method::Put => { &agent.outarr.PUT },
	tiny_http::Method::Post => { &agent.outarr.POST },
	tiny_http::Method::Delete => { &agent.outarr.DELETE },
	tiny_http::Method::Head => { &agent.outarr.HEAD },
	tiny_http::Method::Connect => { &agent.outarr.CONNECT },
	tiny_http::Method::Options => { &agent.outarr.OPTIONS },
	tiny_http::Method::Trace => { &agent.outarr.TRACE },
	tiny_http::Method::Patch => { &agent.outarr.PATCH },
	_ => { unreachable!() },
    };

    let mut array: Vec<&String> = output.keys().collect();
    array.sort_by(|a, b| b.cmp(a));
    let regex = RegexSet::new(&array).or(Err(result::Error::Misc("bad regex".into())))?;
    let matches = regex.matches(url);
    if let Some(select) = matches.iter().next() {
        let name = array.get(select).expect("unreachable");
        return Ok(Some(output.get(*name).expect("unreachable").clone()));
    } else {
        Ok(None)
    }
}
