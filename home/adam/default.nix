{ pkgs, lib, inputs, ... }: {

  imports =
    [ inputs.agenix.homeManagerModules.default ./git.nix ./hyprland.nix ./editor.nix ./security.nix ./ncmpcpp.nix ./email.nix];

  config = {

    modules.media.music.ncmpcpp = {
      enable = true;
      visualizer = true;
    };

    home = rec {
      # dotfiles = "${homeDirectory}/dotfiles";
      username = "adam";
      homeDirectory = "/home/adam";
      sessionPath = [ "$HOME/.local/bin/" ];

      sessionVariables = rec {
        SSH_ASKPASS = lib.getExe pkgs.lxqt.lxqt-openssh-askpass;
        BROWSER = "qutebrowser";
        EDITOR = "emacsclient --no-window-system";
        VISUAL = "emacsclient --create-frame";
        DOTFILESDIR = "/home/adam/dotfiles";
        # DOOMDIR = "${DOTFILESDIR}/home/adam/doom";
        NIX_ALLOW_UNFREE = 1;
      };
      stateVersion = "23.05";
    };

    home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 16;
      gtk.enable = true;
      x11.enable = true;
    };

    qt = {
      enable = true;
      style = { name = "kvantum"; };
    };

    xdg.configFile = {
      "Kvantum/ArcDark".source = "${pkgs.arc-kde-theme}/share/Kvantum/ArcDark";
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=ArcDark'';
    };

    gtk = {
      #   let themes = {
      #   ayu = {package = pkgs.ayu-theme-gtk-unstable;
      #          name = ""
      #         };
      # }; in{
      enable = true;

      theme = {
        package = pkgs.solarc-gtk-theme;
        name = "SolArc-Dark";
      };

      iconTheme = {
        # package = pkgs.gnome.adwaita-icon-theme;
        # name = "Adwaita";
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
      };

      font = {
        name = "Noto Sans";
        size = 14;
      };
    };

    systemd.user.startServices = "sd-switch";
  };
}
