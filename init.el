(setq lexical-binding t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-repository)
(require 'init-packages)

(add-hook 'after-init-hook (lambda () (message "init finished")))

(provide 'init)
