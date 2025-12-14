{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsa-utils # Advanced Linux Sound Architecture Utils
    helvum
    pavucontrol
    pulseaudio # Used for Pulseadio Utils
  ];
}