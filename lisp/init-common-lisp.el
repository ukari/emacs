;; -*- lexical-binding: t -*-

(require-package 'slime)

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(provide 'init-common-lisp)
