;; -*- lexical-binding: t -*-

(require-package 'exec-path-from-shell)

(when (memq system-type '(gnu gnu/linux darwin))
  (exec-path-from-shell-initialize))

(provide 'init-environment)
