{ pkgs, support, all_contracts, all_components, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // all_contracts // all_components);
self = rec {
  vendor_maths_boolean_nand = callPackage ./vendor/maths/boolean/nand {};
  vendor_test_nand = callPackage ./vendor/test/nand {};
};
in
self
