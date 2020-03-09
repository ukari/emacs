;; -*- lexical-binding: t -*-

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
  (sit-for 0.24)
  (type-message welcome-message))

(defun frame-welcome ()
  (let ((cur (selected-frame)))
    (unless (frame-parameter cur 'welcome-once)
      (set-frame-parameter cur 'welcome-once (once #'welcome)))
    (funcall (frame-parameter cur 'welcome-once))))

(defun type-message (mes &optional delay)
  (unless delay
    (setq delay 0.01))
  (let ((message-log-max nil)
        (acc))
    (seq-map
     (lambda (char)
       (setf acc (concat acc char))
       (sit-for delay)
       (message acc))
     (split-string mes "")))
  (sit-for delay)
  (message mes))

(provide 'init-welcome)
