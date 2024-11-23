;;; $DOOMDIR/appearance.el -*- lexical-binding: t; -*-

(defvar favorite-themes
  '(
    doom-snazzy
    ;; doom-theme-bluloco-dark
    doom-bluloco-dark
    doom-ayu-dark
    doom-homage-black
    doom-solarized-dark-high-contrast
    doom-badger
    doom-feather-dark
    modus-vivendi
    doom-city-lights
    doom-opera
    doom-oceanic-next)
  "adam's favorite themes")

(defun adam/random-theme ()
  "Load random theme"
  (interactive)
  (setq doom-theme (nth (random (length favorite-themes)) favorite-themes))
  (load-theme doom-theme t))

(adam/random-theme)

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
  '(outline-1  :height 1.4)
  '(outline-2  :height 1.3)
  '(outline-3  :height 1.2)
  '(outline-4  :height 1.1)
  '(outline-5  :height 1.0)
  '(doom-modeline :height 1.0)
  '(line-number :height 0.6)
  '(line-number-current-line :slant normal :inherit line-number hl-line-face))
