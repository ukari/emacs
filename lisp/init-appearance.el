;; -*- lexical-binding: t -*-

(on-init
 ;; visual line
 (global-visual-line-mode 1)
 ;; disable toolbar
 (tool-bar-mode 0)
 ;; disable menubar
 (menu-bar-mode 0)
 ;; disable scrollbar
 (scroll-bar-mode 0)
 ;; disable auto resize window
 (setq frame-inhibit-implied-resize t)
 ;; ignore .Xresource
 (setq inhibit-x-resources t)
 ;; font
 (if initial-window-system
     (init-fonts (selected-frame))
   (add-hook 'after-make-frame-functions #'init-fonts))
 ;; char table
 ;; (init-char-table)
 ;; fullscreen
 (add-to-list 'default-frame-alist '(fullscreen . maximized))
 ;; transparent
 ;; (set-frame-parameter (selected-frame) 'alpha '(80 . 80))
 ;; (add-to-list 'default-frame-alist '(alpha . (80 . 80)))

 ;; buffer-menu group
 (setq mouse-buffer-menu-maxlen 10)
 (setq mouse-buffer-menu-mode-mult 0))

(defun init-fonts (frame)
  (when (display-graphic-p frame)
    (select-frame frame)
    (let ((fontsize 10.5)
          (fontsize-cjk 12))
      (set-face-font 'default (concat "Source Code Pro-" (number-to-string fontsize)))
      (set-fontset-font (face-attribute 'default :fontset) '(#xf000 . #xfffff)
                        (font-spec :family "Material Design Icons" :size fontsize))
      (set-fontset-font (face-attribute 'default :fontset) 'cjk-misc
                        (font-spec :family "Noto Sans Mono CJK SC" :lang "ja" :size fontsize-cjk))
      (set-fontset-font (face-attribute 'default :fontset) 'cjk-misc
                        (font-spec :family "Noto Sans Mono CJK SC" :lang "zh" :size fontsize-cjk))
      (set-fontset-font (face-attribute 'default :fontset) 'han
                        (font-spec :family "Noto Sans Mono CJK SC" :lang "ja" :size fontsize-cjk))
      (set-fontset-font (face-attribute 'default :fontset) 'han
                        (font-spec :family "Noto Sans Mono CJK SC" :lang "zh" :size fontsize-cjk))
      (set-fontset-font (face-attribute 'default :fontset) 'kana
                        (font-spec :family "Noto Sans Mono CJK SC" :size fontsize-cjk)))
    (message "Init fonts.")
    (remove-hook 'after-make-frame-functions #'init-fonts)))

(defun init-char-table ()
  (set-char-table-range char-width-table '(#x00 . #xFFFFF) 1)
  (message "Init char table."))

(provide 'init-appearance)
