{ config, pkgs, ... }:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";

        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 600;
          on-timeout = "hyprlock";
        }
        {
          timeout = 900;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 3600;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}