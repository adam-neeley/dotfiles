{ config, lib, pkgs, ... }:

let cfg = config.modules.code;
in {

  options.modules.code.enable = lib.mkEnableOption false;

  config = lib.mkIf cfg.enable {
    programs.direnv.enable = true;

    programs.nix-ld = {
      enable = true; # run unpatched binaries #
      package = pkgs.nix-ld-rs;
    };

    environment.systemPackages = with pkgs; [
      # git
      (pkgs.git.override { guiSupport = true; })
      github-cli

      # c
      clang
      clang-tools
      glibc
      cmake
      ccls # lsp
      libcxx
      gcc
      libtool
      libclang
      cmake-language-server

      # python
      python311Packages.pip
      python311

      # ruby
      ruby

      # latex
      texlive.combined.scheme-medium
      # texlive.combined.scheme-full
      # texlab

      # R
      R

      # lisp
      sbcl
    ];
  };
}
