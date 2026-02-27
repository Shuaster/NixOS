{ config, ... }: {
  imports = [
    ../common
    ../features/cli
    ../features/content
    ../features/gaming
    ./home.nix
  ];

  features = {
    cli = {
      fish.enable = true;
      neofetch.enable = true;
    };
  };
}