{ config, home-manager, lib, pkgs, ... }:

with lib;
let cfg = config.modules.term.kitty;
in {
  options.modules.term.kitty.enable = mkEnableOption false;

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ kitty-themes ];

    home-manager.users.adam = {
      programs = {
        kitty = {
          enable = true;
          shellIntegration.enableFishIntegration = true;
          font.name = "JetBrains Mono Nerd Font";
          font.size = 12;
          theme = "Vibrant Ink";
          settings = { confirm_os_window_close = 0; };
          extraConfig = ''
            browser = qutebrowser
            background_opacity 0.9
          '';
          # cursor_shape block
          keybindings = {
            "ctrl+k" = "scroll_line_up";
            "ctrl+j" = "scroll_line_down";
            "ctrl+u" = "scroll_page_up";
            "ctrl+d" = "scroll_page_down";
            "ctrl+equal" = "change_font_size all +2.0";
            "ctrl+minus" = "change_font_size all -2.0";
            "ctrl+g" = "scroll_home";
          };
        };
      };
    };
  };
}
