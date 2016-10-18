{ fractalide ? import (fetchTarball https://github.com/fractalide/fractalide/archive/master.tar.gz) {}
  , pkgs ? fractalide.pkgs
  , support ? fractalide.support
  , contracts ? fractalide.contracts
  , components ? fractalide.components}:
let
  all_contracts = contracts // import ./contracts {inherit pkgs support all_contracts ;};
  all_components = components // import ./components {inherit pkgs support all_components all_contracts;};
in
all_components.vendor_test_nand
