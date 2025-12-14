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

    # Useful Utilities
    tree
    unzip
    zip
  ];
}
