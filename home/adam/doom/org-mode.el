;;; $DOOMDIR/org-mode.el -*- lexical-binding: t; -*-

;; org-mode
(setq! org-directory "~/docs/org/"
       ;; TODO fix recursive file search:
       ;; org-agenda-files (apply 'append
       ;;                         (mapcar
       ;;                          (lambda (directory)
       ;;                            (directory-files-recursively directory org-agenda-file-regexp))
       ;;                          '("~/docs/org/" "~/school/" "~/dotfiles/")))
       org-startup-with-latex-preview 't
       org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "PROG(p)" "SKIP(s)" "INTR(i)" "DONE(d)"))
       org-agenda-with-colors 't
       org-hide-macro-markers 't
       org-mobile-directory "~/docs/org/davfs/"
       org-mobile-inbox-for-pull "~/docs/org/mobile/"
       org-capture-templates '(("t" "todo" entry
                                (file +org-capture-todo-file)
                                "* [ ] %?\n%i\n" :prepend t)
                               ("s" "school" entry
                                (file "~/docs/org/school.org")
                                "* %u %?\n%i\n" :prepend t)
                               ("n" "note" entry
                                (file +org-capture-notes-file)
                                "* %u %?\n%i\n" :prepend t)
                               ("d" "dotfiles todo" entry
                                (file "~/docs/org/dotfiles.org")
                                "* TODO %?\n")
                               ("j" "journal" entry
                                (file+olp+datetree +org-capture-journal-file)
                                "* %u %?\n%i\n" :prepend t)
                               ("i" "idea" entry
                                (file "~/docs/org/ideas.org")
                                "* IDEA %?\n%i\n" :prepend t)
                               ("p" "templates for projects")
                               ("pt" "project-local TODO" entry
                                (file+headline +org-capture-project-todo-file "inbox")
                                "* TODO %?\n%i\n" :prepend t)
                               ("pn" "project-local notes" entry
                                (file+headline +org-capture-project-notes-file "inbox")
                                "* %u %?\n%i\n" :prepend t)
                               ("pc" "project-local changelog" entry
                                (file+headline +org-capture-project-changelog-file "unreleased")
                                "* %u %?\n%i\n" :prepend t)
                               ("o" "centralized templates for projects")
                               ("ot" "project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n" :heading "tasks" :prepend nil)
                               ("on" "project notes" entry #'+org-capture-central-project-notes-file "* %u %?\n %i\n" :heading "notes" :prepend t)
                               ("oc" "project changelog" entry #'+org-capture-central-project-changelog-file "* %u %?\n %i\n" :heading "changelog" :prepend t))
       org-hide-emphasis-markers 't
       org-format-latex-options (plist-put org-format-latex-options :scale 2))

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

(defun org-babel-execute:mips (body)
  "Execute a block of MIPS code with org-babel."
  (let ((in-file (org-babel-temp-file "m" ".mips")))
    (with-temp-file in-file
      (insert body))
    (org-babel-eval
     (format "Mars nc %s"
             (org-babel-process-file-name in-file))
     "")))

(custom-set-faces!
  nil
  '(org-block :inherit fixed-pitch)
  '(org-code :inherit shadow fixed-pitch)
  '(org-document-info :foreground "dark orange")
  '(org-meta-line :inherit font-lock-comment-face fixed-pitch)
  '(org-document-info-keyword :inherit shadow fixed-pitch))
