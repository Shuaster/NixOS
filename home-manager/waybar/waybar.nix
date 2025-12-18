{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;

        # output = [
        #   "DP-1"
        # ];

        modules-left = [];

        modules-center = [ "hyprland/workspaces" ];

        modules-right = [ "network" "clock" "tray" "custom/notification"];

        clock = {
          interval = 60;
          format = "{:%I:%M}";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "DP-1" = [ 1 3 5 7 9 ];
          };

          format = "";
        };

        "network" = {
          format-ethernet = "";
          format-wifi = "";
          format-disconnected = "";
          
          tooltip = false;
          max-length = 50;
        };

        "tray" = {
          icon-size = 30;
          spacing = 10;
        };

        "custom/notification" = {
          "tooltip" = true;
          "format" = "<span size='16pt'>{icon}</span>";
          "format-icons" = {
            "notification" = "";
            "none" = "";
            "dnd-notification" = "";
            "dnd-none" = "";
            "inhibited-notification" = "󰂛";
            "inhibited-none" = "󰪑";
            "dnd-inhibited-notification" = "󰂛";
            "dnd-inhibited-none" = "󰪑";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "swaync-client -t -sw";
          "on-click-right" = "swaync-client -d -sw";
          "escape" = true;
        };
      };
    };

    style = builtins.readFile ./style.css;
  };
}