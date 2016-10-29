#[macro_use]
extern crate rustfbp;
extern crate capnp;
extern crate hyper;

component! {
  example_satellite_repo_nand, contracts(workbench_boolean)
  inputs(a: workbench_boolean, b: workbench_boolean),
  inputs_array(),
  outputs(output: workbench_boolean),
  outputs_array(),
  option(),
  acc(),
  fn run(&mut self) -> Result<()> {
    Ok(())
  }
}
