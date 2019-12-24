;; -*- lexical-binding: t -*-
(require-package 'imenu-list)

(global-set-key (kbd "<f6>") (lambda() (interactive) (imenu-list-smart-toggle)))

(setq imenu-list-size 32)

(setq imenu-list-position 'right)

(provide 'init-imenu-list)
