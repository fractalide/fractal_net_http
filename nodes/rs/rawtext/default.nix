{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimText NetHttpRequest NetHttpResponse ];
  mods = with mods.rs; [ rustfbp capnp ];
  osdeps = with pkgs; [ ];
}
