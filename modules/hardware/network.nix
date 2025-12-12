{ config, pkgs, ... }:

{
  # Enable Networking
  networking.networkmanager.enable = true;

  networking.firewall = {
    allowedTCPPortRanges = [
      # Open TCP Ports for KDE Connect
      { from = 1714; to = 1764;}
    ];

    allowedUDPPortRanges = [
      # Open UDP Ports for KDE Connect
      { from = 1714; to = 1764; }
    ];
  };

  # Enable Tailscale VPN
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };
}