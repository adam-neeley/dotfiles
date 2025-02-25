{ config, lib, pkgs, ... }:

let cfg = config.modules.code;
in {

  options.modules.code.enable = lib.mkEnableOption true;

  config =
    {
      programs.direnv.enable = true;

      programs.nix-ld = {
        enable = true; # run unpatched binaries #
        package = pkgs.nix-ld-rs;
        libraries = with pkgs;[
          # the following is to run Phaser-Editor
          glib
          nss
          nspr
          dbus
          at-spi2-atk
          cups
          libdrm
          gtk3
          pango
          cairo
          xorg.libX11
          xorg.libXcomposite
          xorg.libXcursor
          xorg.libXdamage
          xorg.libXext
          xorg.libXi
          xorg.libXfixes
          xorg.libXinerama
          xorg.libXrandr
          xorg.libXrender
          xorg.libXtst
          xorg.libXt
          mesa
          expat
          xorg.libxcb
          libxkbcommon
          alsa-lib
          # electron-builder
          libGL
          gdk-pixbuf
          xscreensaver
          cargo
          rustc
        ];
      };

      programs.git = {
        enable = true;
        package = (pkgs.git.override { guiSupport = true; });
      };

      environment.systemPackages = with pkgs; [ gnumake github-cli git-doc ];
    };
}
