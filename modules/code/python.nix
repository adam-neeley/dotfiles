{ config, lib, pkgs, ... }:

let cfg = config.modules.code.python;
in {
  options.modules.code.python.enable = lib.mkEnableOption true;
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python311
      python311Packages.pip
      python311Packages.black
      basedpyright
      # taplo
      python3Packages.python-lsp-server
    ];
  };
}
