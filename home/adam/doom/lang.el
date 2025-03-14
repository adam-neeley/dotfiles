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
;; Pull the lsp-mode package
(use-package lsp-mode
  :commands (lsp lsp-deferred))

;; Set up OLS as the language server for Odin, ensuring lsp-mode is loaded first
(with-eval-after-load 'lsp-mode
  (setq-default lsp-auto-guess-root t) ;; Helps find the ols.json file with Projectile or project.el
  (add-to-list 'lsp-language-id-configuration '(odin-mode . "odin"))
  (add-to-list 'lsp-language-id-configuration '(odin-ts-mode . "odin"))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "/home/adam/.nix-profile/bin/ols") ;; Adjust the path here
                    :major-modes '(odin-mode )
                    :server-id 'ols
                    :multi-root t))) ;; Ensures lsp-mode sends "workspaceFolders" to the server

;; Add a hook to autostart OLS
(add-hook 'odin-mode-hook #'lsp-deferred)
(add-hook 'odin-ts-mode-hook #'lsp-deferred) ;; If you're using the TS mode
