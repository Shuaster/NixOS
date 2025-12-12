{ config, pkgs, ... }:

{
  # Enable Nvidia Drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable Wayland Support
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [ nvidia_x11 ];

  # Enable Modesettings
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  environment.sessionVariables = {
    # Use GBM Backend
    WLR_BACKENDS = "gbm";
  };
}