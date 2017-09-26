{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  capnp_edges = with edges.capnp; [ PrimText NetHttpRequest NetHttpResponse ];
  mods = with mods.rs; [ rustfbp capnp ];
  osdeps = with pkgs; [ ];
}
