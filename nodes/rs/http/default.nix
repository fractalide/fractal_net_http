{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  capnp_edges = with edges.capnp; [ NetHttpAddress NetHttpRequest NetHttpResponse ];
  mods = with mods.rs; [ rustfbp capnp tiny_http regex ];
  osdeps = with pkgs; [ openssl ];
}
