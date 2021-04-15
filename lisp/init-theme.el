;; -*- lexical-binding: t -*-

(on-init (load-theme 'ground t))

(on-init
 (message "Custom variable custom-safe-themes check finished.")
 (when custom-safe-themes
   (customize-save-variable 'custom-safe-themes nil)
   (message "Clear custom-safe-themes.")))

(provide 'init-theme)
