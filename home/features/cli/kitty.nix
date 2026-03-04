{ config, lib, ... }:

with lib;
let
  cfg = config.features.cli.kitty;
in {
  options.features.cli.kitty.enable = mkEnableOption "enable extended Kitty terminal configuration";

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      font.name = "dejavu_fonts";
      font.size = 12;

      themeFile = "Chalk";
    };
  };
}