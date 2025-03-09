{ config, lib, pkgs, ... }:

{

  xdg.desktopEntries = {
    todo = {
      name = "TODO";
      type = "Application";
      exec = "emacs --file /home/adam/docs/todo.org";
      icon = "emacs";
    };
    docs = {
      name = "Documents";
      type = "Application";
      exec =
        "emacs -l /home/adam/dotfiles/home/adam/doom/style/docs.el --file /home/adam/docs";
      icon = "emacs";
      categories = [ "Utility" ];
    };
  };
}
