;; -*- lexical-binding: t -*-

(defvar welcome-message "Our typewriter has been wired in... Please remember to check the window bird. Driving on your high way~>")

(advice-add #'server-execute :around #'server-execute-echo-area-silencer)

(defun server-execute-echo-area-silencer (origin &rest rest)
  (let ((inhibit-message t))
    (apply origin rest))
  (type-message welcome-message))

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
