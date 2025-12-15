{
  # Imports main home.nix and anything in /home-manager/desktop directory
  imports = [
    ../home.nix

    ./bash.nix
  ];
}