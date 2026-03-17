{ config, lib, ... }:

with lib;
let
  cfg = config.features.cli.fish;
in {
  options.features.cli.fish.enable = mkEnableOption "enable extended fish configuration";

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      loginShellInit = ''
        set -x NIX_PATH nixpkgs=channel:nixos-unstable
        set -x NIX_LOG info
        set -x TERMINAL kitty
      '';

      shellAbbrs = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "config" = "cd /home/joshua/.nixos-config";
        "rebuild" = "sudo nixos-rebuild switch --flake ~/.nixos-config#(hostname)";
        "rebuild-server" = "nixos-rebuild switch --flake ~/.nixos-config#app-server --target-host joshua@app-server --sudo --ask-sudo-password";
      };
    };
  };
}
