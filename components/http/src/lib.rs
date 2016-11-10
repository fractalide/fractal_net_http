#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;
extern crate tiny_http;
extern crate regex;

use regex::RegexSet;

use tiny_http::{Server, Response, Request};

use std::sync::mpsc::channel;
use std::sync::mpsc::Receiver;
use std::thread;

pub struct Portal {
    server: Option<Sender<bool>>,
    recv: Option<Receiver<Request>>,
    requests: HashMap<u64, Request>,
    id: u64,
}

impl Portal {
    fn new() -> Portal {
        Portal {
            server: None,
            recv: None,
            requests: HashMap::new(),
            id: 0,
        }
    }

    fn listen(&mut self, address: &str, sender: IPSender) -> Result<()> {
        let server = Server::http(address).unwrap();
        let (s, r) = channel();
        let (s_recv, r_recv) = channel();
        thread::spawn(move || {
            for mut request in server.incoming_requests() {
                if let Ok(_) = r.try_recv() {
                    break;
                }

                s_recv.send(request).unwrap();
                sender.send(IP::new()).unwrap();
            }
        });

        self.recv = Some(r_recv);
        self.server = Some(s);
        Ok(())
    }
}

component! {
  net_http, contracts(address, request, response)
  inputs(listen: address, request: any, response: response),
  inputs_array(),
  outputs(),
  outputs_array(GET: request, POST: request, PUT: request, DELETE: request, HEAD: request, CONNECT: request, OPTIONS: request, TRACE: request, PATCH: request),
  option(),
  acc(), portal(Portal => Portal::new())
  fn run(&mut self) -> Result<()> {
      if let Ok(mut ip) = self.ports.try_recv("listen") {
          // TODO :: clean the portal
          {
              let reader: address::Reader = ip.get_root()?;
              self.portal.listen(reader.get_address()?, self.ports.get_sender("request")?)?;
          }
      }

      if let Ok(ip) = self.ports.try_recv("request") {

          if let Some(ref recv) = self.portal.recv {
              let mut request = recv.recv()?;

              let select_out = get_output_port(&self, request.method().as_str(), request.url())?;
              if let Some(select_out) = select_out {
                  if self.portal.id == u64::max_value() {
                      self.portal.id = 0;
                  } else {
                      self.portal.id += 1;
                  }

                  // Build the request
                  let mut ip = IP::new();
                  {
                      let mut builder: request::Builder = ip.init_root();
                      // ID
                      builder.set_id(self.portal.id);
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
                          tiny_http::Method::Get => builder.set_method(contract_capnp::Method::Get),
                          tiny_http::Method::Post => builder.set_method(contract_capnp::Method::Post),
                          tiny_http::Method::Put => builder.set_method(contract_capnp::Method::Put),
                          tiny_http::Method::Delete => builder.set_method(contract_capnp::Method::Delete),
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

                  self.ports.send_array(request.method().as_str(), &select_out, ip);
                  self.portal.requests.insert(self.portal.id, request);
              } else {
                  let response = Response::from_string("")
                      .with_status_code(404);
                  request.respond(response);
              }
          }
      }

      if let Ok(mut ip) = self.ports.try_recv("response") {
          let reader:response::Reader  = ip.get_root()?;
          let response = Response::from_string(reader.get_response()?);
          if let Some(req) = self.portal.requests.remove(&reader.get_id()) {
              let resp = response.with_status_code(reader.get_status_code());
              req.respond(resp);
          }
      }
      Ok(())
  }
}

fn get_output_port(comp: &net_http, port: &str, url: &str) -> Result<Option<String>> {
    let mut array = comp.ports.get_output_selections(port)?;
    array.sort_by(|a, b| b.cmp(a));
    let regex = RegexSet::new(&array).or(Err(result::Error::Misc("bad regex".into())))?;
    let matches: Vec<_> = regex.matches(url).into_iter().collect();
    if let Some(select) = matches.first() {
        return Ok(Some(array[*select].to_string()));
    } else {
        Ok(None)
    }
}
