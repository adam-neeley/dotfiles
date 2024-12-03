{ inputs, config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ hyprpaper libnotify fuzzel waylock avizo ];

  programs = {
    waybar = {
      enable = true;
      systemd.enable = false;
      settings = {
        mainBar = {
          reload_style_on_change = true;

          mode = "hide"; # dock | hide | invisible | overlay
          layer = "bottom";
          position = "top";
          height = 10;
          output = [ "eDP-1" ];
          "wlr/taskbar" =
            {
              icon-size = 8;
              format = "{icon}";
            };
          clock = {
            format = "{:%a %b %d  %H:%M}";
          };
          modules-left = [ "wlr/taskbar" ];
          # modules-center = [ "clock" ];
          modules-right = [ "clock" "battery" ];
        };
      };
    };
    hyprlock.enable = true;
    swaylock = {
      enable = true;
      settings = {
        color = "000000";
        line-color = "888888";
      };
    };
  };

  xdg = {
    configFile = {
      hypr = {
        source = ./hypr;
        recursive = true;
      };

      yofi = {
        source = ./yofi;
        recursive = true;
      };

      waybar = {
        source = ./waybar;
        recursive = true;
      };
    };

    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common.default = [ "gtk" ];
        hyprland.default = [ "gtk" "hyprland" ];
      };
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    systemd.variables = [ "--all" ];
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
    plugins = [
      inputs.hyprland-hy3.packages.${pkgs.system}.default
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
      # inputs.hyprland-virtual-desktops.packages.${pkgs.system}.virtual-desktops
    ];
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };

  services = {
    clipman.enable = true;
    avizo = {
      enable = true;
      settings = {
        default = {
          time = 1.0;
          y-offset = 0.5;
          fade-in = 0.1;
          fade-out = 0.2;
          padding = 10;
        };
      };
    };

    mako = {
      enable = true;
      defaultTimeout = 3000;
      font = "sans-serif 14";
      width = 400;
      height = 200;
      margin = "20";
      padding = "5";
    };

    hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [ "/home/adam/dotfiles/media/wallpaper/sakura.jpg" ];
        wallpaper = [ ",/home/adam/dotfiles/media/wallpaper/sakura.jpg" ];
      };
    };
  };
}
