{ config, pkgs, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernal
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Define Hostname
  networking.hostName = "zenbook-laptop";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

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

  services.xserver.libinput.enable = true;

  programs.firefox.enable = true;
  programs.fish.enable = true;


  environment.systemPackages = with pkgs; [
    git
    vscodium
    # inputs.zen-browser.packages."${stdenv.hostPlatform.system}".twilight
  ];

  system.stateVersion = "25.11";
}
