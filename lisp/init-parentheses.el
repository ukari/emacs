;; -*- lexical-binding: t -*-

(require-package 'paredit)
(require-package 'rainbow-delimiters)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook       #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'renpy-mode-hook            #'enable-paredit-mode)

(defun renpy-mode-paredit-hook ()
  (enable-paredit-mode)
  (add-to-list (make-local-variable 'paredit-space-for-delimiter-predicates)
               (lambda (endp delimiter)
                 (and (or (eq major-mode 'renpy-mode))
                      (not endp)))))

(add-hook 'prog-mode-hook             #'rainbow-delimiters-mode)
(add-hook 'slime-repl-mode-hook       #'rainbow-delimiters-mode)

(defun paredit-everywhere ()
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode t))

(provide 'init-parentheses)
