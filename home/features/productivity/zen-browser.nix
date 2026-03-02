{ config, inputs, lib, pkgs, ... }:

with lib;
let
  cfg = config.features.productivity.zen-browser;
  addons = inputs.firefox-addons.packages.${system};
in {
  options.features.productivity.zen-browser.enable = mkEnableOption "enable Zen Browser package and configuration";

  config = mkIf cfg.enable {

    programs.zen-browser = {
      enable = true;
      suppressXdgMigrationWarning = true;

      profiles.default = {
        keyboardShortcuts = [
          # Toggle Compact Mode with Ctrl+\
          {
            id = "zen-compact-mode-toggle";
            key = "\\";
            modifiers = {
              control = true;
            };
          }
        ];
      };

      policies = {
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
    };

    # programs.zen-browser.profiles.default = {
    #   keyboardShortcuts = [
    #     # Toggle Compact Mode with Ctrl+\
    #     {
    #       id = "zen-compact-mode-toggle";
    #       key = "\\";
    #       modifiers = {
    #         control = true;
    #       };
    #     }
    #   ];
    # };



    # home.packages = with pkgs; [
    #   inputs.zen-browser.packages."${system}".twilight
    # ];
  };
}