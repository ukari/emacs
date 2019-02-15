;; -*- lexical-binding: t -*-

(require-package 'slime)

(load (expand-file-name "~/.roswell/helper.el"))
(setq inferior-lisp-program "ros -Q run")
(setq slime-contribs '(slime-fancy))

;; from: "ParEdit and SLIME REPL" in https://www.emacswiki.org/emacs/ParEdit
;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
   (define-key slime-repl-mode-map
     (read-kbd-macro paredit-backward-delete-key) nil))

(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

(provide 'init-common-lisp)
