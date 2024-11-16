{ config, lib, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      grub.enable = true;
      grub.device = "nodev";
      # grub.useOSProber = true;
      # systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
