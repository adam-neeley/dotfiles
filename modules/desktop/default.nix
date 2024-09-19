{ config, lib, pkgs, ... }:

let cfg = config.modules.desktop;
in {
  options.modules.desktop = { enable = lib.mkEnableOption false; };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      rclone # sync files cloud
      lxqt.pavucontrol-qt
      glib # for gsettings
      gtk3.out # gtk-update-icon-cache
      gnome-themes-extra
      # adwaita-icon-theme
      # miraclecast # stream to projector
      # gnome-network-displays
      yofi
      wofi
      wev
      yad # yad-icon-browser
      gtk3-x11 # gtk-icon-browser

      pcmanfm-qt
      dolphin
      # chat
      # telegram-desktop # telegram
      # cinny-desktop # matrix client
      # discord

      # fonts
      (pkgs.nerdfonts.override {
        fonts = [ "NerdFontsSymbolsOnly" "JetBrainsMono" ];
      })

      # misc TODO refactor
      unzip
      ffmpeg
      pv
      parted
      gparted
      pinentry-qt
      zip
      p7zip
      rpi-imager
      arp-scan
      sftpman
      filezilla
      hyprshot
      protonmail-bridge-gui
      protonmail-desktop
      dolphin
      git-extras
      protonvpn-cli
      protonvpn-gui
      qbittorrent-qt5
      sshfs
      figlet
      shellcheck
      shfmt
      cmake
      github-cli
    ];

    # environment.sessionVariables = { QT_QPA_PLATFORMTHEME = "qt6ct"; };

    services.desktopManager.plasma6.enable = false;

    programs.dconf.enable = true;

    qt = {
      enable = true;
      style = "kvantum";
      platformTheme = "qt5ct";
    };

    services = {
      greetd = {
        enable = true;
        settings = {
          default_session = {
            command =
              "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
            user = "greeter";
          };
        };
      };
      xserver = {
        enable = true;
        displayManager.lightdm.enable = false;
        desktopManager.budgie.enable = false;
      };
    };
  };
}
