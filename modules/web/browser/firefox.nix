{ home-manager, config, lib, pkgs, ... }:

let cfg = config.modules.web.browser.firefox;
in {
  options.modules.web.browser.firefox = { enable = lib.mkEnableOption false; };

  config = lib.mkIf cfg.enable {

    # home-manager.users.adam.programs = {
    programs = {
      firefox = {
        # NixOS Discourse Guide by "sleepy"
        enable = true;
        policies = {
          DisableTelemetry = true;
          DisableFirefoxStudies = true;
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
          DisablePocket = true;
          DisableFirefoxAccounts = true;
          DisableAccounts = true;
          DisableFirefoxScreenshots = true;
          OverrideFirstRunPage = "";
          OverridePostUpdatePage = "";
          DontCheckDefaultBrowser = true;
          DisplayBookmarksToolbar =
            "never"; # alternatives: "always" or "newtab"
          DisplayMenuBar =
            "default-off"; # alternatives: "always", "never" or "default-on"
          SearchBar = "unified"; # alternative: "separate"

          # ---- EXTENSIONS ----
          # Check about:support for extension/add-on ID strings.
          # Valid strings for installation_mode are "allowed", "blocked",
          # "force_installed" and "normal_installed".
          ExtensionSettings = let
            # TODO map/merge following list
            # extensions = [
            #   {
            #     # vimium
            #     id = "{d7742d87-e61d-4b78-b8a1-b469842139fa}";
            #     url =
            #       "https://addons.mozilla.org/firefox/downloads/file/4259790/vimium_ff-2.1.2.xpi";
            #   }
            #   {
            #     # mouse gestures
            #     id = "{506e023c-7f2b-40a3-8066-bc5deb40aebe}";
            #     url =
            #       "https://addons.mozilla.org/firefox/downloads/latest/gesturefy/latest.xpi";
            #   }
            #   {
            #     # dark reader
            #     id = "addon@darkreader.org";
            #     url =
            #       "https://addons.mozilla.org/firefox/downloads/file/4317971/darkreader-4.9.88.xpi";
            #   }
            #   {
            #     # bitwarden
            #     id = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
            #     url =
            #       "https://addons.mozilla.org/firefox/downloads/file/4307738/bitwarden_password_manager-2024.6.3.xpi";
            #   }
            #   {
            #     # uBlock

            #     id = "uBlock0@raymondhill.net";
            #     url =
            #       "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            #   }
            #   {
            #     # Privacy Badger:
            #     id = "jid1-MnnxcxisBPnSXQ@jetpack";
            #     url =
            #       "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            #   }
            # ];
          in {
            "*".installation_mode = "allowed";
            # vimium
            "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
              install_url =
                "https://addons.mozilla.org/firefox/downloads/file/4259790/vimium_ff-2.1.2.xpi";
              installation_mode = "force_installed";
            };
            # mouse gestures
            "{506e023c-7f2b-40a3-8066-bc5deb40aebe}" = {
              install_url =
                "https://addons.mozilla.org/firefox/downloads/latest/gesturefy/latest.xpi"; # "https://addons.mozilla.org/firefox/downloads/file/4264332/gesturefy-3.2.12.xpi";
              installation_mode = "force_installed";
            };
            # dark reader
            "addon@darkreader.org" = {
              install_url =
                "https://addons.mozilla.org/firefox/downloads/file/4317971/darkreader-4.9.88.xpi";
              installation_mode = "force_installed";
            };
            # bitwarden
            "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
              install_url =
                "https://addons.mozilla.org/firefox/downloads/file/4307738/bitwarden_password_manager-2024.6.3.xpi";
              installation_mode = "force_installed";
            };
            # uBlock
            "uBlock0@raymondhill.net" = {
              install_url =
                "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
            };
            # Privacy Badger:
            "jid1-MnnxcxisBPnSXQ@jetpack" = {
              install_url =
                "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
              installation_mode = "force_installed";
            };
          };

          Preferences = let
            lock-true = {
              Value = true;
              Status = "locked";
            };
            lock-false = {
              Value = false;
              Status = "locked";
            };
          in {
            # Check about:config for options.
            "browser.contentblocking.category" = {
              Value = "strict";
              Status = "locked";
            };
            "extensions.pocket.enabled" = lock-false;
            "extensions.screenshots.disabled" = lock-true;
            "browser.topsites.contile.enabled" = lock-false;
            "browser.formfill.enable" = lock-false;
            "browser.search.suggest.enabled" = lock-false;
            "browser.search.suggest.enabled.private" = lock-false;
            "browser.urlbar.suggest.searches" = lock-false;
            "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" =
              lock-false;
            "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
            "browser.newtabpage.activity-stream.section.highlights.includePocket" =
              lock-false;
            "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" =
              lock-false;
            "browser.newtabpage.activity-stream.section.highlights.includeDownloads" =
              lock-false;
            "browser.newtabpage.activity-stream.section.highlights.includeVisited" =
              lock-false;
            "browser.newtabpage.activity-stream.showSponsored" = lock-false;
            "browser.newtabpage.activity-stream.system.showSponsored" =
              lock-false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" =
              lock-false;
          };
        };
      };

    };
  };
}
