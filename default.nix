{ fractalide ? import <fractalide> {}
  , pkgs ? fractalide.pkgs
  , support ? fractalide.support
  , contracts ? fractalide.contracts
  , components ? fractalide.components
  , fractalide_user ? null
  , config_file ? null}:
let
  exeSubnet = fracComponents.test;
  publicNamespace = { components = fracComponents; contracts = fracContracts; };
  fracContracts = import ./contracts {inherit pkgs support allContracts;};
  fracComponents = import ./components {inherit pkgs support allContracts allComponents;};
  allContracts = contracts // fracContracts;
  allComponents = components // fracComponents // { encrypt = encrypt; };
  encrypt = support.encryptComponent {
      fractalide_user = fractalide_user;
      keybase_config_file = config_file; };
  result = if fractalide == null
    then publicNamespace
    else import (<fractalide> + "/support/vm/") {inherit pkgs support;
      contracts = allContracts;
      components = allComponents;
      exeSubnet = exeSubnet;};
in
  result
