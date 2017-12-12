(require-package 'diff-hl)

(global-diff-hl-mode)
(add-hook 'focus-in-hook (lambda () (diff-hl-update)))

(provide 'init-git)
