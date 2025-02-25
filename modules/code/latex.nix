{ config, lib, pkgs, ... }:

let cfg = config.modules.code.latex;
in {
  options.modules.code.latex.enable = lib.mkEnableOption true;
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (texliveFull.withPackages (ps: with ps; [ wrapfig2 wrapfig ])      )
    ];
  };
}
