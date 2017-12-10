(add-hook 'js-mode-hook (lambda () (message "init javascript finished")))
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))


(provide 'init-javascript)
