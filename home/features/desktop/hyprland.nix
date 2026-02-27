{ config, lib, ... }:

with lib;
let 
  cfg = config.features.desktop.hyprland;
in {
  options.features.desktop.hyprland.enable = mkEnableOption "hyprland config";

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        xwayland = {
          force_zero_scaling = true;
        };

        exec-once = [
          "waybar"
          "hyprpaper"
          "hypridle"
        ];

        env = [
          "XCURSOR_SIZE,32"
          "WLR_NO_HARDWARE_CURSORS,1"
          "GTK_THEME,Dracula"
        ];

        input = {
          kb_layout = "us";
          follow_mouse = 1;

          touchpad = {
            natural_scroll = true;
          };

          sensitivity = 0;
        };

        general = {
          gaps_in = 5;
          gaps_out = 5;
          border_size = 1;

          "col.active_border" = "rgba(9742b5ee) rgba(9742b5ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
        };

        decoration = {
          # "col.shadow" = "rgba(1e202966)";
          # drop_shadow = true;
          # shadow_range = 60;
          # shadow_offset = "1 2";
          # shadow_render_power = 3;
          # shadow_scale = 0.97;
          rounding = 8;
          blur = {
            enabled = true;
            size = 3;
            passes = 3;
          };
          active_opacity = 0.9;
          inactive_opacity = 0.5;
        };

        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          orientation = "center";
          mfact = 0.5;

          slave_count_for_center_master = 2;
        };

        gestures = {
          workspace_swipe_distance = 300;
          workspace_swipe_invert = false;
          workspace_swipe_cancel_ratio = "0.5";
        };

        "$mainMod" = "SUPER";

        bind = [
          "$mainMod, return, exec, kitty -e fish -c 'neofetch; exec fish'"
          "$mainMod, M, exit"
          "$mainMod, C, killactive"
        ];
      };

      extraConfig = ''
        gesture = 3, horizontal, workspace
      '';
    };
  };
}