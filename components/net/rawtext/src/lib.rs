#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;

component! {
  net_raw_text, contracts(generic_text, net_request, net_response)
  inputs(input: net_request),
  inputs_array(),
  outputs(output: net_response),
  outputs_array(),
  option(generic_text),
  acc(),
  fn run(&mut self) -> Result<()> {
      let mut opt_ip = self.recv_option();
      let mut req_ip = self.ports.recv("input")?;

      let mut ip = IP::new();
      {
          let mut builder: net_response::Builder = ip.init_root();
          let opt_reader: generic_text::Reader = opt_ip.get_root()?;
          let reader: net_request::Reader = req_ip.get_root()?;

          builder.set_id(reader.get_id());
          builder.set_response(opt_reader.get_text()?);
      }

      self.ports.send("output", ip)?;

      Ok(())
  }
}
