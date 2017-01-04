{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ net_http_address net_http_request net_http_response ];
  crates = with crates; [ rustfbp capnp tiny_http regex ];
  osdeps = with pkgs; [ openssl ];
}
