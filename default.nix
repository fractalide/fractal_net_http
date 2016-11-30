{
  fractalide ? import <fractalide> {}
  , pkgs ? fractalide.pkgs
  , support ? fractalide.support
  , contracts ? fractalide.contracts
  , components ? fractalide.components
  , crates ? fractalide.crates
  , subnet ? "test"
}:
let
  defaultSubnet = (builtins.head (pkgs.lib.attrVals [subnet] fractalComponents));
  buffet = {
    components = components // fractalComponents;
    contracts = contracts // fractalContracts;
    support = support;
    crates = crates;
    pkgs = pkgs;
  };
  fractalContracts = import ./contracts {inherit buffet; };
  fractalComponents = import ./components {inherit buffet; };
  fvm = import (<fractalide> + "/support/fvm/") {inherit pkgs support;
    contracts = contracts;
    components = components;
    crates = crates;
  };
  test = pkgs.writeTextFile {
    name = defaultSubnet.name;
    text = "${fvm}/bin/fvm ${defaultSubnet}";
    executable = true;
  };
in
{ components = fractalComponents; contracts = fractalContracts; test = test; service = ./service.nix; }
