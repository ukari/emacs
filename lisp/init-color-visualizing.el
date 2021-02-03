;; -*- lexical-binding: t -*-

(require-package 'rainbow-mode)

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda () (unless (or (eq major-mode 'speedbar-mode)
                         (eq major-mode 'imenu-list-major-mode)
                         (eq major-mode 'glsl-mode))
               (rainbow-mode 1))))

(global-rainbow-mode 1)

(provide 'init-color-visualizing)
