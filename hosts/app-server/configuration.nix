{ config, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

# Networking
  networking = {
    hostname = "app-server";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
      trustedInterfaces = [ "tailscale0" ];
    };
  };

# Graphics Settings
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = false;
    open = false;
    nvidiaSettings = false;
    powerManagement.enable = true;
  };

  hardware.nvidia-container-toolkit.enable = true;

# SSH
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
    };

    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];

    allowSFTP = true;
  };

# Packages
  environment.systemPackages = with pkgs; [
    git
    htop
  ];

  system.stateVersion = "25.11";
}
