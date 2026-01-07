{ config, ... }:

{
  fileSystems."/mnt/share" = {
    device = "//10.0.0.10/vault";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "credentials=/etc/nixos/smb-secrets"
      "iocharset=utf8"
    ];
  };
}