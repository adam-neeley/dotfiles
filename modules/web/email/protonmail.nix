{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.protonmail-bridge-gui ];
  systemd.user.services.protonmail-bridge = {
    description = "Protonmail Bridge";
    enable = true;
    script =
      "${pkgs.protonmail-bridge}/bin/protonmail-bridge --noninteractive --log-level info";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
  };
}
