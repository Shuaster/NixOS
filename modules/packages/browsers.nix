{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    firefox
    #tor-browser
    ungoogled-chromium
  ];
}