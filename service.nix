{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.fractalide.net_http;
  fractalide = import <fractalide> {};
  support = fractalide.support;
  edges = fractalide.edges;
  nodes = fractalide.nodes;
  fractal = import ./default.nix { inherit pkgs support edges nodes;
    fractalide = null;
  };
  serviceSubgraph = support.subgraph rec {
    src = ./.;
    name = "net_http_service";
    subnet = ''
    '${edges.net_http_edges.address}:(address="${cfg.bindAddress}:${toString cfg.port}")' -> listen net_http(${fractal.nodes.net_http})
    '${edges.path}:(path="${cfg.dbPath}/${cfg.dbName}")' -> db_path net_http()
    '';
  };
  fvm = import (<fractalide> + "/support/fvm/") {inherit pkgs support edges nodes;};
in
{
  options.services.fractalide.net_http = {
    enable = mkEnableOption "Fractalide Workbench Example";
    package = mkOption {
      default = serviceSubnet;
      defaultText = "fractalComponents.net_http";
      type = types.package;
      description = ''
        Workbench example.
      '';
    };
    user = mkOption {
      type = types.str;
      default = "net_http";
      description = "User account under which net_http runs.";
    };
    bindAddress = mkOption {
      type = types.string;
      default = "127.0.0.1";
      description = ''
        Defines the IP address by which net_http will be accessible.
      '';
    };
    port = mkOption {
      type = types.int;
      default = 8080;
      description = ''
        Defined the port number to listen.
      '';
    };
    dbName = mkOption {
      type = types.str;
      default = "todos.db";
      description = "the database file name.";
    };
    dbPath = mkOption {
      type = types.path;
      default = "/var/fractalide/net_http";
      description = "The DB will be written to this directory, with the filename specified using the 'dbName' configuration.";
    };
    openFirewall = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Whether to open ports in the firewall for the server.
      '';
    };
  };
  config = mkIf cfg.enable {
    networking.firewall = mkIf cfg.openFirewall {
      allowedTCPPorts = [ cfg.port ];
    };
    users.extraUsers.net_http = {
      name = cfg.user;
      #uid = config.ids.uids.net_http;
      description = "Workbench database user";
    };
    systemd.services.fractalide.net_http_init = {
      description = "Workbench Server Initialisation";
      wantedBy = [ "net_http.service" ];
      before = [ "net_http.service" ];
      serviceConfig.Type = "oneshot";
      script = ''
        install -d -m0700 -o ${cfg.user} ${cfg.dbPath}
        chown -R ${cfg.user} ${cfg.dbPath}
      '';
    };
    systemd.services.fractalide.net_http = {
      description = "Workbench example";
      path = [ cfg.package ];
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        PermissionsStartOnly = true;
        Restart = "always";
        ExecStart = "${fvm}/bin/fvm ${cfg.package}";
        User = cfg.user;
      };
    };
    environment.systemPackages = [ fvm cfg.package ];
  };
}
