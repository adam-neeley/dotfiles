{ config, lib, pkgs, ... }:

with lib;
let cfg = config.modules.games;
in {
  options.modules = {
    games.enable = mkEnableOption false;
    games.all.enable = mkEnableOption false;
    games.snes.enable = mkEnableOption false;
    games.psx.enable = mkEnableOption false;
    games.n64.enable = mkEnableOption false;
  };

  config = mkIf cfg.enable {
    programs.steam.enable = false;

    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs;
      (if cfg.all.enable then [
        retroarchFull
        pcsx2
        dwarf-fortress
      ] else
        [ retroarch.override { cores = with pkgs.libretro; [ snes9x ]; } ]
        ++ (if cfg.snes.enable then [ libretro.snes9x ] else [ ])
        ++ (if cfg.n64.enable then [ libretro.mupen64plus ] else [ ])
        ++ (if cfg.psx.enable then [
          libretro.beetle-psx-hw
          libretro.pcsx2
        ] else
          [ ]));
  };

}
