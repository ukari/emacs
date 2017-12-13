(require-package 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 32)
(setq dframe-update-speed 1)
(sr-speedbar-refresh-turn-on)

(global-set-key (kbd "<f5>") (lambda()
          (interactive)
          (sr-speedbar-toggle)))

(setq speedbar-use-images nil)

(provide 'init-project)
