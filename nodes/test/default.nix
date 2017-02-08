{ subgraph, imsgs, nodes, edges }:

subgraph rec {
  src = ./.;
  imsg = imsgs {
    edges = with edges; [ NetHttpAddress PrimText ];
  };
  flowscript = with nodes; ''
  http(${http})
  '${imsg}.NetHttpAddress:(address="0.0.0.0:8000")' -> listen http()

  '${imsg}.PrimText:(text="Hello world")' -> option world(${rawtext})
  '${imsg}.PrimText:(text="Hello fractalide")' -> option fractalide(${rawtext})
  '${imsg}.PrimText:(text="Hello fractalide with ID")' -> option fractalideID(${rawtext})
  '${imsg}.PrimText:(text="Hello fractalide with Post!")' -> option fractalideP(${rawtext})

  http() GET[^/$] -> input world() output -> response http()
  http() GET[^/fractalide] -> input fractalide() output -> response http()
  http() GET[^/fractalide/.+] -> input fractalideID() output -> response http()

  http() POST[/fractalide] -> input fractalideP() output -> response http()
  '';
}
