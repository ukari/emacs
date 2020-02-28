;; -*- lexical-binding: t -*-

(require-package 'diminish)

(on-init (diminish 'speedbar-git-respect-mode))

(size-indication-mode 1)

(column-number-mode 1)

(set-face-attribute 'mode-line-buffer-id nil :foreground "#f0c674")

(set-face-foreground 'mode-line "#b0b287")

(provide 'init-modeline)
