;; -*- lexical-binding: t -*-

(define-key emacs-lisp-mode-map (kbd "C-c C-l") #'load-elisp-context)

(defun load-elisp-context ()
  (interactive)
  (window-manager
   (lambda ()
     (let ((current-buffer (current-buffer)))
       (ielm)
       (ielm-change-working-buffer current-buffer)))))

;; C-c C-l load elisp buffer

(provide 'init-elisp)
