(package-initialize)
(setq lexical-binding t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(tool-bar-mode -1)
(menu-bar-mode -1)

(require 'init-repository)
(require 'init-packages)

(require 'init-parentheses)
(require 'init-theme)

(require 'init-javascript)
(require 'init-markdown)
(require 'init-git)
(require 'init-project)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
    (load custom-file))

(add-hook 'after-init-hook (lambda () (message "init finished")))

(provide 'init)
