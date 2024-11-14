{ config, lib, pkgs, ... }:

{
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch = {
    enable = true;
    hooks.preNew = "mbsync --all";
  };
  accounts.email = {

    accounts.aneeley = {
      flavor = "gmail.com";
      address = "aneeley@gmail.com";
      # gpg = {
      #   key = "F9119EC8FCC56192B5CF53A0BF4F64254BD8C8B5";
      #   signByDefault = true;
      # };

      # imap.host = "imap.gmail.com";
      mbsync = {
        enable = true;
        create = "maildir";
      };

      msmtp.enable = true;

      notmuch.enable = true;

      primary = true;
      realName = "Adam Neeley";

      signature = { text = ''Adam''; showSignature = "append"; };
      passwordCommand = "mail-password";
      # smtp = { host = "posteo.de"; };
      # userName = "benbals@posteo.de";
    };
  };

};
