{ config, lib, pkgs, ... }:

{
  users.users = {
    adam = {
      description = "adam";
      extraGroups = [ "networkmanager" "wheel" "audio" "davfs2" ];
      initialHashedPassword =
        "$y$j9T$42f.KUzl/ncm8ttyPcbwO1$sVm14SGGhAky1aYpGKKmvGKwG7udbyfDmvzitOk3vO0";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ ];
    };

    user =
      let
        user = builtins.getEnv "USER";
        name = if builtins.elem user [ "" "root" ] then "adam" else user;
      in
      {
        inherit name;
        description = "The primary user";
        extraGroups = [ "wheel" ];
        isNormalUser = true;
        home = "/home/${name}";
        group = "users";
        uid = 1000;
      };
  };
}
