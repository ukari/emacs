;; -*- lexical-binding: t -*-

(package-initialize)

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

;; ;; hub
(require 'init-project)
(require 'init-imenu-list)
(require 'init-welcome)

;; coding
(require 'init-flycheck)

;;language
(require 'init-elisp)
(require 'init-git)
(require 'init-common-lisp)
(require 'init-haskell)
(require 'init-glsl)
(require 'init-nix)
(require 'init-yaml)
(require 'init-json)
;;(require 'init-javascript)
(require 'init-markdown)
(require 'init-rst)
;;(require 'init-latex)
(require 'init-fountain)

;; tool
(require 'init-renpy)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
    (load custom-file))

(on-init (message "init finished"))

(call-on-init)

(provide 'init)
