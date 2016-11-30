{ contract, contracts }:

contract {
  src = ./.;
  contracts =  with contracts; [ ];
  schema = with contracts; ''
  @0xb10b096b4e676688;

  struct Response {
    id @0 :UInt64;
    response @1 :Text;
    statusCode @2 :UInt32 = 200;
  }
  '';
}
