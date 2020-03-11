;; -*- lexical-binding: t -*-

(require-package 'glsl-mode)

(require 'flycheck)

(add-hook 'glsl-mode-hook #'flycheck-mode)
(add-hook 'glsl-mode-hook #'flycheck-glsl-setup)

(defun flycheck-glsl-setup ()
  (local-set-key "\C-c\C-c" #'flycheck-compile-without-interactive))

(flycheck-define-checker flycheck-glsl-checker
  "flycheck for glslang"
  :command ("glslangValidator" source)
  :error-patterns
  ((error line-start "ERROR: " column ":" line ": " (message) line-end)
   (warning line-start "WARNING: " column ":" line ": " (message) line-end)
   (info line-start "NOTE: " column ":" line ": " (message) line-end))
  :modes glsl-mode)

(add-to-list 'flycheck-checkers 'flycheck-glsl-checker)

(provide 'init-glsl)

