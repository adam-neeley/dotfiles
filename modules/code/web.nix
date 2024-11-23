{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.code;
  # let cfg = config.modules.code.web;
in {
  options.modules.code.web = { enable = mkEnableOption false; };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [

      # web
      html-tidy
      stylelint # css
      emmet-ls
      # json
      jq

      # js
      # nodejs
      nodejs
      nodePackages.yarn
      nodePackages.pnpm
      nodePackages.js-beautify
      # typescript
      nodePackages.typescript
      nodePackages.typescript-language-server
      # deno
      deno
      # bun
      bun

      # static website
      hugo

    ];
  };
}
