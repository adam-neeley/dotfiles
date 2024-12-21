(load! "secrets" "~/.config/doom/")

;; tabnine
(use-package! tabnine
  :config
  (global-tabnine-mode))

;; gptel
(setq gptel-api-key my-openai-key)
(setq gptel-directives
      '((default . "You are a large language model living in Emacs. ")
        (code .    "You are a professional programmer. Write code and only code with no comment, explanation, prompt, or anything else.")
        (python .  "You are a professional python programmer. Respond only with code with no comment, explanation, prompt, or anything other than code")
        (math .    "You are a professional mathematician. Respond in LaTeX. Explain each step. Don't repeat the problem statement.")
        (writing . "You are a professional writer. You will need to research a given topic, formulate a thesis statement, and create a persuasive piece of work that is both informative and engaging.")
        (chat .    "You are a large language model and a conversation partner. Respond concisely.")))

;; chatgpt-shell
(use-package! chatgpt-shell :config
              (setq! chatgpt-shell-openai-key my-openai-key))

(setq! tab-width 4)
;; (use-package! org-chatgpt-shell :config
;;               (setq! org-chatgpt-shell-openai-key my-openai-key
;;                      tab-width 4
;;                      )
;;               )
;; gpt-commit
(use-package! gpt-commit :config
              (setq! gpt-commit-openai-key my-openai-key
                     gpt-commit-model-name "gpt-4"))
;; (add-hook! 'git-commit-setup-hook 'gpt-commit-message))
;; (load! "secrets" "~/.config/doom/")

;; ;; tabnine
;; (use-package! tabnine
;;   :config
;;   (global-tabnine-mode))

;; ;; gptel
;; (setq gptel-api-key my-openai-key)

;; (defun prompt (role direction )
;;   "Function to generate a prompt for the gptel model."
;;   "Role: " role ".\n"
;;   "Direction: " direction ".\n"
;;   (interactive)
;;   (concat "You are are a " role ".\n"
;;           "Please tell me " direction "\n"))


;; (setq gptel-directives
;;       '((default . (prompt "large language model living in emacs"
;;                            "respond in org-mode."))

;;         (code .
;;               (prompt "professional programmer" ;; "comment, explanation, or anything other than code."
;;                       "improve this code."))
;;         (python .
;;                 (prompt "professional python programmer"
;;                         "improve this scode."))
;;         ))
;; (message gptel-directives)

;; ;; gpt-commit
;; (use-package! gpt-commit :config
;;               (setq! gpt-commit-openai-key my-openai-key
;;                      gpt-commit-model-name "gpt-4"))
;; ;; (add-hook! 'git-commit-setup-hook 'gpt-commit-message))
