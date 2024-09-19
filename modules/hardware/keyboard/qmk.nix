{ config, lib, pkgs, ... }:

let cfg = config.modules.hardware.keyboard.qmk;
in {
  options.modules.hardware.keyboard.qmk.enable = lib.mkEnableOption false;

  config = lib.mkIf cfg.enable {
    hardware.keyboard.qmk.enable = true;
    environment.systemPackages = with pkgs; [ via qmk qmk_hid ];
    services.udev.packages = with pkgs; [ via ];
  };
}
