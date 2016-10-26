{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
  example_workspace_nand = callPackage ./example/workspace/nand {};
  example_workspace_test = callPackage ./example/workspace/test {};
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
self
