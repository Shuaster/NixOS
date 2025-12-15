{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;

      preload = [
        "/home/joshua/Pictures/Wallpapers/casseteCover.png"
      ];

      wallpaper = [
        "DP-1,/home/joshua/Pictures/Wallpapers/casseteCover.png"
        "HDMI-A-1,/home/joshua/Pictures/Wallpapers/casseteCover.png"
      ];
    };
  };
}