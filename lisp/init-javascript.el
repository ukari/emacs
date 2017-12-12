(require-package 'tern)
(require-package 'tern-auto-complete)

(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
	    (setq js2-basic-offset 2)
	    (setq js2-strict-missing-semi-warning nil)
	    (auto-complete-mode)
	    (tern-mode)
	    (tern-ac-setup)
	    (paredit-everywhere)
	    (message "js mode")))


(provide 'init-javascript)
