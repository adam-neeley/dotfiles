{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.code;
in
{
  options.modules.code.web = { enable = mkEnableOption true; };

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
