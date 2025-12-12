{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hypridle # Idle Daemon
    hyprlock # Lock Screen
    hyprpaper # Wallpaper Service
    hyprshot # Screenshot Service
    hyprviz # GUI Hyprland Configurator

    kitty # Hyprland Terminal Emulator
    
    libnotify # Notification Library
    rofi # Application Launcher
    swaynotificationcenter # Notification Daemon
    waybar # Status Bar
  ];
}