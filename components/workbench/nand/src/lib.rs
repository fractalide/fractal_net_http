#[macro_use]
extern crate rustfbp;
extern crate capnp;

component! {
  example_satellite_repo_nand, contracts(workbench_boolean)
  inputs(a: workbench_boolean, b: workbench_boolean),
  inputs_array(),
  outputs(output: workbench_boolean),
  outputs_array(),
  option(),
  acc(),
  fn run(&mut self) -> Result<()> {
    let a = {
        let mut ip_a = try!(self.ports.recv("a"));
        let a_reader: workbench_boolean::Reader = try!(ip_a.get_root());
        a_reader.get_boolean()
    };
    let b = {
        let mut ip_b = try!(self.ports.recv("b"));
        let b_reader: workbench_boolean::Reader = try!(ip_b.get_root());
        b_reader.get_boolean()
    };

    let mut out_ip = IP::new();
    {
      let mut boolean = out_ip.init_root::<workbench_boolean::Builder>();
      boolean.set_boolean(if a == true && b == true {false} else {true});
    }
    try!(self.ports.send("output", out_ip));
    Ok(())
  }
}
