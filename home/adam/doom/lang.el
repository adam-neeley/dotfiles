;;; lang.el --- Description -*- lexical-binding: t; -*-


;; latex
(setq! +latex-viewers '(pdf-tools)
       +latex-enable-unicode-math 't
       preview-scale-function 2.5)

;; haskell
(after! 'haskell-mode-hook
  (set-ligatures! 'haskell-mode
                  :lambda "\\"))
;; git

(transient-append-suffix 'magit-merge "-s" '("-a" "Allow unrelated histories" "--allow-unrelated-histories"))

;; mips
;; (after! 'mips-mode-hook
;;   (setq! mips-interpreter "Mars"))

;; (defun org-babel-execute:mips (body)
;;   "Execute a block of MIPS code with org-babel."
;;   (let ((in-file (org-babel-temp-file "m" ".mips")))
;;     (with-temp-file in-file
;;       (insert body))
;;     (org-babel-eval
;;      (format "Mars nc %s"
;;              (org-babel-process-file-name in-file))
;;      "")))


;; plantuml
;; (add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))


;; nix
(with-eval-after-load 'lsp-mode
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "nixd")
                    :major-modes '(nix-mode)
                    :priority 0
                    :server-id 'nixd)))

;; python
(setq-hook! 'python-mode-hook +format-with 'black)
;; (add-hook! 'python-mode-hook #'lsp-ui-imenu)
;; (setq lsp-pyright-langserver-command "basedpyright")
