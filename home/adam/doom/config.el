;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; includes
;; keybinds
(load! "keybinds")
(load! "lang")

;; personal info

(setq user-full-name "monadam"
      user-login-name "adam"
      user-mail-address "aneeley@gmail.com")

;; ui
(setq
 ;; doom-theme 'doom-bluloco-dark
 ;; doom-theme 'doom-homage-black
 doom-theme 'modus-vivendi
 ;; doom-theme 'doom-opera

 fancy-splash-image (concat doom-user-dir "splash.png")

 company-idle-delay 0
 company-tooltip-minimum-width 10
 split-width-threshold nil
 preview-scale-function 2.5
 lsp-ui-sideline-diagnostic-max-lines 2
 line-spacing 3
 display-line-numbers-type nil)

;; (setq! org-format-latex-options (plist-put org-format-latex-options :scale 2))


;; fonts
(setq! doom-font (font-spec :family "JetBrainsMono Nerd Font" :weight nil :size 20)
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

;; org-mode
(setq! org-directory    "~/docs/org/"
       org-agenda-files '("~/docs/org/")
       org-startup-with-latex-preview 't
       org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "PROG(p)" "INTR(i)" "DONE(d)"))
       org-agenda-with-colors 't
       org-hide-emphasis-markers 't
       org-hide-macro-markers 't
       org-hide-emphasis-markers 't)

(custom-set-faces!
  nil
  '(org-block :inherit fixed-pitch)
  '(org-code :inherit shadow fixed-pitch)
  '(org-document-info :foreground "dark orange")
  '(org-meta-line :inherit font-lock-comment-face fixed-pitch)
  '(org-document-info-keyword :inherit shadow fixed-pitch))


;; generative ai
(if (file-exists-p "./gptel.el")
    (load! "./gptel.el"))

;; projectile
(setq!
 projectile-auto-discover 't
 projectile-sort-order 'recently-active
 projectile-project-search-path '("/home/adam/code/" "/home/adam/school/")
 savehist-autosave-interval 10)
