(require-package 'markdown-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-face-tag ((t (:inherit default :foreground "hot pink" :weight bold :height 1.0))))
 '(markdown-code-face ((t (:inherit default :foreground "#b029b0"))))
 '(markdown-header-face ((t (:foreground "gold"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-inline-code-face ((t (:inherit font-lock-constant-face)))))

(provide 'init-markdown)
