{ config, home-manager, lib, pkgs, ... }:

with lib;
let cfg = config.modules.shell;
in {
  options.modules.shell.enable = mkEnableOption false;
  config = mkIf cfg.enable {

    programs = {
      fish.enable = true;
      zsh = {
        interactiveShellInit = "fish";
        enable = true;
      };
      starship.enable = true;
    };

    environment.shells = with pkgs;[ fish zsh nushell ];
    users.users.adam.shell = pkgs.fish;

    environment.shellAliases = { };

    home-manager.users.adam.programs = {
      eza = {
        enable = true;
        git = true;
        icons = true;
      };

      fish = {
        enable = true;
        plugins = [
          {
            name = "pure";
            src = pkgs.fishPlugins.pure.src;
          }
          {
            name = "z";
            src = pkgs.fishPlugins.z.src;
          }
        ];

        shellInit = ''
          fish_hybrid_key_bindings
          direnv hook fish | eval
        '';
      };
    };
  };
}
