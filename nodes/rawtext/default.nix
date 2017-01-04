{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ prim_text net_http_request net_http_response ];
  crates = with crates; [ rustfbp capnp ];
  osdeps = with pkgs; [ ];
}
