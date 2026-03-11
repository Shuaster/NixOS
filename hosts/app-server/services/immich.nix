{ config, ... }: {
  fileSystems."/mnt/immich" = {
    device = "10.0.0.10:/mass-storage/immich";
    fsType = "nfs";
    options = [
      "nfsvers=4"
      "rw"
      "soft"
      "intr"
      "noatime"
      "_netdev"
    ];
  };

  services.immich = {
    enable = true;
    openFirewall = false;
    dataDir = "/mnt/immich";
    host = "127.0.0.1";
    port = 2283;

    accelerationDevices = [ "/dev/nvidia0" ];
  };
}
