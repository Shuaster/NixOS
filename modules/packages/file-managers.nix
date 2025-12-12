{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    nautilus
    xfce.thunar
  ];
}