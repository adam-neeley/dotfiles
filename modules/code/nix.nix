{ config, lib, pkgs, ... }:

{

  options.modules.code.nix.enable = lib.mkEnableOption false;

  config = {
    environment.systemPackages = with pkgs; [
      nixd # lsp
      direnv
      nixfmt-classic
    ];
  };

}
