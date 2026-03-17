{ config, ... }: {
  boot = {
    # Enable ZFS Filesystem Compatibility
    supportedFilesystems = [ "zfs" ];

    # Import ZFS Pool at boot
    zfs.extraPools = [ "mass-storage" ];

  };

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };
}
