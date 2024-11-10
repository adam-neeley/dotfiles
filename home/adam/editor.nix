{ inputs, config, lib, pkgs, ... }:

with lib; {

  xdg.configFile.doom = {
    source = ./doom;
    recursive = true;
  };

  age.secrets.emacs.file = ../../modules/secrets/emacs.age;
  age.secrets.emacs.path = "/home/adam/.config/doom/secrets.el";

  home.sessionPath = [ "$XDG_CONFIG_HOME/emacs/bin" ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
  };
}
