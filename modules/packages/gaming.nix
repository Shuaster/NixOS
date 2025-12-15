{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gamescope
    prismlauncher
    steam
  ];
}