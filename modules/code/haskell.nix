{ config, lib, pkgs, ... }:

with lib;
let cfg = config.modules.code.haskell;
in {
  options.modules.code.haskell = { enable = mkEnableOption false; };
  # Binary Cache for Haskell.nix
  config = mkIf cfg.enable {
    nix.settings.trusted-public-keys =
      [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
    nix.settings.substituters = [ "https://cache.iog.io" ];

    environment.systemPackages = with pkgs; [
      # gsl
      # haskellPackages.cabal2nix
      # haskellPackages.ghcup # "broken package"
      # haskellPackages.hasktags
      # haskellPackages.hoogle
      # haskellPackages.lsp
      # lapack
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
