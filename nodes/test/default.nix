{ subgraph, nodes, edges }:

subgraph {
  src = ./.;
  edges = with edges; [ net_http_address prim_text ];
  flowscript = with nodes; with edges; ''
  http(${http})
  '${net_http_address}:(address="0.0.0.0:8000")' -> listen http()

  '${prim_text}:(text="Hello world")' -> option world(${rawtext})
  '${prim_text}:(text="Hello fractalide")' -> option fractalide(${rawtext})
  '${prim_text}:(text="Hello fractalide with ID")' -> option fractalideID(${rawtext})
  '${prim_text}:(text="Hello fractalide with Post!")' -> option fractalideP(${rawtext})

  http() GET[^/$] -> input world() output -> response http()
  http() GET[^/fractalide] -> input fractalide() output -> response http()
  http() GET[^/fractalide/.+] -> input fractalideID() output -> response http()

  http() POST[/fractalide] -> input fractalideP() output -> response http()
  '';
}
