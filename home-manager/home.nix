{ config, pkgs, ... }:

{
  home.username = "joshua";
  home.homeDirectory = "/home/joshua";

  imports = [
    ./hypridle.nix
    ./hyprpaper.nix
    ./kdeconnect.nix
    ./waybar/waybar.nix
  ];

  home.stateVersion = "25.11";
}