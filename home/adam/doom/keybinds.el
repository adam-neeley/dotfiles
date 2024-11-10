;; keybindings

(map! :g "C-="      #'default-text-scale-increase
      :g "C--"      #'default-text-scale-decrease
      :g "C-s"      #'save-buffer
      :g "C-/"      #'comment-line)

;; make
(map! :leader
      :n "M R"      #'+make/run
      :n "M L"      #'+make/run-last)

;; ai
(map!
 :n "C-S-c g m" 'gptel-menu
 :n "C-S-c g s" 'gptel-send
 :n "C-S-c t d" 'tabnine-chat-document-code
 :n "C-S-c t e" 'tabnine-chat-explain-code
 :n "C-S-c t c" 'tabnine-chat)

;; customize
(map!
 "C-' f" 'customize-face
 "C-' b" 'customize-browse
 "C-' c" 'customize-changed
 "C-' t t" 'customize-themes
 "C-' t c" 'customize-create-theme
 "C-' o" 'customize-option
 "C-' O" 'customize-option-other-window)

(map! :map doom-leader-map
      :leader
      "TAB h" '+workspace:switch-previous
      "TAB l" '+workspace:switch-next
      "k" 'previous-buffer
      "j" 'next-buffer)

;; (map! :map tabnine-completion-map
;;       "C-TAB"  'tabnine-accept-completion
;;       "M-f"  'tabnine-accept-completion-by-word
;;       "M-<return>"  'tabnine-accept-completion-by-line
;;       "C-g"  'tabnine-clear-overlay
;;       "M-["  'tabnine-previous-completion
;;       "M-]"  'tabnine-next-completion)

