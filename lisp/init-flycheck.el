;; -*- lexical-binding: t -*-

(require-package 'flycheck)

(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
;; avoid annoying pop up
(setq flycheck-display-errors-function nil)

(defun flycheck-compile-without-interactive ()
  (interactive)
  (flycheck-compile (flycheck-get-checker-for-buffer)))

(provide 'init-flycheck)
