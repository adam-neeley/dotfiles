;;; context/init.el -*- lexical-binding: t; -*-

(disable-theme doom-theme)
(setq! doom-theme 'doom-plain)
(doom-init-theme-h)

(projectile-switch-project-by-name "~/docs")
