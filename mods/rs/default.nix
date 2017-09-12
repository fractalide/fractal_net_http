{ buffet }:
let
  verbose  = buffet.verbose;
  release  = buffet.release;
  fetchzip = buffet.pkgs.fetchzip;
  buildRustCode = buffet.support.rs.buildRustCode;
in
  import ./crates { inherit buildRustCode fetchzip release verbose; }
