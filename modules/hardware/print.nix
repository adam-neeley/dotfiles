{ config, lib, pkgs, ... }:

let cfg = config.modules.hardware.print;
in {
  options.modules.hardware.print.enable = lib.mkEnableOption true;
  config = lib.mkIf cfg.enable {
    services.printing.enable = true;
    services.printing.drivers = [ pkgs.brlaser ];
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    services.ipp-usb.enable = true;
  };
}
