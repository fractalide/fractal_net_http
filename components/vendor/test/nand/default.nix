{ stdenv, buildFractalideSubnet, upkeepers
  , vendor_maths_boolean_nand
  , maths_boolean_print
  # contracts
  , vendor_maths_boolean
  , maths_boolean
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
  '${vendor_maths_boolean}:(boolean=true)' -> a nand(${vendor_maths_boolean_nand}) output -> input io_print(${maths_boolean_print})
  '${maths_boolean}:(boolean=true)' -> b nand()
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for sjm";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
