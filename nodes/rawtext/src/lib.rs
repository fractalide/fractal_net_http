#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;

agent! {
  net_raw_text, edges(generic_text, request, response)
  inputs(input: request),
  inputs_array(),
  outputs(output: response),
  outputs_array(),
  option(generic_text),
  acc(),
  fn run(&mut self) -> Result<()> {
      let mut opt_ip = self.recv_option();
      let mut req_ip = self.ports.recv("input")?;

      let mut ip = IP::new();
      {
          let mut builder: response::Builder = ip.build_schema();
          let opt_reader: generic_text::Reader = opt_ip.read_schema()?;
          let reader: request::Reader = req_ip.read_schema()?;

          builder.set_id(reader.get_id());
          builder.set_response(opt_reader.get_text()?);
      }

      self.ports.send("output", ip)?;

      Ok(())
  }
}
