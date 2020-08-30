;; -*- lexical-binding: t -*-

(require-package 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)

(require-package 'flycheck-haskell)

(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)
(add-hook 'haskell-mode-hook #'flycheck-mode)
(add-hook 'haskell-mode-hook #'interactive-haskell-mode)

(add-hook 'haskell-mode-hook #'enable-paredit-mode)
(add-hook 'haskell-interactive-mode-hook #'enable-paredit-mode)

(setq haskell-process-path-ghci "stack")
(setq haskell-process-args-ghci '("ghci"))

(advice-add #'haskell-process-load-file :around #'load-haskell-context-wrapper)

(defun load-haskell-context-wrapper (origin &rest rest)
  (window-manager (lambda () (apply origin rest))))

;; C-c C-l to load context
;; C-c C-t to infer type

(provide 'init-haskell)
