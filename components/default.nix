{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
  example_satellite_repo_nand = callPackage ./example/satellite/repo/nand {};
  example_satellite_repo_test = callPackage ./example/satellite/repo/test {};
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
self
