{pkgs, ...}: {
  imports = [
    ./fish.nix
    ./kitty.nix
    ./neofetch.nix
  ];

  home.packages = with pkgs; [
    tree
    ttyper
    zip
  ];
}