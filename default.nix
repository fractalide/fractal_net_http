{}:
let
  fractalide_repo = https://github.com/fractalide/fractalide/archive/7db197c99f145ee0e7506f8c5f7d71d128dbd67a.tar.gz;
  fractalide = import (fetchTarball fractalide_repo) {};
  pkgs = fractalide.pkgs;
  support = fractalide.support;
  contracts = fractalide.contracts // import ./contracts {inherit pkgs support contracts ;};
  components = fractalide.components // import ./components {inherit pkgs support components contracts;};
in
components.vendor_test_nand
