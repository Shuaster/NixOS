{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    signal-desktop
  ];
}