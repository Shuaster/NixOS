{ pkgs, lib, inputs, outputs, ... }: {
  imports = [
    ./users
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];

    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      # Enable Nix Flakes
      experimental-features = "nix-command flakes";
      
      # Set users that are allowed to use the flake command
      trusted-users = [
        "root"
        "joshua"
      ];
    };

    # Set automatic garbage collection for anything older than 15 days
    gc = {
      automatic = true;
      options = "--delete-older-than 15d";
    };

    optimise.automatic = true;
    registry = 
      (lib.mapAttrs (_: flake: {inherit flake;}))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);
    nixPath = ["/etc/nix/path"];
  };

  boot = {
    # Sets themed boot animation
    plymouth = {
      enable = true;
      # BLAHAJ THEME
      theme = "blahaj";
      themePackages = with pkgs; [
        plymouth-blahaj-theme
      ];
    };

    # Enable silent boot
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];

    # Hide the OS choice for the bootloader
    # Press a key during startup to show the bootloader list
    loader.timeout = 0;
  };

  



  users.defaultUserShell = pkgs.fish;
}