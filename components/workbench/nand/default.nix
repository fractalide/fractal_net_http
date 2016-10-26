{ stdenv
  , buildFractalideComponent
  , genName, upkeepers
  , workbench_boolean
  , ...}:

buildFractalideComponent rec {
  name = genName ./.;
  src = ./.;
  contracts = [ workbench_boolean ];
  depsSha256 = "0fkqkrh9v4q4b13mr5bng434b6wf0w4d28v830vsqls8fz5qzanq";

  meta = with stdenv.lib; {
    description = "Component: NAND logic gate";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/maths/boolean/nand;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
