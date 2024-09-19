{ config, lib, pkgs, ... }:

let cfg = config.modules.editor.doom;
in {
  config = {
    programs.nixvim.enable = true;
    programs.nixvim.plugins = {
      lazy.enable = true;
      lightline.enable = true;
    };
  };
}
