{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules;
in {

  options.modules.fonts.enable = mkEnableOption false;

  config = mkIf cfg.fonts.enable {

    fonts = {
      packages = with pkgs; [
        (nerdfonts.override {
          fonts =
            [ "NerdFontsSymbolsOnly" "JetBrainsMono" "FiraCode" "DroidSansMono" "DejaVuSansMono" ];
        })
        # nerd-fonts.jetbrains-mono
        # nerd-fonts.symbols-only
        # nerd-fonts.fira-code
        # nerd-fonts.droid-sans-mono
        # nerd-fonts.dejavu-sans-mono
        alegreya
        alegreya-sans
        noto-fonts
        ubuntu_font_family
        emojione

        # apps
        font-manager
      ];
      fontconfig = {
        enable = true;
        antialias = true;
        includeUserConf = true;
        defaultFonts = {
          sansSerif = [ "DejaVu Sans" ];
          serif = [ "Noto Serif" ];
          monospace = [ "JetBrainsMono Nerd Font" ];
          emoji = [ "EmojiOne Color" ];
        };
      };
      fontDir.enable = true;
    };
  };
}
