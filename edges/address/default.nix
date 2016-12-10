{ edge, edges }:

edge {
  src = ./.;
  edges =  with edges; [];
  schema = with edges; ''
  @0x8bb5b850bcfc82e6;

  struct Address {
    address @0 :Text;
  }
  '';
}
