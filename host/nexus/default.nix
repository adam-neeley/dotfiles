flake-overlays:

{ inputs, lib, config, pkgs, ... }: {

  imports = [ ../common.nix ./hardware-configuration.nix ];

  networking.hostName = "nexus";
}
