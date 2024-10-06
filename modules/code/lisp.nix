{ config, lib, pkgs, ... }:

let cfg = config.modules.code.lisp;
in {
  options.modules.code.lisp.enable = lib.mkEnableOption true;
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (sbcl.withPackages (ps: with ps; [ slynk asdf sly-repl-ansi-color ]))
    ];
  };
}
