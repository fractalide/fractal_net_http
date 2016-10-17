{}:
let
  fractalide_repo = https://github.com/fractalide/fractalide/archive/7db197c99f145ee0e7506f8c5f7d71d128dbd67a.tar.gz;
  fractalide = import (fetchTarball fractalide_repo) {};
  pkgs = fractalide.pkgs;
  support = fractalide.support;
  vendor_contracts = import ./contracts {inherit pkgs support; contracts = all_contracts ;};
  all_contracts = vendor_contracts // fractalide.contracts;
  vendor_components = import ./components {inherit pkgs support all_components; contracts = all_contracts;};
  all_components = vendor_components // fractalide.components;
in
all_components.vendor_test_nand
