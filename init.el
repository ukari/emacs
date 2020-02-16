(package-initialize)
(setq lexical-binding t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; util
(require 'init-utils)

;; base
(require 'init-repository)
(require 'init-packages)
(require 'init-environment)

;; elisp dev
(require 'init-package-lint)

;; style
(require 'init-parentheses)
(require 'init-theme)
(require 'init-editor)
(require 'init-modeline)
(require 'init-appearance)
(require 'init-color-visualizing)
(require 'init-olivetti)
(require 'init-auto-revert)

;; coding
(require 'init-flycheck)

;; language
(require 'init-git)
(require 'init-common-lisp)
(require 'init-haskell)
(require 'init-nix)
(require 'init-json)
(require 'init-javascript)
(require 'init-markdown)
(require 'init-latex)
(require 'init-fountain)

;; hub
(require 'init-project)
(require 'init-imenu-list)

;; tool
(require 'init-renpy)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
    (load custom-file))

(on-init (lambda () (message "init finished")))

(provide 'init)
