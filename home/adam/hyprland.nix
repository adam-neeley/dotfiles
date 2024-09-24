{ inputs, config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ hyprpaper libnotify fuzzel waylock ];

  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000";
      line-color = "eeeeee";
    };
  };

  programs.waybar = {
    enable = true;
    systemd.enable = false;
    settings = {
      mainBar = {
        reload_style_on_change = true;
        layer = "bottom";
        position = "top";
        height = 20;
        output = [ "eDP-1" ];
        "clock" = {
          format = "{:%a %b %d  %H:%M}";
          # format-alt = "{:%a, %d. %b  %H:%M}";
        };
        modules-left = [ "wlr/taskbar" ];
        modules-center = [ "clock" ];
        modules-right = [ "mpd" "bluetooth" "battery" ];
      };
    };

  };

  xdg.configFile.hyprland = {
    source = ./hypr;
    recursive = true;
  };

  xdg.configFile.yofi = {
    source = ./yofi;
    recursive = true;
  };

  xdg.configFile.waybar = {
    source = ./waybar;
    recursive = true;
  };

  xdg.portal = {
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

  services.avizo.enable = true;

  programs.hyprlock.enable = true;

  services.mako = {
    enable = true;
    defaultTimeout = 3000;
    font = "sans-serif 14";
    width = 400;
    height = 200;
    margin = "20";
    padding = "10";
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ "$HOME/dotfiles/media/wallpaper/sakura.jpg" ];
      wallpaper = [ ",$HOME/dotfiles/media/wallpaper/sakura.jpg" ];
    };
  };
}
