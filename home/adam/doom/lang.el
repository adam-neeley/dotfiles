;;; lang.el --- Description -*- lexical-binding: t; -*-

;; latex
(setq! +latex-viewers '(pdf-tools)
       +latex-enable-unicode-math 't
       preview-scale-function 2.5)

;; haskell
(after! 'haskell-mode-hook
  (set-ligatures! 'haskell-mode
                  :lambda "\\"))

;; mips
(after! 'mips-mode-hook
  (setq! mips-interpreter "Mars"))

;; deno
(add-hook! 'typescript-mode-hook 'deno-fmt-mode)
(add-hook! 'js2-mode-hook 'deno-fmt-mode)

;; nix
(with-eval-after-load 'lsp-mode
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "nixd")
                    :major-modes '(nix-mode)
                    :priority 0
                    :server-id 'nixd)))
