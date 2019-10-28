;; -*- lexical-binding: t -*-

(on-init (lambda ()
           ;; disable toolbar
           (tool-bar-mode 0)
           ;; disable menubar
           (menu-bar-mode 0)
           ;; disable scrollbar
           (scroll-bar-mode 0)
           ;; font
           (add-to-list 'default-frame-alist '(font . "Source Code Pro-10.5"))))

(provide 'init-appearance)
