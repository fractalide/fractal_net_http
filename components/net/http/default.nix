{ stdenv, openssl
  , buildFractalideComponent
  , genName, upkeepers
  , net_address
  , net_request
  , net_response
  , ...}:

buildFractalideComponent rec {
  name = genName ./.;
  src = ./.;
  contracts = [ net_address net_request net_response ];
  buildInputs = [ openssl ];
  depsSha256 = "1ila2j76y92ml8c54192qndh0mfjhqqi9a88qifwsazga2qza61a";

  meta = with stdenv.lib; {
    description = "Component: net http";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/maths/boolean/nand;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
