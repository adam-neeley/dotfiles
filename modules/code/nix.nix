{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.code.nix;
in
{
  config = {
    environment.systemPackages = with pkgs; [
      nixd # lsp
      nixpkgs-fmt
      nixfmt-classic
      nixfmt-rfc-style
      # nil
    ];
  };
}
