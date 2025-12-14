{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsa-utils # Advanced Linux Sound Architecture Utils
    pulseaudio # Used for Pulseadio Utils
  ];
}