{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.modules.media.music.ncmpcpp;
  user = home-manager.users.adam;
in {
  options.modules.media.music.ncmpcpp = {
    enable = lib.mkEnableOption false;
    visualizer = lib.mkEnableOption false;
    # modipy.enable = mkBoolOpt false;
  };

  config = lib.mkIf cfg.enable {

    programs.ncmpcpp = let
      bindKey = key: command: {
        inherit key;
        inherit command;
      };
    in {
      enable = true;

      package = lib.mkIf cfg.visualizer
        (pkgs.ncmpcpp.override { visualizerSupport = true; });

      bindings = [
        (bindKey "k" "scroll_up")
        (bindKey "j" "scroll_down")
        (bindKey "h" "previous_column")
        (bindKey "l" "next_column")
        (bindKey "up" "volume_up")
        (bindKey "down" "volume_down")
      ];

      mpdMusicDir = "~/Music";
      settings = { };
    };
    # home.packages = with pkgs;
    #   [ (ncmpcpp.override { visualizerSupport = true; }) ];

    # environment.variables.NCMPCPP_HOME = "$XDG_CONFIG_HOME/ncmpcpp";

    # Symlink these one at a time because ncmpcpp writes other files to
    # ~/.config/ncmpcpp, so it needs to be writeable.
    # xdg.configFile."ncmpcpp".source = {
    #   recursive = true;
    #   source = "/home/adam/dotfiles/home/adam/ncmpcpp";
    # };
  };
}
