{ config, pkgs, ... }:

{
  imports =[ 
    ./hardware-configuration.nix
  ];

  # Define System Hostname
  networking.hostName = "zeus-desktop";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

#  services.xserver = {
 #   enable = true;
  #  displayManager.gdm.enable = true;
   # desktopManager.gnome.enable = true;
 # };

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
