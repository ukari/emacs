;; -*- lexical-binding: t -*-

(require-package 'rainbow-mode)

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda () (unless (eq major-mode 'speedbar-mode)
               (rainbow-mode 1))))

(global-rainbow-mode 1)

(provide 'init-color-visualizing)
