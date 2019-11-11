;; -*- lexical-binding: t -*-

(require-package 'sr-speedbar)

(require 'f)
(require 'speedbar)

(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 32)
(setq sr-speedbar-auto-refresh nil)

(global-set-key (kbd "<f5>") (lambda() (interactive) (sr-speedbar-toggle)))

(setq speedbar-use-images nil)

(setq origin-file-lists (symbol-function 'speedbar-file-lists))

(defun vc-git-dir-p (directory)
  (eq 'Git (condition-case nil (vc-responsible-backend directory) (error nil))))

(defun speedbar-file-lists (directory)
  (setq origin-directory default-directory)
  (setq default-directory directory)
  (let ((result (if (vc-git-dir-p directory)                    
                    (git-file-lists directory)
                  (funcall origin-file-lists directory))))
    (setq default-directory origin-directory)
    result))

(defun git-file-lists (directory)
  (setq directory (expand-file-name directory))
  ;; find the directory, either in the cache, or build it.
  (or (and (not dframe-power-click) ;; In powerclick mode, always rescan.
           (cdr-safe (assoc directory speedbar-directory-contents-alist)))
      ;; tracked files and directory
      ;; git ls-files --directory
      ;; untracked files and directory
      ;; git ls-files --other --directory
      ;; untracked ignored
      ;; git ls-files --other --directory --ignored --exclude-standard
      (let ((tracked-fd (file-list-process (vc-git--run-command-string nil "ls-files" "--directory")))
            (untracked-fd (file-list-process (vc-git--run-command-string nil "ls-files" "--other" "--directory")))
            (untracked-ignored (file-list-process (vc-git--run-command-string nil "ls-files" "--other" "--directory" "--ignored" "--exclude-standard")))
            (dirs nil)
            (files nil))
        (setf dirs (remove-if (lambda (x) (member x (car untracked-ignored))) (car untracked-fd)))
        (setf files (remove-if (lambda (x) (member x (cadr untracked-ignored))) (cadr untracked-fd)))        
        (setf dirs (delete-dups (append (car tracked-fd) dirs)))
        (setf files (delete-dups (append (cadr tracked-fd) files)))
        (setf dirs (remove-if (lambda (x) (>= 0 (length x))) dirs))
        (setf files (remove-if (lambda (x) (>= 0 (length x))) files))
        (setf dirs (sort dirs 'string>))
        (setf files (sort files 'string>))
	(let ((nl (cons (nreverse dirs) (list (nreverse files))))
              (ae (assoc directory speedbar-directory-contents-alist)))
          (if ae (setcdr ae nl)
            (push (cons directory nl)
                  speedbar-directory-contents-alist))
	  nl))))

(setq path-separator (f-path-separator))

(defun file-directory-split (path)
  (split-string path path-separator))

(defun file-list-process (list)
  (setq list (split-string list "\n"))
  (let ((dirs nil)
        (files nil))
    (mapc (lambda (path)
            (let* ((res (file-directory-split path))
                   (name (car res)))
              (if (> (length res) 1)
                  (setq dirs (cons name dirs))
                (setq files (cons name files)))))
          list)
    (list (delete-dups dirs) files)))

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
