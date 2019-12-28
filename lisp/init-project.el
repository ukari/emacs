;; -*- lexical-binding: t -*-

(require-package 'sr-speedbar)
(require-package 'speedbar-git-respect)

(speedbar-git-respect-mode t)

(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 32)
(setq sr-speedbar-auto-refresh nil)

(global-set-key (kbd "<f5>") (lambda() (interactive) (sr-speedbar-toggle)))

(defun fix-speedbar-window (orign &rest rest)
  (let ((result (apply orign rest))
        (buffer (current-buffer)))
    (set-buffer "*SPEEDBAR*")
    (setq window-size-fixed t)
    (set-buffer buffer)
    result))

(advice-add #'sr-speedbar-open :around #'fix-speedbar-window)

(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)

(defvar *skip-needing-buffers-list* (list "*SPEEDBAR*" "*Ilist*"))

(defun window-list-without-skipped-buffers ()
  (seq-filter (lambda (x) (not (member (buffer-name (window-buffer x)) *skip-needing-buffers-list*))) (window-list)))

(defun main-buffer ()
  (let ((current-buffer (current-buffer)))
    (if (buffer-file-name current-buffer)
        current-buffer
      (window-buffer (car (window-list-without-skipped-buffers))))))

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
    (if (not (equal main-buffer (window-buffer (car (window-list-without-skipped-buffers)))))
        (progn (sr-speedbar-toggle)
               (sr-speedbar-toggle)))))

(defun kill-other-windows()
  (if (member (buffer-name (current-buffer)) (window-list-without-skipped-buffers))
      (switch-to-buffer-other-window (main-buffer)))
  (delete-other-windows))

(global-set-key (kbd "<f4>") (lambda() (interactive)
                               (switch-to-buffer-other-window (main-buffer))
                               (save-and-kill-other-buffers)
                               (kill-other-windows)))

(advice-add #'previous-buffer :around #'skip-specific-buffers)
(advice-add #'next-buffer :around #'skip-specific-buffers)

(defun skip-specific-buffers (origin &rest rest)
  (let ((start-buffer (current-buffer)))
    (skip-specific-buffers-inner origin rest start-buffer)))

(defun skip-specific-buffers-inner (origin rest start-buffer)
  (interactive)
  (apply origin rest)
  (let ((current-buffer (current-buffer)))
    (if (and (member (buffer-name current-buffer) *skip-needing-buffers-list*)
             (not (eq start-buffer current-buffer)))
        (skip-specific-buffers-inner origin rest start-buffer))))

;; https://emacs.stackexchange.com/questions/29670/how-to-prevent-some-new-buffers-from-splitting-the-window#comment45594_29670
;; (pop-to-buffer (current-buffer)) !!!

(setq pop-up-windows nil)

(defun main-window ()
  (let ((buffer (main-buffer)))
    (car (seq-filter (lambda (x) (equal buffer (window-buffer x))) (window-list)))))

(provide 'init-project)
