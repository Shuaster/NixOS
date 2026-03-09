{pkgs, ...}: {
  imports = [
    ./fish.nix
    ./kitty.nix
    ./fastfetch.nix
  ];

  home.packages = with pkgs; [
    git
    tree
    ttyper
    zip
  ];
}