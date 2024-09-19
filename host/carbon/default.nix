flake-overlays:

{ inputs, lib, config, pkgs, ... }: {

  imports = [ ../common.nix ./hardware-configuration.nix ];

  networking.hostName = "carbon";

  nix.settings.cores = 2;
  nix.settings.max-jobs = 2;
}
