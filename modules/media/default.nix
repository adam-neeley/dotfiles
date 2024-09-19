{ config, lib, pkgs, ... }:

with lib;
let cfg = config.modules.media;
in {
  options.modules = {
    media.enable = mkEnableOption true;
    media.graphics.enable = mkEnableOption false;
    media.video.enable = mkEnableOption false;
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      (if cfg.graphics.enable then [ gimp imagemagick inkscape ] else [ ])
      ++ (if cfg.video.enable then [ vlc mpv yt-dlp obs-studio ] else [ ]);
  };

}
