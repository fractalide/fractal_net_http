{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ NetHttpAddress NetHttpRequest NetHttpResponse ];
  crates = with crates; [ rustfbp capnp tiny_http regex ];
  osdeps = with pkgs; [ openssl ];
}
