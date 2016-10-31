#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;
extern crate tiny_http;

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
  net_http, contracts(net_address, net_request, net_response)
  inputs(listen: net_address, request: any, response: net_response),
  inputs_array(),
  outputs(),
  outputs_array(get: net_request, post: net_request, put: net_request, delete: net_request),
  option(),
  acc(), portal(Portal => Portal::new())
  fn run(&mut self) -> Result<()> {
      if let Ok(mut ip) = self.ports.try_recv("listen") {
          // TODO :: clean the portal
          {
              let reader: net_address::Reader = ip.get_root()?;
              self.portal.listen(reader.get_address()?, self.ports.get_sender("request")?)?;
          }
      }

      if let Ok(ip) = self.ports.try_recv("request") {

          if let Some(ref recv) = self.portal.recv {
              let mut request = recv.recv()?;

              // TODO : check if there is an output. If no, skip everything

              if self.portal.id == u64::max_value() {
                  self.portal.id = 0;
              } else {
                  self.portal.id += 1;
              }

              // Build the request
              let mut ip = IP::new();
              {
                  let mut builder: net_request::Builder = ip.init_root();
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

              // Send to the correct output port
              let sended = match *request.method() {
                  tiny_http::Method::Get => send_outside(&self, "get", request.url(), ip)?,
                  tiny_http::Method::Post => send_outside(&self, "post", request.url(), ip)?,
                  tiny_http::Method::Put => send_outside(&self, "put", request.url(), ip)?,
                  tiny_http::Method::Delete => send_outside(&self, "delete", request.url(), ip)?,
                  _ => { false }
              };

              if sended {
                  // Save the request
                  self.portal.requests.insert(self.portal.id, request);
              } else {
                  let response = Response::from_string("")
                      .with_status_code(404);
                  request.respond(response);
              }
          }
      }

      if let Ok(mut ip) = self.ports.try_recv("response") {
          let reader:net_response::Reader  = ip.get_root()?;
          let response = Response::from_string(reader.get_response()?);
          if let Some(req) = self.portal.requests.remove(&reader.get_id()) {
              req.respond(response);
          }
      }
      Ok(())
  }
}

fn send_outside(comp: &net_http, port: &str, url: &str, ip: IP) -> Result<bool> {
    // TODO remove hardcoded get
    let array = comp.ports.get_output_selections("get")?;
    // let array = comp.ports.get_output_selections(port)?;
    for select in array {
        if url == select {
            comp.ports.send_array(port, &select, ip);
            return Ok(true);
        }
    }
    Ok(false)
}
