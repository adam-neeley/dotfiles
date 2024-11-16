{ config, lib, pkgs, ... }:

{
  hardware = {
    pulseaudio.enable = true;
    bluetooth.enable = true;
    brillo.enable = true;
  };
}
