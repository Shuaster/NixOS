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
      "input"
      "gamepad"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKzNqzIHToRwS3pPlTMuYfbZxEZVVdB7HQe0Alh8AeNm joshua@zenbook-laptop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFMQcJjO/wSWc4hqC9J2Bjp0QJoOvR7fdjMFyjif2ps9 joshua@nixos"
    ];

    packages = [inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default];
  };

  home-manager.users.joshua =
    import ../../../home/joshua/${config.networking.hostName}.nix;
}
