{ pkgs, ... }: {
  imports = [
    ./hyprland.nix
    ./wayland.nix
  ];

  home.packages = with pkgs; [
    brightnessctl # Read and Control Display Brightness
    playerctl # Media Control Library
  ];
}