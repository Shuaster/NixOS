{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;

        output = [
          "DP-1"
        ];

        modules-left = [];

        modules-center = [ "hyprland/workspaces" ];

        modules-right = [ "clock" ];

        clock = {
          format = "{:%I:%M %p}";
        };

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "DP-1" = [ 1 3 5 7 9 ];
          };

          format = "{icon}";
          icon-size = 30;
          format-icons = {
            default = "○";   # inactive
            active = "●";    # active
          };
        };
      };
    };
  };
}