{ config, ... }: {
  imports = [
    ../common
    ../features/cli
    ../features/content
    ../features/desktop
    ../features/gaming
    ./home.nix
  ];

  features = {
    cli = {
      fish.enable = true;
      neofetch.enable = true;
    };

    desktop = {
      hyprland.enable = false;
      wayland.enable = false;
    };
  };
}