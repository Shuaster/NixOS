{ config, ... }: {
  fileSystems."/mnt/vaultwarden" = {
    device = "10.0.0.10:/mass-storage/vaultwarden";
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

  services.vaultwarden = {
    enable = true;
    dbBackend = "sqlite";
    config = {
      ROCKET_PORT = 8222;
      ROCKED_ADDRESS = "127.0.0.1"; # Only listen locally, Caddy handles external
      DATA_FOLDER = "/mnt/vaultwarden";
      DOMAIN = "https://vaultwarden.app-server.goose-goanna.ts.net";
      # SIGNUPS_ALLOWED = false; # Disable after creating your account
    };
  };
}
