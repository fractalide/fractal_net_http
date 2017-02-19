{ subgraph, imsg, nodes, edges }:
let
  NetHttpAddress = imsg {
    class = edges.NetHttpEdges.NetHttpAddress;
    text = ''(address="0.0.0.0:8000")'';
  };
  PrimText1 = imsg { class = edges.PrimText; text = ''(text="Hello world")''; };
  PrimText2 = imsg { class = edges.PrimText; text = ''(text="Hello fractalide")''; };
  PrimText3 = imsg { class = edges.PrimText; text = ''(text="Hello fractalide with ID")''; };
  PrimText4 = imsg { class = edges.PrimText; text = ''(text="Hello fractalide with Post!")''; };
in
subgraph {
  src = ./.;
  flowscript = with nodes.rs; ''
  http(${http})
  '${NetHttpAddress}' -> listen http()
  '${PrimText1}' -> option world(${rawtext})
  '${PrimText2}' -> option fractalide(${rawtext})
  '${PrimText3}' -> option fractalideID(${rawtext})
  '${PrimText4}' -> option fractalideP(${rawtext})

  http() GET[^/$] -> input world() output -> response http()
  http() GET[^/fractalide] -> input fractalide() output -> response http()
  http() GET[^/fractalide/.+] -> input fractalideID() output -> response http()

  http() POST[/fractalide] -> input fractalideP() output -> response http()
  '';
}
