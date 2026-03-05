{ inputs, pkgs, ... }: {
  imports = [
    ./onlyoffice.nix
    ./zen-browser.nix

    inputs.zen-browser.homeModules.twilight
  ];

  home.packages = with pkgs; [
    obs-studio # Video Recording & Live Streaming
    obsidian # Markdown Editor
    rawtherapee # Raw Photo Editor
    vscodium # VS Code with disabled telemetry
    zed-editor # High performance code editor
  ];
}