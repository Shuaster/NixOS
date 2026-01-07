{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;

      preload = [
        "/home/joshua/Pictures/Wallpapers/wallpaper"
      ];

      wallpaper = [
        "DP-1,/home/joshua/Pictures/Wallpapers/wallpaper"
        "HDMI-A-1,/home/joshua/Pictures/Wallpapers/wallpaper"
        "eDP-1,/home/joshua/Pictures/Wallpapers/wallpaper"
      ];
    };
  };
}