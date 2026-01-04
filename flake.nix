{
  description = "Multi-host NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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
          ./modules/system/wake.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.joshua = import ./home-manager/desktop/default.nix;
          }
        ];
      };

      helios-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/laptop/configuration.nix

          ./modules/hardware/default.nix
          ./modules/packages/default.nix
          ./modules/system/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.joshua = import ./home-manager/laptop/default.nix;
          }
        ];
      };

    };
  };
}
