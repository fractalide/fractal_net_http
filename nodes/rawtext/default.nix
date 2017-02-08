{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimText NetHttpRequest NetHttpResponse ];
  crates = with crates; [ rustfbp capnp ];
  osdeps = with pkgs; [ ];
}
