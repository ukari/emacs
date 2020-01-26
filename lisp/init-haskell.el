;; -*- lexical-binding: t -*-

(require-package 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)

(require-package 'flycheck-haskell)

(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)
(add-hook 'haskell-mode-hook #'flycheck-mode)
(add-hook 'haskell-mode-hook #'interactive-haskell-mode)

(setq haskell-process-path-ghci "stack")
(setq haskell-process-args-ghci '("ghci"))

;; C-c C-l to load context
;; C-c C-t to infer type

(provide 'init-haskell)
