{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ aseprite tiled ];
}
