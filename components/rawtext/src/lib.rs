#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;

component! {
  net_raw_text, contracts(generic_text, request, response)
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
          let mut builder: response::Builder = ip.build_contract();
          let opt_reader: generic_text::Reader = opt_ip.read_contract()?;
          let reader: request::Reader = req_ip.read_contract()?;

          builder.set_id(reader.get_id());
          builder.set_response(opt_reader.get_text()?);
      }

      self.ports.send("output", ip)?;

      Ok(())
  }
}
