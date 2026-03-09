{ config, lib, pkgs, ...}:

with lib;
let
  cfg = config.features.desktop.udiskie;
in {
  options.features.desktop.udiskie.enable = mkEnableOption "enable Udiskie for removable media management";

  config = mkIf cfg.enable {
    services.udiskie = {
      enable = true;
    };
  };
}