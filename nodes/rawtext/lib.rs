#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;

agent! {
  input(input: request),
  output(output: response),
  option(generic_text),
  fn run(&mut self) -> Result<Signal> {
      let mut opt_msg = self.recv_option();
      let mut req_msg = self.input.input.recv()?;

      let mut msg = Msg::new();
      {
          let mut builder: response::Builder = msg.build_schema();
          let opt_reader: generic_text::Reader = opt_msg.read_schema()?;
          let reader: request::Reader = req_msg.read_schema()?;

          builder.set_id(reader.get_id());
          builder.set_response(opt_reader.get_text()?);
      }

      self.output.output.send(msg)?;

      Ok(End)
  }
}
