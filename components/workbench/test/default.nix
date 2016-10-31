{ stdenv, buildFractalideSubnet, upkeepers
  , generic_text
  , net_http
  , net_raw_text
  # contracts
  , net_address
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   net_http(${net_http})
   '${net_address}:(address="0.0.0.0:8000")' -> listen net_http()

   '${generic_text}:(text="Hello world")' -> option world(${net_raw_text})
   '${generic_text}:(text="Hello fractalide")' -> option fractalide(${net_raw_text})

   net_http() get[/] -> input world() output -> response net_http()
   net_http() get[/fractalide] -> input fractalide() output -> response net_http()
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for sjm";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
