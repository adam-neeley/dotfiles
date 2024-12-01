{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs;[ nushellFull ];
    programs.nushell = {
  enable = true;
  package = pkgs.nushellFull;
};
}
