{ pkgs, support, allContracts, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // allContracts // support);
in
rec {
  example_workspace_boolean = callPackage ./example/workspace/boolean {};
}
