;; -*- lexical-binding: t -*-

(require-package 'sr-speedbar)
(require-package 'speedbar-git-respect)

(require 'cl-lib)

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

(add-hook 'speedbar-mode-hook (lambda () (visual-line-mode 0)))

(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)

(defvar *skip-needing-buffers-list* (list "*SPEEDBAR*" "*Ilist*"))

(defun skipped-buffer-p (buffer)
  (member (buffer-name buffer) *skip-needing-buffers-list*))

(defun without-skipped-buffer-p (buffer)
  (not (skipped-buffer-p buffer)))

(defun window-without-skipped-buffer-p (window)
  (without-skipped-buffer-p (window-buffer window)))

(defun window-list-without-skipped-buffers ()
  (seq-filter #'window-without-skipped-buffer-p (window-list)))

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
                               (kill-other-windows)
                               (other-window-first)))

(advice-add #'previous-buffer :around #'skip-specific-buffers)
(advice-add #'next-buffer :around #'skip-specific-buffers)
(advice-add #'kill-buffer :around #'skip-specific-buffers-when-kill)

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

(defun skip-specific-buffers-when-kill (origin &rest rest)
  (let ((name (buffer-name (current-buffer))))
    (apply origin rest)
    (if (and (not (string-prefix-p " " name))
             (member (buffer-name (current-buffer)) *skip-needing-buffers-list*)
             (not (window-dedicated-p)))
      (next-buffer))))

;; https://emacs.stackexchange.com/questions/29670/how-to-prevent-some-new-buffers-from-splitting-the-window#comment45594_29670
;; (pop-to-buffer (current-buffer)) !!!

(setq pop-up-windows nil)

(defun main-window ()
  (let ((buffer (main-buffer)))
    (car (seq-filter (lambda (x) (equal buffer (window-buffer x))) (window-list)))))

(defun windows-by-last-selected-without-skipped ()
  (let ((orderlist (seq-filter #'get-buffer-window (seq-filter #'without-skipped-buffer-p (buffer-list (selected-frame))))))
    (seq-sort (lambda (x y) (< (seq-position orderlist (window-buffer x))
                               (seq-position orderlist (window-buffer y))))
              (window-list-without-skipped-buffers))))

(defun buffer-window-count (buffer)
  (let ((window (get-buffer-window buffer))
        (sorted (windows-by-last-selected-without-skipped)))
    (seq-position sorted window)))

(defun other-window-special-without-skipped-buffers (count)
  (let* ((windows (seq-map-indexed (lambda (x i) (cons x i)) (window-list)))
         (sorted (windows-by-last-selected-without-skipped))
         (need (seq-elt sorted count))
         (res (seq-filter (lambda (x_i) (eq (car x_i) need)) windows))
         (default (seq-filter (lambda (x_i) (eq (car x_i) (car sorted))) windows)))
    (if (eq (length res) 1)
        (other-window (cdr (car res)))
      (if (> (length windows) 0)
          (other-window (cdr (car default)))))))

(defun previous-window-alternative (origin &rest rest)
  (other-window-special-without-skipped-buffers -1))

(advice-add #'sr-speedbar-before-visiting-file-hook :around #'previous-window-alternative)
(advice-add #'sr-speedbar-before-visiting-tag-hook :around #'previous-window-alternative)
(advice-add #'sr-speedbar-visiting-file-hook :around #'previous-window-alternative)
(advice-add #'sr-speedbar-visiting-tag-hook :around #'previous-window-alternative)

(defun window-manager (mode-startup)
  (let ((split-window-vertically-origin (symbol-function 'split-window-vertically))
        (current-buffer (current-buffer))
        (mode-buffer nil)
        (result nil))
    (cl-letf (((symbol-function 'pop-to-buffer)
               (lambda (buffer-or-name &optional action norecord)
                 (setf mode-buffer buffer-or-name)
                 nil))
              ((symbol-function 'split-window-vertically) (lambda (&optional size))))
      (setf result (funcall mode-startup))
      (if mode-buffer
          (progn
            (let ((mode-window-count (buffer-window-count mode-buffer)))
              (if mode-window-count
                  (other-window-special-without-skipped-buffers mode-window-count)
                (if (<= (length (windows-by-last-selected-without-skipped)) 1)
                    (funcall split-window-vertically-origin)
                  (other-window-special-without-skipped-buffers 1))))
            (switch-to-buffer mode-buffer)
            (other-window-special-without-skipped-buffers 1)
            (switch-to-buffer current-buffer)
            (other-window-special-without-skipped-buffers (buffer-window-count mode-buffer))))
      result)))

(provide 'init-project)
