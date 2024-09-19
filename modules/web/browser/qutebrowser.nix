{ home-manager, config, lib, pkgs, ... }:

let cfg = config.modules.web.browser.qutebrowser;
in {
  options.modules.web.browser.qutebrowser = {
    enable = lib.mkEnableOption false;
  };

  config = lib.mkIf cfg.enable {

    home-manager.users.adam.programs.qutebrowser = {
      enable = true;
      settings = {
        window.transparent = true;
        auto_save.session = true;
        content.javascript.clipboard = "access";
        zoom.default = "125";
        colors = {
          webpage.darkmode.enabled = true;
          webpage.preferred_color_scheme = "dark";
        };
        fonts.default_size = "18pt";
        fonts.web.size.minimum = 14;

        # tabs
        tabs = {
          title.format = "{current_title} {audio}";
          position = "left";
          show = "switching";
          # show = "always";
          width = 240;
        };
        colors.tabs.bar.bg = "#111";

        # hints
        hints = {
          chars = "uhetonasmkwj";
          border = "solid 1px #ffff0066";
        };
        colors.hints = {
          bg = "#000000";
          fg = "#ffff00";
        };
      };
      keyBindings = {
        normal = {
          x = "tab-close";
          d = "scroll-page 0 0.5";
          u = "scroll-page 0 -0.5";
          tm = "tab-mute";
          wi = "devtools window";
          ";;" = "hint inputs --first";
          "<Ctrl+/>" = "hint links spawn --detach mpv {hint-url}";
        };
        command = {
          "<Ctrl+j>" = "completion-item-focus next";
          "<Ctrl+k>" = "completion-item-focus prev";
          "<Ctrl+d>" = "completion-item-focus next-page";
          "<Ctrl+u>" = "completion-item-focus prev-page";
          "<Ctrl+n>" = "completion-item-focus next-category";
          "<Ctrl+p>" = "completion-item-focus prev-category";
        };
      };

      keyMappings = { "<Alt+x>" = ":"; };

      searchEngines = {
        DEFAULT = "https://duckduckgo.com/?q={}";
        np = "https://mynixos.com/search?q={}";
        gh = "https://github.com/search?q={}&type=repositories";
        nw = "https://nixos.wiki/index.php?search={}";
        yt = "https://youtube.com/search?q={}";
        az = "https://amazon.com/s?k={}";
        hm =
          "https://github.com/search?q=repo%3Anix-community%2Fhome-manager%20{}";
      };
    };
  };
}
