{ config, pkgs, ... }:

{
  # Enable systemd Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Skip the bootloader menu
  boot.loader.timeout = 0;

  boot.kernelParams = [ "quiet" "loglevel=0" "splash" "systemd.show_status=false" ];

  boot.plymouth.enable = true;

  # Use the latest Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
}