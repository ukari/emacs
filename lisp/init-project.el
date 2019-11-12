;; -*- lexical-binding: t -*-

(require-package 'sr-speedbar)
(require-package 'speedbar-git-respect)

(require 'speedbar-git-respect)

(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 32)
(setq sr-speedbar-auto-refresh nil)

(global-set-key (kbd "<f5>") (lambda() (interactive) (sr-speedbar-toggle)))

(setq speedbar-use-images nil)

(defun window-list-without-buffer (buffer-name)
  (seq-filter (lambda (x) (not (equal buffer-name (buffer-name (window-buffer x))))) (window-list)))

(defun main-buffer ()
  (let ((current-buffer (current-buffer)))
    (if (buffer-file-name current-buffer)
      current-buffer
      (window-buffer (car (window-list-without-buffer "*SPEEDBAR*"))))))

(defun map-to-other-buffers (f)
  (mapc (lambda (b) (if (and (buffer-file-name b)
			     (not (equal b (main-buffer))))
			(funcall f b)))
	(delq (if (buffer-file-name (current-buffer))
		  (current-buffer)
		(main-buffer))
	      (buffer-list))))

(defun save-and-kill-other-buffers ()
  (interactive) 
  (let ((main-buffer (main-buffer)))
    (map-to-other-buffers (lambda (b) (with-current-buffer b (save-buffer b))))
    (map-to-other-buffers (lambda (b) (kill-buffer b)))
    (if (not (equal main-buffer (window-buffer (car (window-list-without-buffer "*SPEEDBAR*")))))
       (progn (sr-speedbar-toggle)
	      (sr-speedbar-toggle)))))

(defun kill-other-windows()
  (if (equal (buffer-name (current-buffer)) "*SPEEDBAR*")
				(switch-to-buffer-other-window (main-buffer)))
  (delete-other-windows))

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

(defun main-window ()
  (let ((buffer (main-buffer)))
    (car (seq-filter (lambda (x) (equal buffer (window-buffer x))) (window-list)))))

(defun test ()
  (interactive)
  (find-file (buffer-file-name (main-buffer)))
  (message (buffer-file-name (main-buffer)))
  (message "access buffer 2"))

;(add-hook 'speedbar-visiting-file-hook (lambda () (test)))

;(remove-hook 'speedbar-before-visiting-file-hook 'sr-speedbar-before-visiting-file-hook)
;(remove-hook 'speedbar-before-visiting-tag-hook 'sr-speedbar-before-visiting-tag-hook)
;; todo
(remove-hook 'speedbar-visiting-file-hook 'sr-speedbar-visiting-file-hook)
;(remove-hook 'speedbar-visiting-tag-hook 'sr-speedbar-visiting-tag-hook)
(provide 'init-project)
