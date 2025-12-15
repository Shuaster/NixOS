{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        ignore_empty_input = true;
      };

      background = {
        path = "screenshot";
        blur_passes = 3;
      };

      input-field = [
        {
          monitor = "DP-1";

          size = "300, 50";

          dots_center = true;
          dots_size = 0.2;
          dots_spacing = 0.2;

          font_color = "rgb(200, 200, 200)";
          font_family = "JetBrains Mono";

          inner_color = "rgba(255, 255, 255, 0.1)";
          outer_color = "rgba(255, 255, 255, 0)";

          position = "0, -200";
          halign = "center";
          valign = "center";
          fade_on_empty = false;
        }
      ];

      label = [
        # Time
        {
          monitor = "DP-1";

          font_family = "JetBrains Mono Extrabold";
          font_size = "150";

          text = "$TIME12";
        }
      ];
    };
  } ;
}