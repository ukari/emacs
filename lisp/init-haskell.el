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

(advice-add #'haskell-process-load-file :around #'interactive-haskell-window-resize)

(defun interactive-haskell-window-resize (origin)
  (funcall origin)
  (let ((fixed-height 9))
    (fit-window-to-buffer (car (window-list)) fixed-height fixed-height)))

(provide 'init-haskell)
