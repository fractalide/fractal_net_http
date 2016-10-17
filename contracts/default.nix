{ pkgs, support, contracts, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // contracts // support);
in
rec {
  vendor_maths_boolean = callPackage ./vendor/maths/boolean {};
}
