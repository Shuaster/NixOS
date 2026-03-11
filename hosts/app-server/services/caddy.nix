{ config, ... }: {
  services.caddy = {
    enable = true;
    globalConfig = ''
      auto_https off
    '';
    virtualHosts."immich.app-server.goose-goanna.ts.net" = {
      extraConfig = ''
        tls {
          get_certificate tailscale
        }
        reverse_proxy localhost:2282
      '';
    };

    virtualHosts."vaultwarden.app-server.goose-goanna.ts.net" = {
      extraConfig = ''
        tls {
          get_certificate tailscale
        }
        reverse_proxy localhost:8222
      '';
    };

  };

  # Allow Caddy to get Tailscale Certs
  systemd.services.caddy.serviceConfig.AmbientCapabilities = "CAP_NET_BIND_SERVICE";

  services.tailscale.permitCertUid = "caddy";

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
