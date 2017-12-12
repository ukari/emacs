(require-package 'diff-hl)

(global-diff-hl-mode)
(add-hook 'focus-in-hook 'diff-hl)

(provide 'init-git)
