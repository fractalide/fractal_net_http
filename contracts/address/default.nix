{ contract, contracts }:

contract {
  src = ./.;
  contracts =  with contracts; [ ];
  schema = with contracts; ''
  @0x8bb5b850bcfc82e6;

  struct Address {
    address @0 :Text;
  }
  '';
}
