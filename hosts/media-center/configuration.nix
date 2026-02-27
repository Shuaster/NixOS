{ config, inputs, lib, pkgs, ... }:

{
   # Include the results of the hardware scan.
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Define Hostname
  networking.hostName = "media-center";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.videoDrivers = [ "modesetting" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # VAAPI for hardware video decoding
      intel-compute-runtime # OpenCL Support
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  # Enable GameScope, the SteamOS session compositing window manager
  programs.gamescope = {
    enable = true;
    capSysNice = true;

    args = [
      "--expose-wayland"
    ];
  };

  # Enable Steam with Gamescope Support
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];

    # Open ports in firewall for Steam specific features
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Enable Controller Support
  hardware.steam-hardware.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

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

  # Install firefox.
  programs.firefox.enable = true;

  programs.fish.enable = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    git
    vscodium
  ];
  
  system.stateVersion = "25.11";
}
