{ inputs, config, lib, pkgs, ... }:

with lib; {

  xdg.configFile.doom = {
    source = ./doom;
    recursive = true;
  };

  age.secrets.gptel.file = ../../modules/secrets/gptel.age;
  age.secrets.gptel.path = "/home/adam/.config/doom/gptel.el";

  home.sessionPath = [ "$XDG_CONFIG_HOME/emacs/bin" ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
  };
}
