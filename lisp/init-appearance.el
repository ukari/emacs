;; -*- lexical-binding: t -*-

(on-init (lambda ()
           ;; disable toolbar
           (tool-bar-mode 0)
           ;; disable menubar
           (menu-bar-mode 0)
           ;; disable scrollbar
           (scroll-bar-mode 0)
           ;; disable auto resize window
           (setq frame-inhibit-implied-resize t)
           ;; font
           (if initial-window-system
               (init-fonts (selected-frame))
             (on-frame #'init-fonts))
           ;; char table
           (init-char-table)
           ;; fullscreen
           (add-to-list 'default-frame-alist '(fullscreen . maximized))
           ;; transparent
           (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
           (add-to-list 'default-frame-alist '(alpha . (85 . 50)))))

(defun init-fonts (frame)
  (when (display-graphic-p frame)
    (select-frame frame)
    (let ((fontsize 10.5)
          (fontsize-cjk 12))
      (set-face-font 'default (concat "Source Code Pro-" (number-to-string fontsize)))
      (set-fontset-font (face-attribute 'default :fontset) '(#xf000 . #xffff)
                        (font-spec :family "Material Design Icons" :size fontsize))
      (set-fontset-font (face-attribute 'default :fontset) 'cjk-misc
                        (font-spec :family "Noto Sans CJK JP" :lang "ja" :size fontsize-cjk))
      (set-fontset-font (face-attribute 'default :fontset) 'cjk-misc
                        (font-spec :family "Noto Sans CJK SC" :lang "zh" :size fontsize-cjk))
      (set-fontset-font (face-attribute 'default :fontset) 'han
                        (font-spec :family "Noto Sans CJK JP" :lang "ja" :size fontsize-cjk))
      (set-fontset-font (face-attribute 'default :fontset) 'han
                        (font-spec :family "Noto Sans CJK SC" :lang "zh" :size fontsize-cjk))
      (set-fontset-font (face-attribute 'default :fontset) 'kana
                        (font-spec :family "Noto Sans CJK JP" :size fontsize-cjk)))
    (message "init fonts")
    (remove-hook 'after-make-frame-functions #'init-fonts)))

(defun init-char-table ()
  (set-char-table-range char-width-table '(#x00 . #xFFFFF) 1)
  (message "init char table"))

(provide 'init-appearance)
