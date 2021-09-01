;; -*- lexical-binding: t -*-

(require-package 'lsp-haskell)
(require 'lsp-mode)
(require 'lsp-diagnostics)

;; lsp-haskell
(add-to-list 'lsp-diagnostics-disabled-modes 'haskell-mode)
;;(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)
(add-hook 'haskell-mode-hook (lambda ()
                               (setq-local flycheck-checker 'haskell-stack-ghc)
                               (lsp)))

(provide 'init-lsp-haskell)
