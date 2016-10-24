{ stdenv
  , buildFractalideComponent
  , genName, upkeepers
  , example_satellite_repo_boolean
  , ...}:

buildFractalideComponent rec {
  name = genName ./.;
  src = ./.;
  contracts = [ example_satellite_repo_boolean ];
  depsSha256 = "0w4h8xhirmcaj3g5wmbh2yvj6fy6j6j0nwr1b3i5axhh764i9kmx";

  meta = with stdenv.lib; {
    description = "Component: NAND logic gate";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/maths/boolean/nand;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
