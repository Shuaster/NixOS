{ config, lib, pkgs, inputs, ... }:

let
  zfsCompatibleKernelPackages = lib.filterAttrs (
    name: kernelPackages:
    (builtins.match "linux_[0-9]+_[0-9]+" name) != null
    && (builtins.tryEval kernelPackages).success
    && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken)
  ) pkgs.linuxKernel.packages;
  latestKernelPackage = lib.last (
    lib.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (
      builtins.attrValues zfsCompatibleKernelPackages
    )
  );
in
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "370acf59";

# Networking
  networking = {
    hostName = "app-server";
    firewall = {
      enable = true;
      # allowedTCPPorts = [ 22 ];
      # trustedInterfaces = [ "tailscale0" ];
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
  boot.kernelPackages = lib.mkForce latestKernelPackage;

  environment.systemPackages = with pkgs; [
    git
    htop
  ];

  system.stateVersion = "25.11";
}
