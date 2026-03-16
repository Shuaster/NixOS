{pkgs, ...}: {
  imports = [
  ];

  home.packages = with pkgs; [
    stable.freetube
  ];
}
