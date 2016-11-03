{ stdenv, openssl
  , buildFractalideComponent
  , genName, upkeepers
  , generic_text
  , net_http_request
  , net_http_response
  , ...}:

buildFractalideComponent rec {
  name = genName ./.;
  src = ./.;
  contracts = [ generic_text net_http_request net_http_response ];
  depsSha256 = "0fkqkrh9v4q4b13mr5bng434b6wf0w4d28v830vsqls8fz5qzanq";

  meta = with stdenv.lib; {
    description = "Component: build a response from a text option";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/maths/boolean/nand;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
