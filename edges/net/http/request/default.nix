{ edge, edges }:

edge {
  src = ./.;
  edges =  with edges; [ net_http_request_method net_http_request_header net_http_request_version];
  schema = with edges; ''
    @0x992391bf15f6322d;

    using NetHttpRequestMethod = import "${net_http_request_method}/src/edge.capnp";
    using NetHttpRequestHeader = import "${net_http_request_header}/src/edge.capnp";
    using NetHttpRequestVersion = import "${net_http_request_version}/src/edge.capnp";

    struct NetHttpRequest {
      id @0 :UInt64;
      url @1 :Text;
      method @2 :NetHttpRequestMethod.NetHttpRequestMethod;
      headers @3 :List(NetHttpRequestHeader.NetHttpRequestHeader);
      httpVersion @4 :NetHttpRequestVersion.NetHttpRequestVersion;
      content @5 :Text;
    }
  '';
}
