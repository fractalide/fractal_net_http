{ pkgs, support, all_contracts, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // all_contracts // support);
in
rec {
  vendor_maths_boolean = callPackage ./vendor/maths/boolean {};
}
