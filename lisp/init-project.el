;; -*- lexical-binding: t -*-

(require-package 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 32)
(setq sr-speedbar-auto-refresh nil)

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

(defun kill-other-windows() (if (not (equal (buffer-name (current-buffer)) "*SPEEDBAR*"))
				(progn (delete-other-windows)
				       ;; (let ((current-buffer (current-buffer)))
				       ;; 	 (sr-speedbar-toggle)
				       ;; 	 (sr-speedbar-toggle)
				       ;; 	 (switch-to-buffer current-buffer))
				       )))

(global-set-key (kbd "<f4>") (lambda() (interactive)
			       (save-and-kill-other-buffers)
			       (kill-other-windows)))

(defmacro skip-buffer-in-action (buffer-name action)
  (let ((fn (make-symbol "fn")))
    `(progn (setq ,fn (symbol-function (quote ,action)))
	    (defun ,action ()
	      (interactive)
	      (funcall ,fn)
	      (if (equal (buffer-name (current-buffer)) ,buffer-name)
		  (funcall ,fn))))))
(on-init (lambda ()
	   (skip-buffer-in-action "*SPEEDBAR*" previous-buffer)
	   (skip-buffer-in-action "*SPEEDBAR*" next-buffer)))

(provide 'init-project)
