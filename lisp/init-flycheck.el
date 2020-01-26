;; -*- lexical-binding: t -*-

(require-package 'flycheck)

(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
;; avoid annoying pop up
(setq flycheck-display-errors-function nil)

(provide 'init-flycheck)
