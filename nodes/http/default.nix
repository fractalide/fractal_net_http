{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ address request response ];
  crates = with crates; [ ];
  osdeps = with pkgs; [ openssl ];
  depsSha256 = "01nv2hmshafkf23ygcw771y8nb02fc0zvww06im223gknp4w9mz1";
}
