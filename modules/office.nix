{ config, lib, pkgs, ... }:

with lib;
let cfg = config.modules.office;
in {
  options.modules = { office.enable = mkEnableOption false; };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # video
      zoom-us
      # docs
      libreoffice-qt
      masterpdfeditor4
    ];
  };
}
