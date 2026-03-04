{ config, inputs, lib, pkgs, ... }:

with lib;
let
  cfg = config.features.productivity.zen-browser;
  addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in {
  options.features.productivity.zen-browser.enable = mkEnableOption "enable Zen Browser package and configuration";

  config = mkIf cfg.enable {

    programs.zen-browser = {
      enable = true;
      suppressXdgMigrationWarning = true;

      profiles.default = {
        # Extensions (Find package names at https://nur.nix-community.org/repos/rycee/)
        extensions.packages = with addons; [
          bitwarden # Password Manager
          private-grammar-checker-harper # Harper Private Grammar Checker
          sponsorblock # Youtube Sponsor Skipping
          ublock-origin # Ad Blocker
        ];

        # Keyboard Shortcuts
        keyboardShortcuts = [
          # Toggle Compact Mode with Ctrl+\
          {
            id = "zen-compact-mode-toggle";
            key = "\\";
            modifiers = {
              control = true;
            };
          }
          # Disable Blank Window
          {
            id = "zen-new-unsynced-window";
            disabled = true;
          }
          # Private Window with Ctrl+Shift+N
          {
            id = "key_privatebrowsing";
            key = "n";
            modifiers = {
              control = true;
              shift = true;
            };
          }
        ];

        # Activation will fail if the Zen Browser shortcuts version
        # doesn't match, preventing silent breakage after Zen Browser
        # updates. Find version in about:config as zen.keyboard.shortcuts.version
        keyboardShortcutsVersion = 16;

        pinsForce = true;

        pins = {
          "Google Calendar" = {
            id = "001d9ea8-1688-11f1-a9fd-f736997ac18b";
            url = "https://calendar.google.com";
            isEssential = true;
            position = 100;
          };
          "Gmail" = {
            id = "74b57510-1688-11f1-a4d1-f3f66960409d";
            url = "https://mail.google.com";
            isEssential = true;
            position = 101;
          };
        };
      };

      policies = {
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
    };
  };
}