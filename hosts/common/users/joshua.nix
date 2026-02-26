{ config, pkgs, inputs, ... }: {
  users.users.joshua = {
    initialHashedPassword = "$y$j9T$uylmWkCpTaqALd00kCJ3E/$5wqA8iZ8Zs/dG7u.2GPC/mFnrnXAxw784fN3S5TsugA";
    isNormalUser = true;
    description = "Joshua";
    
    extraGroups = [
      "wheel"
      "networkManager"
      "audio"
      "video"
    ];

    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };

  home-manager.users.joshua = 
    import ../../../home/joshua/${config.networking.hostName}.nix;
}