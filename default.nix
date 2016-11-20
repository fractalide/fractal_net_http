{
  fractalide ? import <fractalide> {}
  , pkgs ? fractalide.pkgs
  , support ? fractalide.support
  , contracts ? fractalide.contracts
  , components ? fractalide.components
  , subnet ? "test"
}:
let
  defaultSubnet = (builtins.head (pkgs.lib.attrVals [subnet] fractalComponents));
  fractalContracts = import ./contracts {inherit pkgs support allContracts;};
  fractalComponents = import ./components {inherit pkgs support allContracts allComponents;};
  allContracts = contracts // fractalContracts;
  allComponents = components // fractalComponents;
  fvm = import (<fractalide> + "/support/fvm/") {inherit pkgs support;
    contracts = contracts;
    components = components;
  };
  test = pkgs.writeTextFile {
    name = defaultSubnet.name;
    text = "${fvm}/bin/fvm ${defaultSubnet}";
    executable = true;
  };
in
{ components = fractalComponents; contracts = fractalContracts; test = test; service = ./service.nix; }
