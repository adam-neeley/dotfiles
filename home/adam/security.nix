{ config, lib, pkgs, ... }:

{
  options = { security.enable = lib.mkEnableOption true; };

  config = {

    home.packages = with pkgs; [ bitwarden ];

    services.gnome-keyring.enable = true;
    programs.gpg.enable = true;
    services.gpg-agent = {
      pinentryPackage = pkgs.pinentry;
      enable = true;
      enableSshSupport = true;
    };
  };
}
