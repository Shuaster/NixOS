{ pkgs, ... }: {
  imports = [
    ./hyprland.nix
    ./udiskie.nix
    ./vicinae.nix
    ./wayland.nix
  ];

  home.packages = with pkgs; [
    brightnessctl # Read and Control Display Brightness
    overskride # Bluetooth GUI
    playerctl # Media Control Library
  ];
}