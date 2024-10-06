{ config, lib, pkgs, ... }:

let cfg = config.modules.code.ruby;
in {
  options.modules.code.ruby.enable = lib.mkEnableOption true;
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ruby
    ];
  };
}
