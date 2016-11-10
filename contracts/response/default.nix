{stdenv, buildFractalideContract, upkeepers, ...}:

buildFractalideContract rec {
  src = ./.;
  contract = ''
  @0xb10b096b4e676688;

  struct Response {
    id @0 :UInt64;
    response @1 :Text;
    statusCode @2 :UInt32 = 200;
  }
  '';

  meta = with stdenv.lib; {
    description = "Contract: Describes an http response";
    homepage = https://github.com/fractalide/fractalide/tree/master/contracts/maths/boolean;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
