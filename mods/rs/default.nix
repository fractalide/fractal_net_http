{ buffet }:
let
  build-rust-package = buffet.support.node.rs.build-rust-package;
  pkgs = buffet.pkgs;
  verbose  = buffet.verbose;
  release  = buffet.release;
in
  import ./crates { inherit build-rust-package pkgs release verbose; }
