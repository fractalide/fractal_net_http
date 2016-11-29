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
  buffet = {
    components = components // fractalComponents;
    contracts = contracts // fractalContracts;
    support = support;
    crates = "crates_to_come";
    pkgs = pkgs;
  };
  fractalContracts = import ./contracts {inherit buffet; };
  fractalComponents = import ./components {inherit buffet; };
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
