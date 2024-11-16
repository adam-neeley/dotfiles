{ inputs, lib, config, pkgs, ... }:

with builtins; {

  config = {
    modules = {
      term.foot.enable = true;
      term.kitty.enable = false;
      shell.enable = true;
      office.enable = true;
      desktop.enable = true;
      desktop.hyprland.enable = true;

      web = {
        browser = {
          qutebrowser.enable = true;
          firefox.enable = true;
          brave.enable = true;
        };
        email = { thunderbird.enable = true; };
      };

      security.enable = true;
      fonts.enable = true;

      editor.doom.enable = true;

      code = { enable = true; };

      media = {
        enable = true;
        music.enable = true;
        graphics.enable = true;
        video.enable = true;
      };

      hardware.keyboard.qmk.enable = true;
      hardware.print.enable = true;

      games = {
        enable = true;
        all.enable = true;
        snes.enable = true;
        psx.enable = true;
      };

      nix = { builders.enable = false; };

    };

    environment.systemPackages = with pkgs;[
      wget
      vim
      git
      # cached-nix-shell # fast TODO remove?
    ];

    time.timeZone = "America/Los_Angeles";

    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };
    };

    user =
      let
        user = builtins.getEnv "USER";
        name = if elem user [ "" "root" ] then "adam" else user;
      in
      {
        inherit name;
        description = "The primary user";
        extraGroups = [ "wheel" ];
        isNormalUser = true;
        home = "/home/${name}";
        group = "users";
        uid = 1000;
      };

    home-manager.backupFileExtension = "bak";

  };
  options = {
    user = lib.mkOption { type = lib.types.attrs; };
    dotfiles = rec {
      dir = lib.mkOption {
        type = lib.types.path;
        default = (lib.removePrefix "/mnt"
          (lib.findFirst lib.pathExists (toString ../.) [
            "/home/adam/dotfiles" # TODO remove hard-coded directory
            "/mnt/etc/dotfiles"
            "/etc/dotfiles"
          ]));
      };
    };
  };
}
