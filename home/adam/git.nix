{ inputs, config, lib, pkgs, ... }:

with lib; {
  home.packages = with pkgs; [ ghq ];
  programs = {
    ripgrep.enable = true; # TODO move to proper directory

    git = {
      enable = true;
      userName = "Adam Neeley";
      userEmail = "adam.t.neeley@protonmail.com";
      delta.enable = true;
      extraConfig = {
        core = {
          whitespace = "trailing-space,space-before-tab";
          sshCommand = "ssh -i ~/.ssh/adam@iron";
        };
        ghq.root = "~/code";
        interactive = {
        };
        delta = {
          navigate = true;
          dark = true;
        };
        merge = {
          conflictstyle = "zdiff3";
        };
        url = {
          "ssh://git@host" = {
            insteadOf = "otherhost";
          };
        };
      };
    };
  };

  xdg.configFile.git = {
    source = ./git;
    recursive = true;
  };
}
