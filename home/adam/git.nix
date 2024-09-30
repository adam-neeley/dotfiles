{ inputs, config, lib, pkgs, ... }:

with lib; {
  programs = {
    ripgrep.enable = true;

    git = {
      enable = true;
      userName = "monadam";
      userEmail = "aneeley@gmail.com";
    };
  };

  xdg.configFile.git = {
    source = ./git;
    recursive = true;
  };
}
