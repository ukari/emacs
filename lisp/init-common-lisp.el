;; -*- lexical-binding: t -*-

(require-package 'slime)

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; from: "ParEdit and SLIME REPL" in https://www.emacswiki.org/emacs/ParEdit
;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
   (define-key slime-repl-mode-map
     (read-kbd-macro paredit-backward-delete-key) nil))

(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)


;; Reinstall quicklisp at the Emacs' SLIME REPL. https://stackoverflow.com/a/65560521


(provide 'init-common-lisp)
