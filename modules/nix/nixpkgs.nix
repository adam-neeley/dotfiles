{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs = {
    overlays = [ inputs.emacs-overlay.overlays.default ];
    config = { allowUnfree = true; };
  };
}
