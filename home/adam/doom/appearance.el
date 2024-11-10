(setq!
 ;; doom-theme 'doom-bluloco-dark
 ;; doom-theme 'doom-ayu-dark
 ;; doom-theme 'doom-homage-black
 ;; doom-theme 'doom-solarized-dark-high-contrast
 ;; doom-theme 'doom-badger
 ;; doom-theme 'doom-feather-dark
 doom-theme 'modus-vivendi
 ;; doom-theme 'doom-opera
 ;; doom-theme 'misterioso
 fancy-splash-image (concat doom-user-dir "splash.png")
 )
(setq! modus-themes-bold-constructs t
       modus-themes-deuteranopia nil
       modus-themes-hl-line '(accented underline intense)
       modus-themes-variable-pitch-ui t
       ;; modus-themes-syntax '(alt-syntax green-strings)
       )

;; fonts
;; Examples:
;;   (setq doom-font (font-spec :family "Fira Mono" :size 12))
;;   (setq doom-font "Terminus (TTF):pixelsize=12:antialias=off")
;;   (setq doom-font "Fira Code-14")
(setq! doom-font (font-spec :family "DejaVuSansM Nerd Font" :size 19)
       doom-font-increment 1
       doom-variable-pitch-font (font-spec :family "Alegreya Sans" :size 20)
       doom-big-font (font-spec :family "DejaVuSansM Nerd Font" :size 24))


;; opacity
(doom/set-frame-opacity 90)

(put 'customize-face 'disabled nil)
(custom-set-faces
 '(adam-directory ((t (:background "dark slate gray" :foreground "turquoise" :box (:line-width (1 . 1) :color "dim gray" :style released-button) :weight bold))) t)
 '(adam-header ((t (:height 2.0 :inherit variable-pitch))) t)
 '(adam-highlight ((t (:inherit highlight :foreground "light gray" :weight bold :height 1.2))) t)
 '(org-default ((t (:inherit default :height 1))))
 '(org-document-info ((t (:foreground "pale turquoise" :slant italic :height 1.2))))
 '(org-document-title ((t (:inherit variable-pitch :foreground "pale turquoise" :weight bold :height 2.4))))
 '(org-headline-done ((t (:foreground "dim gray" :strike-through t))))
 '(org-tag ((t (:foreground "gold" :box (:line-width (1 . 1) :color "gold" :style released-button) :slant italic :weight bold))))
 '(outline-1 ((t (:height 1.20 :inherit font-lock-variable-name-face))))
 '(outline-2 ((t (:height 1.15 :inherit font-lock-variable-name-face))))
 '(outline-3 ((t (:height 1.10 :inherit font-lock-keyword-face))))
 '(outline-4 ((t (:height 1.05 :inherit font-lock-comment-face))))
 '(ts-fold-replacement-face ((t (:foreground unspecified :box nil :inherit font-lock-comment-face :weight light)))))
