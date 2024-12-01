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
    # ai
    shell-gpt
  ];

  environment.sessionVariables = {
    PAGER = "nvimpager";
    VT_API_KEY = "84f2baa3243a67bcc5fd0428ab254e14453c7d2a7fff22eb02ec5e49624d76cb";
  };

}
