{ stdenv, openssl
  , buildFractalideComponent
  , genName, upkeepers
  , address
  , request
  , response
  , ...}:

buildFractalideComponent rec {
  name = genName ./.;
  src = ./.;
  contracts = [ address request response ];
  buildInputs = [ openssl ];
  depsSha256 = "01nv2hmshafkf23ygcw771y8nb02fc0zvww06im223gknp4w9mz1";

  meta = with stdenv.lib; {
    description = "Component: net http";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/maths/boolean/nand;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
