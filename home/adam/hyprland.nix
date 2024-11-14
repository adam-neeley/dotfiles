{ inputs, config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ hyprpaper libnotify fuzzel waylock ];

  programs.waybar = {
    /*
      waybar
    */
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
            format = "{icon} {title}";
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

  /*
    configs
  */
  xdg.configFile = {
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

  xdg.portal = {
    /*
      portal
    */
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [ "gtk" "hyprland" ];
    };
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
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
      inputs.hyprland-virtual-desktops.packages.${pkgs.system}.default
    ];
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };

  services.avizo =
    {
      /*
        brightness & volume
      */
      enable = true;
    };

  services.mako = {
    /*
      notifications
    */
    enable = true;
    defaultTimeout = 3000;
    font = "sans-serif 14";
    width = 400;
    height = 200;
    margin = "20";
    padding = "5";
  };

  services.hyprpaper = {
    /*
      wallpaper
    */
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ "/home/adam/dotfiles/media/wallpaper/sakura.jpg" ];
      wallpaper = [ ",/home/adam/dotfiles/media/wallpaper/sakura.jpg" ];
    };
  };

  /*
    Lock
  */

  programs.hyprlock.enable = true;
  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000";
      line-color = "888888";
    };
  };

}
