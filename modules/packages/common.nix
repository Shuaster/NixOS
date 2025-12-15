{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # Version Control / Networking
    curl
    git
    openssh
    wget

    # Editors
    vscodium

    bitwarden-desktop
    kdePackages.kdeconnect-kde

    # Useful Utilities
    tree
    unzip
    zip
  ];
}
