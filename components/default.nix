{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec {
  vendor_maths_boolean_nand = callPackage ./vendor/maths/boolean/nand {};
  vendor_test_nand = callPackage ./vendor/test/nand {};
};
in
self
