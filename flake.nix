{
  description = "Multi-host NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations = {
      zeus-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop/configuration.nix

          ./modules/hardware/default.nix
          ./modules/hardware/nvidia.nix

          ./modules/packages/default.nix
          ./modules/packages/elgato.nix
          ./modules/packages/gaming.nix

          ./modules/system/default.nix
        ];
      };

      helios-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        moduels = [
          ./hosts/laptop/configuration.nix

          ./modules/hardware/default.nix
          ./modules/packages/default.nix
          ./modules/system/default.nix
        ];
      };

    };
  };
}
