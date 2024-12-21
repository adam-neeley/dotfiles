;;; lib.el -*- lexical-binding: t; -*-

(defvar favorite-themes
  '(doom-snazzy
    doom-bluloco-dark
    doom-ayu-dark
    doom-homage-black
    doom-solarized-dark-high-contrast
    doom-badger
    doom-feather-dark
    modus-vivendi
    doom-city-lights
    doom-opera
    doom-oceanic-next))

(defun adam/random-theme ()
  "Load a random theme."
  (interactive)
  (setq doom-theme (nth (random (length favorite-themes)) favorite-themes))
  (load-theme doom-theme t))
