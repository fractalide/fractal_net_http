{ pkgs, support, allContracts, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // allContracts // support);
in
rec {
  net_address = callPackage ./net/address {};
  net_request = callPackage ./net/request {};
  net_response = callPackage ./net/response {};
}
