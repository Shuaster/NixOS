{ config, lib, ... }:

with lib;
let
  cfg = config.features.desktop.vicinae;
in {
  options.features.desktop.vicinae.enable = mkEnableOption "enable Vicinae Application Launcher config";

  config = mkIf cfg.enable {
    programs.vicinae = {
      enable = true;

      settings = {
        close_on_focus_loss = true;
        popToRootOnClose = true;

        font = {
          normal = {
            size = 10;
          };
        };
      };

      systemd = {
        enable = true;
        autoStart = true;
      };
    };
  };
}