{ inputs, config, lib, pkgs, ... }:

with lib; {

  xdg.configFile.doom = { # cfg.doom.copyConfig {
    source = ./doom;
    recursive = true;
  };

  home.sessionPath = [ "$XDG_CONFIG_HOME/emacs/bin" ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
  };
}
