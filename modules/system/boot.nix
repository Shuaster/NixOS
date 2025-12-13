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

  # Autologin into Hyprland using GreetD
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "joshua";
      };

      # Maybe change this so you're able to exit Hyprland and stay in a TTY
      default_session = initial_session;
    };
  };
}