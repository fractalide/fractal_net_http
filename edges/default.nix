{ buffet }:
let
  callPackage = buffet.pkgs.lib.callPackageWith ( buffet.support // buffet );
in
rec {
  address = callPackage ./address {};
  request = callPackage ./request {};
  response = callPackage ./response {};
}
