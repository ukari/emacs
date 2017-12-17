;; -*- lexical-binding: t -*-

(require-package 'json-mode)

(add-to-list 'auto-mode-alist '("\\.tern-project\\'" . json-mode))

(provide 'init-json)
