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

(delete-selection-mode 1)

(global-set-key [backspace] #'backspace-delete)

(defun backspace-delete (n)
  (interactive "p")
  (if (region-active-p)
      (delete-region (region-beginning) (region-end))
    (delete-backward-char n)))

(on-init
 ;;default directory
 (cd (getenv "HOME")))

(provide 'init-editor)
