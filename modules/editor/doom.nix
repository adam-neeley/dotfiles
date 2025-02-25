{ home-manager, config, lib, pkgs, ... }:

with lib;
let cfg = config.modules.editor.doom;
in {
  options.modules.editor.doom.enable = mkEnableOption false;

  config = mkIf cfg.enable {

    services.emacs = {
      enable = true;
      defaultEditor = true;
    };

    environment.systemPackages = with pkgs; [
      #emacs-unstable
      binutils
      ## Doom dependencies
      git
      ripgrep
      gnutls # for TLS connectivity


      ## Optional dependencies
      fd # faster projectile indexing
      imagemagick # for image-dired
      (mkIf (config.programs.gnupg.agent.enable)
        pinentry-emacs) # in-emacs gnupg prompts
      zstd # for undo-fu-session/undo-tree compression

      ## Module dependencies
      # :checkers spell
      (aspellWithDicts (ds: with ds; [ en en-computers en-science ]))
      # :tools editorconfig
      editorconfig-core-c # per-project style config
      # :tools lookup & :lang org +roam
      sqlite
      # :lang latex & :lang org (latex previews)
      texlive.combined.scheme-medium
      # :lang beancount
      beancount
      # fava
      # :lang nix
      age
      # vterm
      cmake
      libtool
      # :app everywhere
      wtype
      xclip
      # email:
      notmuch
      lieer
      # isync
      # offlineimap
      # markdown
      multimarkdown
      nodePackages.prettier
      wl-clipboard-rs
      gnuplot
      maim
      python3Packages.pytest
      emacs-all-the-icons-fonts
      plantuml
    ];
  };
}
