{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    font-awesome
    noto-fonts
    dejavu_fonts
  ];
}