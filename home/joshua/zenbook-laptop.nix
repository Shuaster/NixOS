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
      neofetch.enable = true;
    };

    desktop = {
      hyprland.enable = true;
      wayland.enable = true;
    };

    productivity = {
      zen-browser.enable = true;
    };
  };

  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "$mainMod, up, movewindow, u"
        "$mainMod, down, movewindow, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
      ];

      monitor = [
        "eDP-1,1920x1080,0x0,1"
      ];

      workspace = [
        "1, monitor eDP-1, default:true"
        "2, monitor eDP-1"
        "3, monitor eDP-1"
        "4, monitor eDP-1"
        "5, monitor eDP-1"
      ];
    };
  };
}