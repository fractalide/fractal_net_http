{ pkgs, support, allContracts, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // allContracts // support);
in
rec {
  address = callPackage ./address {};
  request = callPackage ./request {};
  response = callPackage ./response {};
}
