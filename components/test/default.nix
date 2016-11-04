{ stdenv, buildFractalideSubnet, upkeepers
  , generic_text
  , net_http
  # contracts
  , net_http_address
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   net_http(${net_http.http})
   '${net_http_address}:(address="0.0.0.0:8000")' -> listen net_http()

   '${generic_text}:(text="Hello world")' -> option world(${net_http.raw_text})
   '${generic_text}:(text="Hello fractalide")' -> option fractalide(${net_http.raw_text})
   '${generic_text}:(text="Hello fractalide with ID")' -> option fractalideID(${net_http.raw_text})
   '${generic_text}:(text="Hello fractalide with Post!")' -> option fractalideP(${net_http.raw_text})

   net_http() GET[^/$] -> input world() output -> response net_http()
   net_http() GET[^/fractalide] -> input fractalide() output -> response net_http()
   net_http() GET[^/fractalide/.+] -> input fractalideID() output -> response net_http()

   net_http() POST[/fractalide] -> input fractalideP() output -> response net_http()
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
