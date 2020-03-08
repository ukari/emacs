;; -*- lexical-binding: t -*-

(defvar welcome-message "Our typewriter has been wired in... Please remember to check the window bird. Driving on your high way~>")

(advice-add #'server-execute :around #'server-execute-echo-area-silencer)

(defun server-execute-echo-area-silencer (origin &rest rest)
  (let ((inhibit-message t))
    (apply origin rest))
  (message welcome-message))

(provide 'init-welcome)
