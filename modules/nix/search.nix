{ inputs, stdenv, config, lib, pkgs, ... }:

{
  options.modules.nix.search = lib.mkEnableOption true;

  config = lib.mkIf config.modules.nix.search {
    # config = lib.mkIf config.modules.nix.search {# TODO add package if inputs.nix-search
    environment.systemPackages =
      [ inputs.nix-search.packages.x86_64-linux.default ];
  };
}
