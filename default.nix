{
  fractalide ? import <fractalide> {}
  , buffet ? fractalide.buffet
  , node ? "test"
}:
let
  defaultNode = (builtins.head (buffet.pkgs.lib.attrVals [node] fractalNodes));
  newBuffet = {
    nodes = buffet.nodes // fractalNodes;
    edges = buffet.edges // fractalEdges;
    support = buffet.support;
    imsg = buffet.imsg;
    crates = buffet.crates;
    pkgs = buffet.pkgs;
  };
  fractalEdges = import ./edges { buffet = newBuffet; };
  fractalNodes = import ./nodes { buffet = newBuffet; };
  fvm = import (<fractalide> + "/support/fvm/") { buffet = newBuffet; };
  test = buffet.pkgs.writeTextFile {
    name = defaultNode.name;
    text = "${fvm}/bin/fvm ${defaultNode}";
    executable = true;
  };
in
{ nodes = fractalNodes; edges = fractalEdges; test = test; service = ./service.nix; }
