{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ address request response ];
  crates = with crates; [ rustfbp capnp tiny_http regex ];
  osdeps = with pkgs; [ openssl ];
}
