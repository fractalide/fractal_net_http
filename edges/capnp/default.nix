{ buffet }:
let
  callPackage = buffet.pkgs.lib.callPackageWith ( buffet.support // buffet );
in
{
  NetHttpAddress = callPackage ./net/http/address {};
  NetHttpRequest = callPackage ./net/http/request {};
  NetHttpRequestHeader = callPackage ./net/http/request/header {};
  NetHttpRequestMethod = callPackage ./net/http/request/method {};
  NetHttpRequestVersion = callPackage ./net/http/request/version {};
  NetHttpResponse = callPackage ./net/http/response {};
}
