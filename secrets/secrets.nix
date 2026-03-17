let
  app-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPWretN4Hb4nVysyRl6inFEduz6BGUQiN8A1gBKVyyd6 root@nixos";
  zenbook-laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKh1RweWM6n+Mpit7Tg73ZsCxkxpXa/LE2BGXgjtG4rf";
  joshua = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKzNqzIHToRwS3pPlTMuYfbZxEZVVdB7HQe0Alh8AeNm joshua@zenbook-laptop";

  allHosts = [ app-server zenbook-laptop ];
in {
  #
  "tailscale-auth-key.age".publicKeys = [ app-server zenbook-laptop joshua ];
}
