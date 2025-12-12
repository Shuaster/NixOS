{ config, pkgs, ... }:

{
  imports =[ 
    ./hardware-configuration.nix
  ];

  # Define System Hostname
  networking.hostName = "helios-laptop";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable Services for Power Profile Management
  services.power-profiles-daemon.enable = true;
  services.tlp.enable = true;

  # Enable Backlight Adjustment
  programs.light.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.joshua = {
    isNormalUser = true;
    description = "Joshua";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11"; # Did you read the comment?
}
