;; -*- lexical-binding: t -*-

(require-package 'unicad)

(unicad-mode)

(setq-default indent-tabs-mode nil)

;; charset
;; (set-language-environment "UTF-8")
;; (prefer-coding-system 'gb18030)
;; (prefer-coding-system 'utf-8)

(advice-add #'overwrite-mode :around #'overwrite-mode-disable)

(defun overwrite-mode-disable (origin &rest rest)
  (message "overwrite-mode is not allow")
  nil)

(on-init
 ;;default directory
 (cd (getenv "HOME")))

(provide 'init-editor)
