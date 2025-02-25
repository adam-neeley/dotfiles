{ config, lib, pkgs, ... }:

{
  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = true;
    brillo.enable = true;
  };
  }
