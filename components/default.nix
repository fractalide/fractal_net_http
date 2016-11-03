{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
  http = callPackage ./net/http {};
  raw_text = callPackage ./net/rawtext {};
  test = callPackage ./net/test {};
  c_address = allContracts.net_address;
  c_request = allContracts.net_request;
  c_response = allContracts.net_response;
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
{ net_http = self; }
