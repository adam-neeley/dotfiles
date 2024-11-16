{ config, lib, pkgs, ... }:

{
  services.davfs2.enable = true;

  # fileSystems = {
  #   "/home/adam/docs/org/davfs" = {
  #     device = "http://adam-town:4918/user/adam/";
  #     fsType = "davfs";
  #     # options = [ "rw,nofail,user" ];
  #     options = [ "user,noauto,file_mode=600,dir_mode=700 0 1" ];
  #   };
  # };
}
