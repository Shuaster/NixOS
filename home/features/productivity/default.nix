{ inputs, pkgs, ... }: {
  imports = [
    ./zen-browser.nix

    inputs.zen-browser.homeModules.twilight
  ];

  home.packages = with pkgs; [
    obsidian # Markdown Editor
    onlyoffice-desktopeditors # Office Suite
    vscodium # VS Code with disabled telemetry
  ];
}