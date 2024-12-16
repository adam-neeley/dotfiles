(load! "secrets" "~/.config/doom/")

;; tabnine
(use-package! tabnine
  :config
  (global-tabnine-mode))

;; gptel
(setq gptel-api-key my-openai-key)

(defun prompt (role direction )
  "Function to generate a prompt for the gptel model."
  "Role: " role ".\n"
  "Direction: " direction ".\n"
  (interactive)
  (concat "You are are a " role ".\n"
          "Please tell me " direction "\n"))


(setq gptel-directives
      '((default . (prompt "large language model living in emacs"
                           "respond in org-mode."))

        (code .
              (prompt "professional programmer" ;; "comment, explanation, or anything other than code."
                      "improve this code."))
        (python .
                (prompt "professional python programmer"
                        "improve this scode."))
        ))
(message gptel-directives)

;; gpt-commit
(use-package! gpt-commit :config
              (setq! gpt-commit-openai-key my-openai-key
                     gpt-commit-model-name "gpt-4"))
;; (add-hook! 'git-commit-setup-hook 'gpt-commit-message))
