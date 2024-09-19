{ config, lib, pkgs, ... }:

let cfg = config.modules.hardware.keyboard;
in {

  options.modules.hardware.keyboard = {
    layout = lib.mkOption { default = "us"; };
    variant = lib.mkOption { default = "dvorak"; };
    options = lib.mkOption { default = "altwin:swap_alt_win,caps:escape"; };
  };

  config = {
    console.useXkbConfig = config.services.xserver.enable;

    services.xserver.xkb = lib.mkIf config.services.xserver.enable {
      inherit (cfg) layout variant options;
    };
  };
}
