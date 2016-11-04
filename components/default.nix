{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
  http = callPackage ./http {};
  raw_text = callPackage ./rawtext {};
  test = callPackage ./test {};
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
self
