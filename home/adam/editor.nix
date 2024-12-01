{ inputs, config, lib, pkgs, ... }:

with lib; {

  xdg.configFile.doom = {
    source = ./doom;
    recursive = true;
  };

  age.secrets.emacs =
    {
      file = ../../modules/secrets/emacs.age;
      path = "/home/adam/.config/doom/secrets.el";
    };

  services.emacs =
    {
      socketActivation.enable = true;
      client.enable = true;
      defaultEditor = true;
      startWithUserSession = true;
    };

  home.sessionPath = [ "$XDG_CONFIG_HOME/emacs/bin" ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
  };
}
