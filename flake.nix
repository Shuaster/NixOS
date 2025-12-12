{
  description = "Multi-host NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      zeus-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };

      helios-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        moduels = [
          ./hosts/laptop/configuration.nix

          ./modules/hardware/default.nix
          ./modules/system/default.nix
        ];
      };

    };
  };
}