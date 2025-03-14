{ config, lib, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      pipenv
      taplo-lsp
      taplo
      python3Full
      python3Packages.autopep8
      python3Packages.flake8
      python3Packages.ipython
      python3Packages.isort
      python3Packages.mypy
      python3Packages.pip
      # python3Packages.pycodestyle
      python3Packages.pyflakes
      python3Packages.python-lsp-server
      # uv
      # poetry
      black
      pyright
    ];
  };
}
