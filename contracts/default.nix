{ pkgs, support, allContracts, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // allContracts // support);
in
rec {
  example_satellite_repo_boolean = callPackage ./example/satellite/repo/boolean {};
}
