;; -*- lexical-binding: t -*-

(on-init (load-theme 'ground t))

(on-init
 (message "custom variable custom-safe-themes check finished")
 (unless custom-safe-themes
           (customize-save-variable 'custom-safe-themes nil)
           (message "clear custom-safe-themes")))

(provide 'init-theme)
