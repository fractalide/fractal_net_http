{ buffet }:
let
  callPackage = buffet.pkgs.lib.callPackageWith ( buffet.support // buffet );
in
rec {
  net_http_address = callPackage ./net/http/address {};
  net_http_request = callPackage ./net/http/request {};
  net_http_request_header = callPackage ./net/http/request/header {};
  net_http_request_method = callPackage ./net/http/request/method {};
  net_http_request_version = callPackage ./net/http/request/version {};
  net_http_response = callPackage ./net/http/response {};
}
