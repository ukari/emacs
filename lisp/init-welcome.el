;; -*- lexical-binding: t -*-
(require 'generator)

(setq inhibit-splash-screen t)

(defvar welcome-message "Our typewriter has been wired in... Please remember to check the window bird. Driving on your high way~>")

(add-hook 'focus-in-hook #'frame-welcome)

(if (daemonp)
    (advice-add #'server-execute :around #'server-execute-echo-area-silencer)
  (advice-add #'display-startup-echo-area-message :around #'startup-echo-area-message-silencer))

(defun server-execute-echo-area-silencer (origin &rest rest)
  (let ((inhibit-message t))
    (apply origin rest)))

(defun startup-echo-area-message-silencer (origin &rest rest)
  (let ((inhibit-message t))
    (apply origin rest)))

(defun welcome ()
  (run-at-time 0.24 nil (lambda () (type-message welcome-message)))
  t)

(iter-defun message-generator (mes)
  (let ((chars (split-string mes ""))
        (acc)
        (cur))
    (while chars
      (setf cur (car chars))
      (setf acc (concat acc cur))
      (setf chars (cdr chars))
      (iter-yield acc))))

(defun frame-welcome ()
  (let ((cur (selected-frame)))
    (unless (frame-parameter cur 'welcome-once)
      (set-frame-parameter cur 'welcome-once (once #'welcome)))
    (funcall (frame-parameter cur 'welcome-once))))

(defun type-message (mes &optional delay)
  (unless delay
    (setf delay 0.01))
  (let ((after 0)
        (iter (message-generator mes)))
    (iter-do (x iter)
      (setf after (+ after delay))
      (run-at-time after nil ((lambda (fixx) (lambda () (let ((message-log-max nil)) (message fixx)))) x)))
    (run-at-time (+ after delay) nil (lambda () (message mes)))))

(provide 'init-welcome)
