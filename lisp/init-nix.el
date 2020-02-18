;; -*- lexical-binding: t -*-

(require-package 'nix-mode)

;; prevent stack from nix
;; (when (memq system-type '(gnu gnu/linux darwin))
;;   (exec-path-from-shell-copy-envs '("NIX_PATH")))

(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

(provide 'init-nix)
