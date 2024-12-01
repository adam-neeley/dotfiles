{ config, lib, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      pipenv
      pyright # basedpyright
      python3Full
      python3Packages.black
      python3Packages.ipython
      python3Packages.isort
      python3Packages.nose
      python3Packages.pip
      python3Packages.pyflakes
      python3Packages.python-lsp-server

      uv
    ];
  };
}
