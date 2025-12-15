{
  # Imports main home.nix and anything in /home-manager/laptop directory
  imports = [
    ../home.nix
    
    ./bash.nix
  ];
}