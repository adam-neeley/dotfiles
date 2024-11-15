(setq!
 ;; doom-theme 'doom-bluloco-dark
 ;; doom-theme 'doom-ayu-dark
 ;; doom-theme 'doom-homage-black
 ;; doom-theme 'doom-solarized-dark-high-contrast
 ;; doom-theme 'doom-badger
 ;; doom-theme 'doom-feather-dark
 ;; doom-theme 'modus-vivendi
 ;; doom-theme 'doom-city-lights
 ;; doom-theme 'doom-opera
 ;; doom-theme 'misterioso
 doom-theme 'doom-oceanic-next
 fancy-splash-image (concat doom-user-dir "splash.png")
 )
(setq! modus-themes-bold-constructs t
       modus-themes-deuteranopia nil
       modus-themes-hl-line '(accented underline intense)
       modus-themes-variable-pitch-ui t)

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

(custom-set-faces!
  '(outline-1  :height 1.4)
  '(outline-2  :height 1.3)
  '(outline-3  :height 1.2)
  '(outline-4  :height 1.1)
  '(outline-5  :height 1.0)
  ;; '(outline-6  :height 1.0)
  ;; '(outline-7  :height 1.0)
  ;; '(outline-8  :height 1.0)

  ;; '(org-default :inherit variable-pitch :height 1.0)
  '(org-document-title :inherit variable-pitch :height 3.0)
  '(org-document-info :height 1.2))
;; '(default :background "black" :weight normal))

;; (custom-set-faces!
;;   '((outline-1 outline-2 outline-3 outline-4 outline-5 outline-6)
;;     :weight normal)
;;   '((default region)
;;     :background "red" :weight bold))

;; (let ((red-bg-faces '(default region)))
;;   (custom-set-faces!
;;     `(,(cl-loop for i from 0 to 6 collect (intern (format "outline-%d" i)))
;;       :weight normal)
;;     `(,red-bg-faces
;;       :background "red" :weight bold)))

;; You may utilise `doom-themes's theme API to fetch or tweak colors from their
;; palettes. No need to wait until the theme or package is loaded. e.g.
;; (custom-set-faces!
;;   `(outline-1 :foreground ,(doom-color 'red))
;;   `(outline-2 :background ,(doom-color 'blue)))
;; (custom-set-faces!)

;; (set-face-attribute 'adam-header ((t (:background "dark slate gray" :foreground "turquoise" :box (:line-width (1 . 1) :color "dim gray" :style released-button) :weight bold))))
;; (put 'customize-face 'disabled nil)
;; (custom-set-faces
;;  '(adam-directory  t)
;;  '(adam-header ((t (:height 3.0 :inherit variable-pitch))) t)
;;  '(adam-highlight ((t (:inherit highlight :foreground "light gray" :weight bold :height 1.2))) t)
;;  '(org-default ((t (:inherit variable-pitch :height 1.5))))
;;  '(org-document-info ((t (:slant italic :height 1.3))))
;;  '(org-document-title ((t (:inherit variable-pitch :height 2.0))))
;;  '(org-headline-done ((t (:foreground "dim gray" :strike-through t))))
;;  '(org-tag ((t (:foreground "gold" :box (:line-width (1 . 1) :color "gold" :style released-button) :slant italic :weight bold))))
;;  ;; '(org-level-1 ((t :inherit outline-1)))
;;  '(outline-1 ((t (:height 1.20 :inherit font-lock-variable-name-face))))
;;  '(outline-2 ((t (:height 1.15 :inherit font-lock-variable-name-face))))
;;  '(outline-3 ((t (:height 1.10 :inherit font-lock-keyword-face))))
;;  '(outline-4 ((t (:height 1.05 :inherit font-lock-comment-face))))
;;  '(ts-fold-replacement-face ((t (:foreground unspecified :box nil :inherit font-lock-comment-face :weight light)))))
