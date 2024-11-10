{ config, lib, pkgs, ... }:

let cfg = config.modules.code;
in {

  options.modules.code.enable = lib.mkEnableOption true;

  config =
    {
      programs.direnv.enable = true;

      programs.nix-ld = {
        enable = true; # run unpatched binaries #
        package = pkgs.nix-ld-rs;
      };

      programs.git = {
        enable = true;
        package = (pkgs.git.override { guiSupport = true; });
      };

      environment.systemPackages = with pkgs; [ gnumake github-cli git-doc ];
    };
}
