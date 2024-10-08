{ config, home-manager, lib, pkgs, ... }:

with lib;
let cfg = config.modules.shell;
in {
  options.modules.shell.enable = mkEnableOption false;
  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [ pfetch neofetch figlet ];

    programs.fish.enable = true;
    programs.zsh.enable = true;
    programs.starship.enable = true;

    environment.shells = [ pkgs.fish ];
    users.users.adam.shell = pkgs.zsh;
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
