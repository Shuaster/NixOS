{ config, pkgs, inputs, ... }: {
  imports = [
      ./hardware-configuration.nix
  ];

  # Define Hostname
  networking.hostName = "zenbook-laptop";

  # Enable networking
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  services.libinput.enable = true;

  # Enable SDDM Login Manager and set Hyprland as default Session
  programs.hyprland.enable = true;
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    defaultSession = "hyprland-uwsm";
  };

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    allowSFTP = true;
  };

  system.stateVersion = "25.11";
}
