;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; personal info

;; (setq doom-user-dir "$DOOMDIR")

(setq user-full-name "monadam"
      user-login-name "adam"
      user-mail-address "aneeley@gmail.com")

;; ui
(setq!
 ;; doom-theme 'doom-bluloco-dark
 doom-theme 'doom-homage-black
 ;; doom-theme 'doom-badger
 ;; doom-theme 'doom-feather-dark
 ;; doom-theme 'modus-vivendi
 ;; doom-theme 'doom-opera
 fancy-splash-image (concat doom-user-dir "splash.png")

 company-idle-delay 0
 company-tooltip-minimum-width 10
 split-width-threshold nil
 preview-scale-function 2.5
 lsp-ui-sideline-diagnostic-max-lines 2
 line-spacing 3
 display-line-numbers-type nil)



;; fonts
(setq! doom-font (font-spec :family "JetBrainsMono Nerd Font" :weight nil :size 16)
       doom-font-increment 1
       doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 24))


;; opacity
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))

;; web browser
(setq browse-url-browser-function 'eww-browse-url)

;; shell
(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell (executable-find "fish"))
(setq-default explicit-shell-file-name (executable-find "fish"))

;; projectile
(setq!
 projectile-auto-discover 't
 projectile-sort-order 'recently-active
 projectile-project-search-path '("~/docs/" "~/code/" "~/school/")
 savehist-autosave-interval 10)

;; auto-load
(add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))

;; includes
(load! "keybinds")
(load! "org-mode")
(load! "lang")
(if (file-exists-p "gptel.el")
    (load! "gptel.el"))
