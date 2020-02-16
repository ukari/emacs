;; -*- lexical-binding: t -*-

(require-package 'nix-mode)

(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

(provide 'init-nix)
