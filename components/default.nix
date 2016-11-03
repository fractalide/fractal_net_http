{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
  net_http = callPackage ./net/http {};
  net_raw_text = callPackage ./net/rawtext {};
  net_test = callPackage ./net/test {};
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
self
