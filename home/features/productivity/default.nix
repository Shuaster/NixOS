{ inputs, pkgs, ... }: {
  imports = [
    ./onlyoffice.nix
    ./zen-browser.nix

    inputs.zen-browser.homeModules.twilight
  ];

  home.packages = with pkgs; [
    obsidian # Markdown Editor
    vscodium # VS Code with disabled telemetry
    zed-editor # High performance code editor
  ];
}