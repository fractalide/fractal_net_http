#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;

agent! {
  input(input: net_http_request),
  output(output: net_http_response),
  option(prim_text),
  fn run(&mut self) -> Result<Signal> {
      let mut opt_msg = self.recv_option();
      let mut req_msg = self.input.input.recv()?;

      let mut msg = Msg::new();
      {
          let mut builder: net_http_response::Builder = msg.build_schema();
          let opt_reader: prim_text::Reader = opt_msg.read_schema()?;
          let reader: net_http_request::Reader = req_msg.read_schema()?;

          builder.set_id(reader.get_id());
          builder.set_response(opt_reader.get_text()?);
      }

      self.output.output.send(msg)?;

      Ok(End)
  }
}
