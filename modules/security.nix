{ config, lib, options, inputs, pkgs, ... }:

with builtins;
with lib;
let cfg = config.modules.security;
in {
  options.modules = { security.enable = mkEnableOption true; };

  config = mkIf cfg.enable {
    security = {
      rtkit.enable = true;
      sudo = { wheelNeedsPassword = false; };
    };

    environment.systemPackages =
      [ pkgs.ssh-askpass-fullscreen pkgs.lxqt.lxqt-openssh-askpass ];

    programs.ssh.enableAskPassword = true;
    programs.ssh.askPassword = lib.getExe pkgs.lxqt.lxqt-openssh-askpass;

    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };
  };
}
