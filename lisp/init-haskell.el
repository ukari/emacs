;; -*- lexical-binding: t -*-

(require-package 'haskell-mode)
(require-package 'flycheck-haskell)

(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)
(add-hook 'haskell-mode-hook #'flycheck-mode)

(provide 'init-haskell)
