let
  zenbook-laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKh1RweWM6n+Mpit7Tg73ZsCxkxpXa/LE2BGXgjtG4rf";
  joshua = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKzNqzIHToRwS3pPlTMuYfbZxEZVVdB7HQe0Alh8AeNm joshua@zenbook-laptop";

  allHosts = [ zenbook-laptop ];
in {
  #
  "tailscale-auth-key.age".publicKeys = [ zenbook-laptop joshua ];
}
