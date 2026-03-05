{ config, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Definte Hostname
  networking = {
    hostname = "home-desktop";
    networkmanager.enable = true;
  };

  # Select Internationalisation Properties
  il8n.defaultLocale = "en_CA.UTF-8";

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Enable sound with Pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  programs.fish.enable = true;

  # Enable SDDM Login Manager and set Hyprland as default Session
  programs.hyprland.enable = true;
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    defaultSession = "hyprland-uwsm";
  };
} 