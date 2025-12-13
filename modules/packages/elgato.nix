{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    streamdeck-ui
    streamcontroller
  ];
}