{ stdenv, openssl
  , buildFractalideComponent
  , genName, upkeepers
  , net_http_address
  , net_http_request
  , net_http_response
  , ...}:

buildFractalideComponent rec {
  name = genName ./.;
  src = ./.;
  contracts = [ net_http_address net_http_request net_http_response ];
  buildInputs = [ openssl ];
  depsSha256 = "0ajp4pg8m45bs39ym0ps3gp8xpxjb4cw9y9kfmwghhhp54dwzqni";

  meta = with stdenv.lib; {
    description = "Component: net http";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/maths/boolean/nand;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
