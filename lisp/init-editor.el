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
  (message "Overwrite mode is not allow.")
  nil)

(delete-selection-mode 1)

(global-set-key [backspace] #'backspace-delete)

(defun backspace-delete (n)
  (interactive "p")
  (if (region-active-p)
      (delete-region (region-beginning) (region-end))
    (delete-backward-char n)))

;; disable secondary selection
(global-set-key [M-drag-mouse-1] #'secondary-selection-disabled-hint)
(global-set-key [M-down-mouse-1] #'secondary-selection-disabled-hint)
(global-set-key [M-mouse-1] #'secondary-selection-disabled-hint)
(global-set-key [M-mouse-2] #'secondary-selection-disabled-hint)
(global-set-key [M-mouse-3] #'secondary-selection-disabled-hint)

(defun secondary-selection-disabled-hint ()
  (interactive)
  (message "Secondary selection is not allow."))

(on-init
 ;;default directory
 (cd (getenv "HOME")))

(provide 'init-editor)
