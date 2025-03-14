{ inputs, lib, config, pkgs, ... }: {

  imports = [ ../common.nix ./hardware-configuration.nix ];
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys =
      [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
  nix.nixPath =
    [ "nixpkgs=${inputs.nixpkgs}" "home-manager=${inputs.home-manager}" ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
  };

  networking.hostName = "iron";
  networking.iproute2.enable = true;
  environment.sessionVariables = { };

  environment.systemPackages =
    with pkgs; [ networkmanagerapplet nettools iproute2 nixdoc
                 # gnome-settings-daemon
               ];

  # services
  services = {
    blueman.enable = true;
    # dbus.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  };

}
