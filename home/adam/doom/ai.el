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

;; gpt-commit
(use-package! gpt-commit :config
              (setq! gpt-commit-openai-key my-openai-key
                     gpt-commit-model-name "gpt-4"))
;; (add-hook! 'git-commit-setup-hook 'gpt-commit-message))
