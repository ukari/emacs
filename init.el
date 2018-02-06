(package-initialize)
(setq lexical-binding t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(tool-bar-mode -1)
(menu-bar-mode -1)

(require 'init-repository)
(require 'init-packages)

(require 'init-utils)

(require 'init-parentheses)
(require 'init-theme)

(require 'init-common-lisp)
(require 'init-json)
(require 'init-javascript)
(require 'init-markdown)
(require 'init-git)
(require 'init-project)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
    (load custom-file))

(on-init (lambda () (message "init finished")))

(provide 'init)
