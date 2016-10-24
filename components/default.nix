{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec {
  example_satellite_repo_nand = callPackage ./example/satellite/repo/nand {};
  example_satellite_repo_test = callPackage ./example/satellite/repo/test {};
};
in
self
