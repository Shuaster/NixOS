{pkgs, ...}: {
  imports = [
    ./fish.nix
    ./neofetch.nix
  ];

  home.packages = with pkgs; [
    tree
    zip
  ];
}