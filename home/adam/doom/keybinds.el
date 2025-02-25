                                        ; KEYBINDS

;; buffer workspace
(map!
 "TAB h" '+workspace:switch-previous
 "TAB l" '+workspace:switch-next
 "C-S-h" '+workspace:switch-previous
 "C-S-l" '+workspace:switch-next
 "C-S-p" 'previous-buffer
 "C-S-n" 'next-buffer)

;; zoom
(map! "C-="      #'default-text-scale-increase
      "C--"      #'default-text-scale-decrease
      "C-s"      #'save-buffer
      "C-/"      #'comment-line)

;; ai
(map! :prefix "C-S-a"
      "m"   #'gptel-menu
      "s"   #'gptel-send
      "R"   #'gptel-rewrite
      "d"   #'gptel-system-prompt

      "a"   #'gptel-add
      "q"   #'gptel-abort
      "x"   #'gptel-context-remove-all

      "p" #'chatgpt-shell-prompt
      :v "r" #'chatgpt-shell-send-region

      "t d" #'tabnine-chat-document-code
      "t e" #'tabnine-chat-explain-code
      "t t" #'global-tabnine-mode
      "t c" #'tabnine-chat
      )

;; org-agenda
(map! :n "C-S-x" #'org-capture)

;; customize
;; (map! :prefix "C-'"
;;       "f"   'customize-face
;;       "b"   'customize-browse
;;       "c"   'customize-changed
;;       "t t" 'customize-themes
;;       "t c" 'customize-create-theme
;;       "o"   'customize-option
;;       "O"   'customize-option-other-window)

;; make
(map! :prefix "C-S-r"
      :n "r"      #'+make/run
      :n "l"      #'+make/run-last
      :n "m"      #'+make/run-last)
