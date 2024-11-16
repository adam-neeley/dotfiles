{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "rebuild"
      (builtins.readFile ./scripts/rebuild))
    (pkgs.writeShellScriptBin "list-generations"
      (builtins.readFile ./scripts/list-generations))
  ];
}
