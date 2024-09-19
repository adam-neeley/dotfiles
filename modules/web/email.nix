{ config, lib, pkgs, ... }:

let cfg = config.modules.web.email;
in {
  options.modules.web.email.thunderbird = {
    enable = lib.mkEnableOption false;
  };

  config = lib.mkIf cfg.thunderbird.enable {
    environment.systemPackages = [ pkgs.thunderbird ];
  };
}
