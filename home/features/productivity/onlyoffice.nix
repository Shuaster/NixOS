{ config, lib, ... }:

with lib;
let
  cfg = config.features.productivity.onlyoffice;
in {
  options.features.productivity.onlyoffice.enable = mkEnableOption "enable OnlyOffice suite package and configuration";

  config = mkIf cfg.enable {
    programs.onlyoffice = {
      enable = true;

      settings = {
        UITheme = "theme-night";
        editorWindowMode = false;
        titlebar = "cutsom";
      };
    };
  };
}