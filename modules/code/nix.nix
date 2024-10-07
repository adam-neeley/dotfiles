{ config, lib, pkgs, ... }:

let cfg = config.modules.code.nix;
in {
  options.modules.code.nix.enable = lib.mkEnableOption true;
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nixd # lsp
      nixpkgs-fmt
      nixfmt
      nil
    ];
  };
}
