{ config, lib, pkgs, ... }:

let cfg = config.modules.code;
in {

  options.modules.code.enable = lib.mkEnableOption false;
  # options.modules.code.nix.enable = lib.mkEnableOption false;
  # options.modules.code.web.enable = lib.mkEnableOption false;
  # options.modules.code.haskell.enable = lib.mkEnableOption false;

  config = lib.mkIf cfg.enable {
    programs.direnv.enable = true;

    programs.nix-ld = {
      enable = true; # run unpatched binaries #
      package = pkgs.nix-ld-rs;
    };

    environment.systemPackages = with pkgs; [
      # git
      git
      github-cli
      # c
      clang
      clang-tools
      glibc
      # cmake
      ccls # lsp
      libcxx
      gcc
      libtool
      llvmPackages.libcxx
      libclang
      cmake-language-server

      # python
      python311Packages.pip
      python311

      #ruby
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
