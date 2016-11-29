{ component, contracts, crates, pkgs }:

component {
  src = ./.;
  contracts = with contracts; [ address request response ];
  crates = with crates; [ ];
  osdeps = with pkgs; [ openssl ];
  depsSha256 = "01nv2hmshafkf23ygcw771y8nb02fc0zvww06im223gknp4w9mz1";
}
