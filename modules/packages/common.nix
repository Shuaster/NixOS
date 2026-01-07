{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # Version Control / Networking
    curl
    git
    openssh
    wget

    socat

    obsidian

    cifs-utils # SMB Utilities

    # Editors
    vscodium

    bitwarden-desktop
    kdePackages.kdeconnect-kde

    networkmanagerapplet

    # Useful Utilities
    tree
    unzip
    zip
  ];
}
