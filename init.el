(setq lexical-binding t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-repository)
(require 'init-packages)

(require 'init-parentheses)
(require 'init-theme)

(require 'init-javascript)
(require 'init-markdown)
(require 'init-git)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
    (load custom-file))

(add-hook 'after-init-hook (lambda () (message "init finished")))

(provide 'init)
