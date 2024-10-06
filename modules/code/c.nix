{ config, lib, pkgs, ... }:

let cfg = config.modules.code.c;
in {
  options.modules.code.c.enable = lib.mkEnableOption true;
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      clang
      clang-tools
      glibc
      cmake
      libcxx
      gcc
      libtool
      libclang
      cmake-language-server
    ];
  };
}
