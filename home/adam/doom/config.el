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
(setq!
 ;; doom-theme 'doom-bluloco-dark
 ;; doom-theme 'doom-homage-black
 doom-theme 'doom-badger
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

;; (setq! org-format-latex-options (plist-put org-format-latex-options :scale 2))


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

;; org-mode
(setq! org-directory    "~/docs/org/"
       org-agenda-files (apply 'append
                               (mapcar
                                (lambda (directory)
                                  (directory-files-recursively
                                   directory org-agenda-file-regexp))
                                '("~/docs/org/" "~/school/humboldt/")))
       org-startup-with-latex-preview 't
       org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "PROG(p)" "INTR(i)" "DONE(d)"))
       org-agenda-with-colors 't
       org-hide-macro-markers 't
       org-hide-emphasis-markers 't)

(defvar my-org-hidden-keywords
  '(title author date email tags options description))

(defun org-hide-keywords ()
  (save-excursion
    (let (beg end ov)
      (goto-char (point-min))
      (while (re-search-forward
              (concat "\\(^[ \t]*#\\+\\)\\("
                      (mapconcat (lambda (kw)
                                   (format "%s:\s"(symbol-name kw)))
                                 my-org-hidden-keywords "\\|")
                      "\\)")
              nil t)
        (setq beg (match-beginning 1)
              end (match-end 2)
              ov  (make-overlay beg end))
        (overlay-put ov 'invisible t)))))

(add-hook 'org-mode-hook 'org-hide-keywords)

;; (plist-put! org-babel-default-header-args  '( :results . "drawer" ))

(defun org-babel-execute:mips (body params)
  "Execute a block of MIPS code with org-babel."
  (let ((in-file (org-babel-temp-file "m" ".mips")))
    (with-temp-file in-file
      (insert body))
    (org-babel-eval
     (format "Mars nc %s"
             (org-babel-process-file-name in-file))
     "")))

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
