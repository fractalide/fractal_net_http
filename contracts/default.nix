{ pkgs, support, allContracts, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // allContracts // support);
in
rec {
  vendor_maths_boolean = callPackage ./vendor/maths/boolean {};
}
