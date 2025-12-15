{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/joshua/.nixos-config#zeus-desktop";
    };
  };
}   