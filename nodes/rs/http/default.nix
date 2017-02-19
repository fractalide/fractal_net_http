{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ NetHttpAddress NetHttpRequest NetHttpResponse ];
  mods = with mods.rs; [ rustfbp capnp tiny_http regex ];
  osdeps = with pkgs; [ openssl ];
}
