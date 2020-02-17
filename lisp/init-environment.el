;; -*- lexical-binding: t -*-

(require-package 'exec-path-from-shell)

(when (memq system-type '(gnu gnu/linux darwin))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs '("NIX_PATH")))

(provide 'init-environment)
