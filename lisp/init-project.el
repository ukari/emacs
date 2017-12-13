(require-package 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 32)
(setq dframe-update-speed 1)
(setq sr-speedbar-auto-refresh t)

(global-set-key (kbd "<f5>") (lambda() (interactive) (sr-speedbar-toggle)))

(setq speedbar-use-images nil)

(defun save-and-kill-other-buffers ()
  (interactive)
  (mapc (lambda (b) (if (buffer-file-name b)
			(with-current-buffer b
			  (save-buffer b))))
	(delq (current-buffer) (buffer-list)))
  (mapc (lambda (b) (if (buffer-file-name b)
			(kill-buffer b)))
	(delq (current-buffer) (buffer-list))))

(global-set-key (kbd "<f4>") (lambda() (save-and-kill-other-buffers)))

(provide 'init-project)
