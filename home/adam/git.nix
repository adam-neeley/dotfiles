{ inputs, config, lib, pkgs, ... }:

with lib; {
  xdg.configFile.git = { # cfg.doom.copyConfig {
    source = ./git;
    recursive = true;
  };
}
