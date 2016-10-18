{ stdenv, buildFractalideSubnet, upkeepers
  , vendor_maths_boolean_nand
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   a => a nand(${vendor_maths_boolean_nand}) output => output
   b => b nand()
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for sjm";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
