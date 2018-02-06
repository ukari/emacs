;; -*- lexical-binding: t -*-

(require-package 'rjsx-mode)
(require-package 'tern)
(require-package 'tern-auto-complete)

(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
	    (setq js2-basic-offset 2)
	    (setq js2-strict-missing-semi-warning nil)
	    (setq js2-strict-trailing-comma-warning nil)
	    (setq js2-mode-show-strict-warnings nil)
	    (paredit-everywhere)
	    (tern-mode t)
	    (auto-complete-mode)
	    (tern-ac-setup)
	    (message "js mode")))


(provide 'init-javascript)
