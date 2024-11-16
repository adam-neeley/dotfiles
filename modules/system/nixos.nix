{ config, lib, pkgs, ... }:

{
  system.nixos.label = (builtins.concatStringsSep "-"
    (builtins.sort (x: y: x < y) config.system.nixos.tags))
  + config.system.nixos.version;

  system.stateVersion = "23.05";
}
