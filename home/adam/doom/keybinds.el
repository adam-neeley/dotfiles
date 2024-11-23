;; keybindings

(map! "C-="      #'default-text-scale-increase
      "C--"      #'default-text-scale-decrease
      "C-s"      #'save-buffer
      "C-/"      #'comment-line)

;; make
(map! :prefix "C-S-r"
      :n "r"      #'+make/run
      :n "l"      #'+make/run-last
      :n "m"      #'+make/run-last)

;; org-capture
(map! :n "C-S-x" #'org-capture)

;; ai
(map! :prefix "C-S-c"
      :n "m"   #'gptel-menu
      :n "s"   #'gptel-send
      :n "t d" #'tabnine-chat-document-code
      :n "t e" #'tabnine-chat-explain-code
      :n "t t" #'global-tabnine-mode
      :n "t c" #'tabnine-chat)

;; customize
(map! :prefix "C-'"
      "f"   'customize-face
      "b"   'customize-browse
      "c"   'customize-changed
      "t t" 'customize-themes
      "t c" 'customize-create-theme
      "o"   'customize-option
      "O"   'customize-option-other-window)

(map! :leader
      "TAB h" '+workspace:switch-previous
      "TAB l" '+workspace:switch-next
      "k" 'previous-buffer
      "j" 'next-buffer)
