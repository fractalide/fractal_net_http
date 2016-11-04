{ fractalide ? import <fractalide> {}
  , pkgs ? fractalide.pkgs
  , support ? fractalide.support
  , contracts ? fractalide.contracts
  , components ? fractalide.components}:
let
  exeSubnet = allComponents.net_http;
  publicNamespace = {components = fracComponents; contracts = fracContracts;};
  fracContracts = import ./contracts {inherit pkgs support allContracts;};
  fracComponents = import ./components {inherit pkgs support allContracts allComponents;};
  allContracts = contracts // fracContracts;
  allComponents = components // fracComponents;
  result = if fractalide == null
    then publicNamespace
    else import (<fractalide> + "/support/vm/") {inherit pkgs support;
      contracts = allContracts;
      components = allComponents;
      exeSubnet = exeSubnet;};
in
  result
