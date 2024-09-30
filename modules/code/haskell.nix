{ config, lib, pkgs, ... }:

with lib;
let cfg = config.modules.code;
in {
  # options.modules.code.haskell = { enable = mkEnableOption false; };
  config = mkIf cfg.enable {
    nix.settings.trusted-public-keys =
      [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
    nix.settings.substituters = [ "https://cache.iog.io" ];

    environment.systemPackages = with pkgs; [
      ghc
      ghcid
      haskell-language-server
      haskellPackages.cabal-install
      haskellPackages.stack
      hlint
      stylish-haskell
    ];
  };
}
