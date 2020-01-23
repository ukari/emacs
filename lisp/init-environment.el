;; -*- lexical-binding: t -*-

(require-package 'exec-path-from-shell)

(when (memq system-type '(gnu gnu/linux darwin))
  (exec-path-from-shell-initialize))

(defun add-path (item)
  (setenv "PATH"
          (concat item ":" (getenv "PATH"))))

(defun push-path (item)
  (setenv "PATH"
          (concat (getenv "PATH") ":" item)))

(provide 'init-environment)
