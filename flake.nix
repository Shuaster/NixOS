{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations.nixos-media = nixpkgs.lib.nixosSystem {
	    system = "x86_64_linux";
      
      modules = [
	      ./configuration.nix
	    ];
    };
  };
}
