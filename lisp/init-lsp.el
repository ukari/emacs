;; -*- lexical-binding: t -*-

(require-package 'lsp-mode)

;; backend features
(setq lsp-enable-snippet nil)
(setq lsp-completion-enable nil)

;; frontend features
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-headerline-breadcrumb-icons-enable nil)
(setq lsp-modeline-code-actions-enable nil)
(setq lsp-modeline-diagnostics-enable nil)

(provide 'init-lsp)
