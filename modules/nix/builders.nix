{ config, lib, pkgs, ... }:

let
  cfg = config.modules.nix.builders;
  sshKeyFile = "/home/adam/.ssh/adam.t.neeley@pm.me";
  sshPubKeyFile = "${sshKeyFile}.pub";
in {
  options.modules.nix.builders.enable = lib.mkEnableOption false;

  config = lib.mkIf cfg.enable {
    programs.ssh.extraConfig = ''
      Host eu.nixbuild.net
        PubkeyAcceptedKeyTypes ssh-ed25519
        ServerAliveInterval 60
        IPQoS throughput
        IdentityFile ${sshKeyFile}
    '';

    programs.ssh.knownHosts = {
      nixbuild = {
        hostNames = [ "eu.nixbuild.net" ];
        publicKey = (builtins.readFile sshPubKeyFile);
      };
    };

    nix = {
      distributedBuilds = true;
      settings.builders-use-substitutes = true;

      buildMachines = map (system: {
        inherit system;
        hostName = "eu.nixbuild.net";
        maxJobs = 100;
        supportedFeatures = [ "benchmark" "big-parallel" ];
      }) [ "aarch64-linux" ];
    };
  };
}
