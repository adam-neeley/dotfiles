{ config, lib, pkgs, home-manager, ... }:

let cfg = config.modules.web.browser.brave;
in {
  options.modules.web.browser.brave = { enable = lib.mkEnableOption false; };

  config = lib.mkIf cfg.enable {

    home-manager.users.adam.programs.brave = {
      enable = true;
      package = pkgs.brave;

      extensions = [
        "jlgkpaicikihijadgifklkbpdajbkhjo" # crx mouse
        "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
        "ihcjicgdanjaechkgeegckofjjedodee" # malwarebytes browser guard
        "nngceckbapebfimnlniiiahkandclblb" # bitwarden
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      ];
    };
  };
}
