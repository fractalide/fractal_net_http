{ stdenv, buildFractalideSubnet, upkeepers
  , generic_text
  , http
  , rawtext
  # contracts
  , address
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   http(${http})
   '${address}:(address="0.0.0.0:8000")' -> listen http()

   '${generic_text}:(text="Hello world")' -> option world(${rawtext})
   '${generic_text}:(text="Hello fractalide")' -> option fractalide(${rawtext})
   '${generic_text}:(text="Hello fractalide with ID")' -> option fractalideID(${rawtext})
   '${generic_text}:(text="Hello fractalide with Post!")' -> option fractalideP(${rawtext})

   http() GET[^/$] -> input world() output -> response http()
   http() GET[^/fractalide] -> input fractalide() output -> response http()
   http() GET[^/fractalide/.+] -> input fractalideID() output -> response http()

   http() POST[/fractalide] -> input fractalideP() output -> response http()
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
