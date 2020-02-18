;; -*- lexical-binding: t -*-

(require-package 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml.lock\\'" . yaml-mode))

(provide 'init-yaml)
