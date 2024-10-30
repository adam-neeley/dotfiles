{ config, lib, pkgs, system, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    tldr # man for noobs
    fd # fast find
    nvimpager
    bat
    unar # unarchive .zip etc
    sutils
    # system info
    btop # process manager
    pfetch
    neofetch
    figlet # ascii art text
    inputs.nix-search.packages.${system}.default
  ];

  environment.sessionVariables = { PAGER = "nvimpager"; };

}
