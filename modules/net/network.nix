{ config, lib, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
    extraHosts = ''
      192.168.1.1   router.home
      192.168.1.110 nexus.home
      192.168.1.120 carbon.home
      192.168.1.130 iron.home
      71.19.146.26  adam-town
    '';
  };
  environment.systemPackages = with pkgs; [ dig ];
}
