{ buffet }:

let
callPackage = buffet.pkgs.lib.callPackageWith (buffet // buffet.support );
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
  http = callPackage ./http {};
  rawtext = callPackage ./rawtext {};
  test = callPackage ./test {};
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
self
