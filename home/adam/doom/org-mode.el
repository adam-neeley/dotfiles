;;; $DOOMDIR/org-mode.el -*- lexical-binding: t; -*-

;; org
(setq! org-directory "~/docs/org/")
(after! org
  (setq!
   org-startup-with-latex-preview nil
   org-hide-macro-markers t
   org-todo-keywords '((sequence
                        "[ ](t)"    ; later
                        "[-](n)" ; now
                        "[?](w@/!)"    ; wait
                        "|"
                        "[x](d)"    ; done
                        )
                       (sequence
                        "TODO(T)" ; later
                        "NOW(N)"  ; now
                        "WAIT(W@/!)" ; wait
                        "|"
                        "DONE(D)" ; done
                        )
                       (sequence
                        "HOLD(H)" ; waiting for some internal change (of mind)
                        "IDEA(I)" ; maybe someday
                        "|"
                        ;; "NOTE(n@/!)" ; end state, just keep track of it
                        "STOP(S@/!)" ; stopped waiting, decided not to work on it
                        ))
   org-capture-templates
   '(("t" "todo"   entry (file +org-capture-todo-file)  "* [ ] %?" :prepend nil :heading "inbox")
     ("s" "school" entry (file "~/docs/org/school.org") "* [ ] %?" :prepend nil :heading "school")
     ("b" "buy"    entry (file "~/docs/org/buy.org")    "* [ ] %?")
     ("n" "note"   entry (file +org-capture-notes-file) "* NOTE %?" :prepend nil :heading "notes")
     ("d" "dotfiles" entry (file +org-capture-todo-file) "* [ ] %?" :prepend nil :heading "dotfiles")
     ("j" "journal" entry (file+olp+datetree +org-capture-journal-file) "* %?")
     ("i" "idea" entry (file "~/docs/org/ideas.org") "* IDEA %?\n%i" :prepend t)
     ("p" "projects")
     ("pt" "project-local todo" entry (file +org-capture-project-todo-file) "* [ ] %?\n%i" :prepend nil)
     ("pn" "project-local note" entry (file +org-capture-project-notes-file) "* NOTE %? %u" :prepend nil)
     ("pc" "project-local changelog" entry (file+headline +org-capture-project-changelog-file "unreleased") "* %u %?\n%i\n" :prepend nil)
     ("o" "centralized projects")
     ("ot" "project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n" :heading "tasks" :prepend nil)
     ("oi" "project idea" entry #'+org-capture-central-project-todo-file "* IDEA %?\n %i\n" :heading "ideas" :prepend nil)
     ("on" "project notes" entry #'+org-capture-central-project-notes-file "* %u %?\n %i\n" :heading "notes" :prepend t)
     ("oc" "project changelog" entry #'+org-capture-central-project-changelog-file "* %u %?\n %i\n" :heading "changelog" :prepend t)))

  (setq! org-hide-emphasis-markers t)

  (defvar my-org-hidden-keywords
    '(title startup author date email tags options description))

  (defun org-hide-keywords ()
    (save-excursion
      (let (beg end ov)
        (goto-char (point-min))
        (while (re-search-forward
                (concat "\\(^[ \t]*#\\+\\)\\("
                        (mapconcat (lambda (kw)
                                     (format "%s:\s"(symbol-name kw)))
                                   my-org-hidden-keywords "\\|")
                        "\\)")
                nil t)
          (setq beg (match-beginning 1)
                end (match-end 2)
                ov  (make-overlay beg end))
          (overlay-put ov 'invisible t)))))

  (add-hook 'org-mode-hook 'org-hide-keywords))

;; org-agenda
(after! org-agenda
  (setq! org-agenda-with-colors t
         org-agenda-skip-scheduled-if-done t
         org-agenda-timegrid-use-ampm t
         org-agenda-scheduled-leaders '("" "")
         org-agenda-deadline-leaders '("due today: " "due in %d days: " "due %d ago: ")
         org-agenda-span 'week
         org-agenda-tags-column 'auto)
  (org-super-agenda-mode 1))

;; org-super-agenda
(after! org-super-agenda
  (setq!
   org-super-agenda-show-message nil
   org-super-agenda-final-group-separator "\n"

   org-super-agenda-header-map nil
   org-super-agenda-unmatched-order 150
   org-super-agenda-groups '(
                             (:name "Schedule" :time-grid t :order 0)
                             ;; (:name "Scheduled" :deadline t :scheduled t :order 30)
                             (:name "Nope" :todo "NO" :order 200)
                             (:name "Eventually" :todo ("[?]" "HOLD" "WAIT") :order 300)
                             (:name "Priority" :priority ("A" "B") :order 10)
                             (:name "Done" :todo ("DONE" "[x]") :order 199)
                             (:name "Now" :todo ("[-]" "NOW") :order 11)
                             (:name "Idea" :todo "IDEA" :order 102)
                             (:name "Buy" :todo "BUY" :tag "buy" :regexp "buy" :order 27)
                             (:name "To do" :todo ("TODO" "[ ]") :order 25))))


(setq! org-export-with-section-numbers nil)

(org-pdftools-export
 (custom-set-faces!
   '(org-block :inherit fixed-pitch)
   '(org-code :inherit shadow fixed-pitch)
   '(org-meta-line :inherit font-lock-comment-face fixed-pitch)
   '(org-document-title :inherit variable-pitch :height 3.0)
   '(org-document-info-keyword :inherit shadow fixed-pitch)
   '(org-agenda-date :foreground "#C594C5" :slant italic :weight ultra-bold)
   '(org-agenda-date-today
     :weight bold
     :box (:line-width (1 . 1) :color "light gray" :style flat))
   '(org-document-info :height 1.2)
   '(org-agenda-date :foreground "#C594C5" :slant italic :weight ultra-bold :height 1.2)
   '(org-super-agenda-header :inherit org-agenda-structure :height 1.1))
