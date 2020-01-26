;; -*- lexical-binding: t -*-

(require-package 'haskell-mode)
;;(require 'lsp)
(require-package 'lsp-haskell)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-mode-hook 'flycheck-mode)

(setq lsp-haskell-process-path-hie "hie-wrapper")

(provide 'init-haskell)
