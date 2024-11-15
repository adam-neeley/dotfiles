;;; $DOOMDIR/org-mode.el -*- lexical-binding: t; -*-

;; org-mode
(setq! org-directory "~/docs/org/"
       org-agenda-tags-column 'auto
       org-super-agenda-show-message nil
       org-super-agenda-final-group-separator "\n"
       org-global-tags-completion-table nil
       ;; TODO fix recursive file search:
       ;; org-agenda-files (apply 'append
       ;;                         (mapcar
       ;;                          (lambda (directory)
       ;;                            (directory-files-recursively directory org-agenda-file-regexp))
       ;;                          '("~/docs/org/" "~/school/" "~/dotfiles/")))
       org-startup-with-latex-preview nil
       org-todo-keywords
       ;; '((sequence
       ;;    "[ ](t)" "[x](d)" "TODO(T)" "DONE(D)" "NOW(n)" "NO(N)" "WAIT(w)" "PROG(p)" "SKIP(s)" "INTR(i)"))
       '((sequence
          "[ ](t)" ; doing later
          "[-](n)" ; doing now or soon
          "|"
          "[x](d)" ; done
          )
         (sequence
          "TODO(T)" ; doing later
          "NEXT(N)" ; doing now or soon
          "|"
          "DONE(D)" ; done
          )
         (sequence
          "WAIT(w)" ; waiting for some external change (event)
          "HOLD(h)" ; waiting for some internal change (of mind)
          "IDEA(i)" ; maybe someday
          "|"
          "NOTE(o@/!)" ; end state, just keep track of it
          "STOP(s@/!)" ; stopped waiting, decided not to work on it
          ))
       org-agenda-with-colors t
       org-agenda-skip-scheduled-if-done t
       org-agenda-timegrid-use-ampm t
       org-agenda-scheduled-leaders '("" "")
       org-agenda-deadline-leaders '("due today: " "due in %d days: " "due %d ago: ")
       org-agenda-span 'week
       org-hide-macro-markers t
       ;; org-mobile-directory "~/docs/org/davfs/"
       ;; org-mobile-inbox-for-pull "~/docs/org/mobile/"
       )

;; (setq! org-capture-templates
;; TODO
;;        ((org-capture-todo "todo")))
(setq!
 org-capture-templates
 '(("t" "todo"   entry (file +org-capture-todo-file)  "* [ ] %?" :prepend nil :heading "inbox")
   ("s" "school" entry (file "~/docs/org/school.org") "* [ ] %?" :prepend nil :heading "school")
   ("n" "note"   entry (file +org-capture-notes-file) "* NOTE %?" :prepend nil :heading "notes")
   ("d" "dotfiles" entry (file +org-capture-todo-file) "* [ ] %?" :prepend nil :heading "dotfiles")
   ("j" "journal" entry (file+olp+datetree +org-capture-journal-file) "* %?")
   ("i" "idea" entry (file "~/docs/org/ideas.org") "* IDEA %?\n%i" :prepend t)
   ("p" "templates for projects")
   ("pt" "project-local todo" entry (file +org-capture-project-todo-file) "* [ ] %?\n%i" :prepend nil)
   ("pn" "project-local note" entry (file +org-capture-project-notes-file) "* NOTE %? %u" :prepend nil)
   ("pc" "project-local changelog" entry (file+headline +org-capture-project-changelog-file "unreleased") "* %u %?\n%i\n" :prepend nil)
   ("o" "centralized templates for projects")
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

(add-hook 'org-mode-hook 'org-hide-keywords)

(org-super-agenda-mode)
(setq! org-super-agenda-header-map nil
       org-super-agenda-unmatched-order 150
       org-super-agenda-groups
       '((:name "Schedule" :time-grid t :order 0)
         (:name "Priority" :priority ("A" "B") :order 10)
         (:name "Done" :todo ("DONE" "[x]") :order 199)
         (:name "Scheduled" :scheduled t :order 30)
         (:name "Buy" :todo "BUY" :tag "buy" :regexp "buy" :order 27)
         (:name "To do" :todo ("TODO" "[ ]") :order 25)
         (:name "Wait" :todo "WAIT" :order 100)
         (:name "Nope" :todo "NO" :order 200)
         (:name "Eventually" :todo ("SOMEDAY" "TO-READ" "CHECK") :order 300)))

(custom-set-faces!
  '(org-block :inherit fixed-pitch)
  '(org-code :inherit shadow fixed-pitch)
  '(org-meta-line :inherit font-lock-comment-face fixed-pitch)
  '(org-document-info-keyword :inherit shadow fixed-pitch)
  '(default :background nil)
  '(doom-modeline :height 1.05)
  '(org-agenda-date :foreground "#C594C5" :slant italic :weight ultra-bold)
  '(org-super-agenda-header :inherit org-agenda-structure :height 1.1))
