;; -*- lexical-binding: t -*-

(require-package 'diminish)

(on-init (diminish 'speedbar-git-respect-mode))

(size-indication-mode 1)

(column-number-mode 1)

;; (set-face-attribute 'mode-line-buffer-id nil :weight 'normal :foreground "#f0c674")

;; (set-face-attribute 'mode-line nil :box nil :foreground "#b0b287" :background "#2d4e36")

;; (set-face-attribute 'mode-line-inactive nil :box nil)

(provide 'init-modeline)
