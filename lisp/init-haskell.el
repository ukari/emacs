;; -*- lexical-binding: t -*-

(require-package 'haskell-mode)
;;(require 'lsp)
(require-package 'lsp-haskell)

(add-hook 'haskell-mode-hook #'lsp)

(setq lsp-haskell-process-path-hie "hie-wrapper")

(provide 'init-haskell)
