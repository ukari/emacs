(package-initialize)
(setq lexical-binding t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-utils)

(require 'init-repository)
(require 'init-packages)
(require 'init-environment)

(require 'init-parentheses)
(require 'init-theme)
(require 'init-editor)
(require 'init-appearance)
(require 'init-color-visualizing)

(require 'init-common-lisp)
(require 'init-json)
(require 'init-javascript)
(require 'init-markdown)
(require 'init-git)
(require 'init-project)
(require 'init-latex)
(require 'init-package-lint)

(require 'init-renpy)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
    (load custom-file))

(on-init (lambda () (message "init finished")))

(provide 'init)
