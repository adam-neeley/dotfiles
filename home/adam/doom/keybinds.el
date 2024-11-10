;; keybindings

(map! :g "C-="      #'default-text-scale-increase
      :g "C--"      #'default-text-scale-decrease
      :g "C-s"      #'save-buffer
      :g "C-/"      #'comment-line)

(map! :leader
      :n "M R"      #'+make/run
      :n "M L"      #'+make/run-last)

(map! :leader
      :n "C M"      'gptel-menu
      :n "C S"      'gptel-send)


(map! :map 'tabnine-completion-map
      "<tab>"  'tabnine-accept-completion
      "TAB"  'tabnine-accept-completion
      "M-f"  'tabnine-accept-completion-by-word
      "M-<return>"  'tabnine-accept-completion-by-line
      "C-g"  'tabnine-clear-overlay
      "M-["  'tabnine-previous-completion
      "M-]"  'tabnine-next-completion)

;; (keymap-global-set "C-h"                'evil-window-left)
;; (keymap-global-set "C-j"                'evil-window-down)
;; (keymap-global-set "C-k"                'evil-window-up)
;; (keymap-global-set "C-l"                'evil-window-right)

;; (keymap-global-set "C-S-h"              '+evil/window-move-left)
;; (keymap-global-set "C-S-j"              '+evil/window-move-down)
;; (keymap-global-set "C-S-k"              '+evil/window-move-up)
;; (keymap-global-set "C-S-l"              '+evil/window-move-right)

;; (keymap-global-set "C-M-h"              'evil-window-decrease-width)
;; (keymap-global-set "C-M-j"              'evil-window-increase-height)
;; (keymap-global-set "C-M-k"              'evil-window-decrease-height)
;; (keymap-global-set "C-M-l"              'evil-window-increase-width)
