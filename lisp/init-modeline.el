;; -*- lexical-binding: t -*-

(require-package 'diminish)

(on-init (diminish 'speedbar-git-respect-mode))

(size-indication-mode 1)

(column-number-mode 1)

(provide 'init-modeline)
