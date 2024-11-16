{ config, lib, pkgs, ... }:

{
  sound.enable = true;
  services = {
    pipewire = {
      enable = false;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = false;
    };
  };
}
