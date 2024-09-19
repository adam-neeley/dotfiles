{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tldr # man
    fd # fast find
    btop # process manager
    # nvimpager
    bat
    unar # unarchive .zip etc
    sutils
  ];

  home-manager.users.adam = {

    programs = {
      ripgrep.enable = true;

      # git = {
      #   enable = true;
      #   userName = "adam";
      #   userEmail = "aneeley@gmail.com";
      # };
    };
  };
}
