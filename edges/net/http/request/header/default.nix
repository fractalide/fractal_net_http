{ edge, edges }:

edge {
  src = ./.;
  edges =  with edges; [];
  schema = with edges; ''
    @0xeb9434b778213d38;

    struct NetHttpRequestHeader {
      key @0 :Text;
      value @1 :Text;
    }


  '';
}
