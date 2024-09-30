{ config, lib, pkgs, ... }:

let cfg = config.modules.code;
in {
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nixd # lsp
      nixfmt-classic
    ];
  };
}
