{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        ignore_empty_input = true;
      };

      background = {
        path = "/home/joshua/Pictures/Wallpapers/wallpaper";
        blur_passes = 2;
      };

      # Input Field
      input-field = [
        {
          monitor = "eDP-1";

          size = "300, 50";

          dots_center = true;
          dots_size = 0.2;
          dots_spacing = 0.2;

          font_color = "rgb(200, 200, 200)";
          font_family = "JetBrains Mono";

          inner_color = "rgba(64, 64, 64, 0.5)";
          outer_color = "rgba(255, 255, 255, 0)";

          capslock_color = "rgba(220, 50, 50, 0.75)";

          position = "0, 200";
          halign = "center";
          valign = "bottom";
          fade_on_empty = false;
        }
      ];

      label = [
        # Time
        {
          monitor = "eDP-1";

          text = "$TIME12";

          font_family = "JetBrains Mono Extrabold";
          font_size = "120";

          position = "0, 200";
          halign = "center";
          valign = "center";
        }

        # Reboot
        {
          monitor = "DP-1";

          text = "";
          onclick = "reboot now";

          font_size = "30";
          font_family = "Font Awesome 7 Free Solid";

          position = "-200, 100";
          halign = "center";
          valign = "bottom";
        }

        # Power Off
        {
          monitor = "DP-1";

          text = "";
          onclick = "shutdown now";

          font_size = "30";
          font_family = "Font Awesome 7 Free Solid";

          position = "0, 100";
          halign = "center";
          valign = "bottom";
        }

        # Sleep
        {
          monitor = "DP-1";

          text = "";
          onclick = "systemctl suspend";

          font_size = "30";
          font_family = "Font Awesome 7 Free Solid";

          position = "200, 100";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  } ;
}