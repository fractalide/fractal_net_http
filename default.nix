{
  fractalide ? import <fractalide> {}
  , pkgs ? fractalide.pkgs
  , support ? fractalide.support
  , edges ? fractalide.edges
  , nodes ? fractalide.nodes
  , crates ? fractalide.crates
  , node ? "test"
}:
let
  defaultNode = (builtins.head (pkgs.lib.attrVals [node] fractalNodes));
  buffet = {
    nodes = nodes // fractalNodes;
    edges = edges // fractalEdges;
    support = support;
    crates = crates;
    pkgs = pkgs;
  };
  fractalEdges = import ./edges { inherit buffet; };
  fractalNodes = import ./nodes { inherit buffet; };
  fvm = import (<fractalide> + "/support/fvm/") {inherit pkgs support;
    edges = edges;
    nodes = nodes;
    crates = crates;
  };
  test = pkgs.writeTextFile {
    name = defaultNode.name;
    text = "${fvm}/bin/fvm ${defaultNode}";
    executable = true;
  };
in
{ nodes = fractalNodes; edges = fractalEdges; test = test; service = ./service.nix; }
