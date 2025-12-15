{ config, pkgs, ... }:

{
  home.username = "joshua";
  home.homeDirectory = "/home/joshua";

  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./kdeconnect.nix
  ];

  home.stateVersion = "25.11";
}