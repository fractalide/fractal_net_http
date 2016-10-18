{ fractalide ? import (fetchTarball https://github.com/fractalide/fractalide/archive/4c2ee3a8acdd6227fc34eded938c3ff205c055d0.tar.gz) {}
  , pkgs ? fractalide.pkgs
  , support ? fractalide.support
  , contracts ? fractalide.contracts
  , components ? fractalide.components}:
let
  all_contracts = contracts // import ./contracts {inherit pkgs support all_contracts ;};
  all_components = components // import ./components {inherit pkgs support all_components all_contracts;};
in
# the top level subnet you want to expose to the fractalide repo
all_components.vendor_test_nand
