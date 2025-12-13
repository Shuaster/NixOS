{ config, pkgs, ... }:

{
  # Enable Nvidia Drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    # Disable Power Management
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    #open = true;
    open = false;

    # Enable Nvidia settings menu
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
  ];

  environment.sessionVariables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
