;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq!
 config-dir "~/.config/doom"
 dotfiles "~/dotfiles"
 my/secrets (concat config-dir "/secrets.el")
 doom-user-dir (concat dotfiles "/home/adam/doom"))

;; personal info

(setq user-full-name "Adam Neeley"
      user-login-name "adam"
      user-mail-address "adam.t.neeley@protonmail.com")

;; ui
(setq!
 window-min-width 30
 split-width-threshold 80
 split-height-threshold 40
 line-spacing 0
 display-line-numbers-type t)

(setq!
 company-idle-delay 0
 company-icon-size '(auto-scale . 32)
 company-selection-wrap-around t
 company-tooltip-align-annotations t
 ;; company-tooltip-maximum-width 1000
 ;; company-tooltip-minimum-width 10
 completions-max-height 20
 completions-highlight-face 'adam-highlight
 )


(setq!
 lsp-headerline-breadcrumb-enable nil
 lsp-ui-sideline-show-hover t
 lsp-ui-sideline-enable t
 lsp-ui-imenu-auto-refresh t)

;; (setq! +doom-dashboard-menu-sections
;;        (seq-concatenate
;;         'list
;;         ;; (list '("dotfiles"
;;         ;;         :icon (nerd-icons-octicon "nf-oct-briefcase" :face 'doom-dashboard-menu-title)
;;         ;;         :action projectile-switch-project))
;;         (cl-subseq +doom-dashboard-menu-sections 0 2)))

;; (setf +doom-dashboard-menu-sections)

;; web browser
(setq! browse-url-browser-function 'eww-browse-url)

;; git
(after! magit
  (setq magit-diff-refine-hunk 'all)
  (setq magit-revision-show-gravatars '("^Author:     " . "^Commit:     ")))

;; shell
(setq shell-file-name (executable-find "zsh"))
(setq-default shell-file-name (executable-find "zsh"))
(setq-default explicit-shell-file-name (executable-find "fish"))

;; evil
(setq! evil-scroll-count 5)

;; projectile
(setq!
 projectile-auto-discover t
 projectile-sort-order 'recently-active
 projectile-project-search-path '("~/projects/" "~/code/"
                                  ;;"~/docs/" "~/school/"
                                  )
 ;; projectile-switch-project-action #'dirvish
 savehist-autosave-interval 100)

(setq!
 dirvish-hide-details t
 dired-sort-by-extension t
 dired-show-hidden-files nil
 dired-listing-switches "-laG")



;; includes
(load! my/secrets)
(load! "org-mode")
(load! "appearance")
(load! "keybinds")
(load! "ai")
(load! "lang")
