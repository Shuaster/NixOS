{ config, inputs, ... }: {
  imports = [
    ../common
    ../features/cli
    ../features/content
    ../features/desktop
    ../features/gaming
    ../features/productivity
    ./home.nix
  ];

  features = {
    cli = {
      fish.enable = true;
      kitty.enable = true;
      neofetch = true;
    };

    desktop = {
      hyprland.enable = true;
      vicinae.enable = true;
      wayland.enable = true;
    };

    productivity = {
      onlyoffice.enable = true;
      zen-browser.enable = true;
    };
  };

  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "$mainMod, up, movewindow, mon:HDMI-A-1"
        "$mainMod, down, movewindow, mon:DP-1"
      ];

      monitor = [
        "DP-1,5120x1440@120,0x0,1"
        "HDMI-A-1,2560x1080@75,1280x-1080,1"
      ];

      workspace = [
        "1, monitor DP-1, default:true"
        "2, monitor DP-1"
        "3, monitor DP-1"
        "4, monitor DP-1"
        "5, monitor DP-1"
        "6, monitor HDMI-A-1"
        "7, monitor HDMI-A-1"
        "8, monitor HDMI-A-1"
        "9, monitor HDMI-A-1"
        "10, monitor HDMI-A-1"
      ];
    };
  };
}