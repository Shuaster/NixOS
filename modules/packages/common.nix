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

    firefox

    # Useful Utilities
    tree
    unzip
    zip
  ];
}
