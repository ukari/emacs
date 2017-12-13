(require-package 'diff-hl)

(global-diff-hl-mode)
(add-hook 'focus-in-hook (lambda () (global-diff-hl-mode t)))

(provide 'init-git)
