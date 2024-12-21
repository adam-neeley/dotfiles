;;; $DOOMDIR/appearance.el -*- lexical-binding: t; -*-

(setq! fancy-splash-image (concat config-dir "splash.png"))
(setq! modus-themes-bold-constructs t
       modus-themes-variable-pitch-ui t)

(setq! doom-font (font-spec :family "DejaVuSansM Nerd Font" :size 19)
       doom-font-increment 1
       doom-variable-pitch-font (font-spec :family "Alegreya Sans" :size 20)
       doom-big-font (font-spec :family "DejaVuSansM Nerd Font" :size 24))


(setq! dired-directory-face 'adam-directory
       dired-header-face 'adam-header)
(custom-set-faces!
  '(mode-line-inactive :height 0.8)
  '(org-document-title :height 4.0)
  '(outline-1  :height 1.4)
  '(outline-2  :height 1.3)
  '(outline-3  :height 1.2)
  '(outline-4  :height 1.1)
  '(outline-5  :height 1.0)
  '(doom-modeline :height 1.0)
  '(line-number :height 0.7 :slant normal)
  '(line-number-current-line :slant normal :inherit line-number font-lock-comment-face))
