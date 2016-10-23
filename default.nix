{ fractalide ? import <fractalide> {}
  , pkgs ? fractalide.pkgs
  , support ? fractalide.support
  , contracts ? fractalide.contracts
  , components ? fractalide.components}:
let
  ### change these two expressions
  publicComponentOrSubnet = allComponents.vendor_maths_boolean_nand; # expose your public reusable subnet
  exeSubnet = allComponents.vendor_test_nand; # a subnet containing non-generic IIPs you don't want to expose to the community
  allContracts = contracts // import ./contracts {inherit pkgs support allContracts;};
  allComponents = components // import ./components {inherit pkgs support allContracts allComponents;};
in
if fractalide == null then publicComponentOrSubnet
else import (<fractalide> + "/support/vm/") {inherit pkgs support;
  contracts = allContracts;
  components = allComponents;
  exeSubnet = exeSubnet;}
