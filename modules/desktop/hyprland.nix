{ inputs, config, lib, pkgs, ... }:

let
  cfg = config.modules.desktop.hyprland;
  configDir = config.dotfiles.configDir;
in {
  options.modules.desktop.hyprland.enable = lib.mkEnableOption false;

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
    programs.hyprlock.enable = true;

    programs.dconf.enable = true;
    security.polkit.enable = true;

    security.pam.services.hyprlock = { };
    security.pam.services.swaylock = { };
  };
}
