{ edge, edges }:

edge {
  src = ./.;
  edges =  with edges; [];
  schema = with edges; ''
    struct NetHttpAddress {
      address @0 :Text;
    }
  '';
}
