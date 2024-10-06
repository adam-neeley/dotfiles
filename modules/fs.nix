{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ davfs2 ];

  fileSystems = {
    "/home/adam/docs/org/davfs/" = {
      device = "http://tornado:4918/public/";
      fsType = "davfs";
      options = [ "nofail" ];
    };
  };

}
