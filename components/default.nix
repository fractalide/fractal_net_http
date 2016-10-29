{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
  workbench_nand = callPackage ./workbench/nand {};
  workbench_test = callPackage ./workbench/test {};
  net_hyper = callPackage ./net/hyper {};
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
self
