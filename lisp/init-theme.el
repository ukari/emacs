(require-package 'monokai-theme)

(add-hook 'after-init-hook (lambda () (load-theme 'monokai t)))


(provide 'init-theme)
