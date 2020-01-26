;; -*- lexical-binding: t -*-

(require-package 'flycheck)

(global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(provide 'init-flycheck)
