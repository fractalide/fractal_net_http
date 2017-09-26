{ edge, edges }:

edge.capnp {
  src = ./.;
  edges =  with edges; [];
  schema = with edges; ''
    struct NetHttpRequestHeader {
      key @0 :Text;
      value @1 :Text;
    }
  '';
}
