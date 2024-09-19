{ config, lib, pkgs, ... }:

let cfg = config.modules.media.music;
in {
  options.modules.media.music.enable = lib.mkEnableOption false;

  config = lib.mkIf cfg.enable {
    home-manager.users.adam = {

      programs.mpv.enable = true;

      services.mpd = {
        enable = true;
        musicDirectory = "/home/adam/Music";
      };
    };

    environment.systemPackages = with pkgs; [ mpv mpc-cli ];
  };
}
