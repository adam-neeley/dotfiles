;; keybindings
(keymap-global-set "C-="                #'default-text-scale-increase)
(keymap-global-set "C--"                #'default-text-scale-decrease)
(keymap-global-set "C-s"                #'save-buffer)
(keymap-global-set "C-/"                #'comment-line)
(keymap-global-set "<f8>"               'gptel-menu)
(keymap-global-set "S-<f8>"             'gptel-send)
(keymap-global-set "<f9>"               'org-tree-slide-mode)
(keymap-global-set "S-<f9>"             'org-tree-slide-skip-done-toggle)

(keymap-global-set "C-h"                'evil-window-left)
(keymap-global-set "C-j"                'evil-window-down)
(keymap-global-set "C-k"                'evil-window-up)
(keymap-global-set "C-l"                'evil-window-right)

(keymap-global-set "C-S-h"              '+evil/window-move-left)
(keymap-global-set "C-S-j"              '+evil/window-move-down)
(keymap-global-set "C-S-k"              '+evil/window-move-up)
(keymap-global-set "C-S-l"              '+evil/window-move-right)

(keymap-global-set "C-M-h"              'evil-window-decrease-width)
(keymap-global-set "C-M-j"              'evil-window-increase-height)
(keymap-global-set "C-M-k"              'evil-window-decrease-height)
(keymap-global-set "C-M-l"              'evil-window-increase-width)

;; (keymap-global-set "C-p"                'evil-previous-buffer)
;; (keymap-global-set "C-n"                'evil-next-buffer)
