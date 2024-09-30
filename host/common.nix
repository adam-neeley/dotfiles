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

    services = {
      blueman.enable = true;

      pipewire = {
        enable = false;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = false;
      };
    };

    environment = {
      systemPackages = with pkgs; [
        wget
        vim
        git
        cached-nix-shell # fast
        (pkgs.writeShellScriptBin "rebuild"
          (builtins.readFile ./scripts/rebuild))
        (pkgs.writeShellScriptBin "list-generations"
          (builtins.readFile ./scripts/list-generations))
      ];
      shellAliases = { };
    };

    nix = {
      registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

      nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}")
        config.nix.registry;

      optimise.automatic = true;

      settings = {
        experimental-features = "nix-command flakes";
        auto-optimise-store = true;
        trusted-users = [ "adam" "@wheel" ];

        substituters =
          [ "https://hyprland.cachix.org" "https://nix-community.cachix.org" ];
        trusted-public-keys = [
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };
    };

    nixpkgs = {
      overlays = [ inputs.emacs-overlay.overlays.default ];
      config = { allowUnfree = true; };
    };

    system.nixos.label = (builtins.concatStringsSep "-"
      (builtins.sort (x: y: x < y) config.system.nixos.tags))
      + config.system.nixos.version;

    networking = {
      networkmanager.enable = true;
      firewall.enable = false;
      extraHosts = ''
        192.168.1.1   router.home
        192.168.1.110 nexus.home
        192.168.1.120 carbon.home
        192.168.1.130 iron.home
      '';
    };

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

    hardware = {
      pulseaudio.enable = true;
      bluetooth.enable = true;
      brillo.enable = true;
    };

    sound.enable = true;

    users = {
      users = {
        adam = {
          description = "monadam";
          extraGroups = [ "networkmanager" "wheel" "audio" ];
          initialHashedPassword =
            "$y$j9T$42f.KUzl/ncm8ttyPcbwO1$sVm14SGGhAky1aYpGKKmvGKwG7udbyfDmvzitOk3vO0";
          isNormalUser = true;
          openssh.authorizedKeys.keys = [ ];
        };
      };
    };

    time.timeZone = "America/Los_Angeles";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
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

    system.stateVersion = "23.05";

    user = let
      user = builtins.getEnv "USER";
      name = if elem user [ "" "root" ] then "adam" else user;
    in {
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
