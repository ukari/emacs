;; -*- lexical-binding: t -*-

;; widget-field
(require 'wid-edit)

(deftheme ground "Ground theme, with color like ground.")

(defgroup ground nil "Ground theme options."
  :group 'faces)

(defcustom ground-foreground "#1B1B1F"
  "Foreground color."
  :type 'string
  :group 'ground)

(defcustom ground-background "#FAFAD9"
  "Background color."
  :type 'string
  :group 'ground)

(defcustom ground-black ground-foreground
  "Black color."
  :type 'string
  :group 'ground)

(defcustom ground-grey "#6E7365"
  "Grey color."
  :type 'string
  :group 'ground)

(defcustom ground-red "#A84040"
  "Red color."
  :type 'string
  :group 'ground)

(defcustom ground-maroon "#965675"
  "Maroon color."
  :type 'string
  :group 'ground)

(defcustom ground-green "#5BBD68"
  "Green color."
  :type 'string
  :group 'ground)

(defcustom ground-lime "#7CC470"
  "Lime color."
  :type 'string
  :group 'ground)

(defcustom ground-yellow "#F0C674"
  "Yellow color."
  :type 'string
  :group 'ground)

(defcustom ground-olive "#E0AF96" ;; "#CC5923"
  "Olive color."
  :type 'string
  :group 'ground)

(defcustom ground-blue "#2C2CAB" ;; "#4243FC"
  "Blue color."
  :type 'string
  :group 'ground)

(defcustom ground-navy "#4C4DB0" ;; "#313271"
  "Navy color."
  :type 'string
  :group 'ground)

(defcustom ground-purple "#C25167" ;; "#662b37"
  "Purple color."
  :type 'string
  :group 'ground)

(defcustom ground-fushsia "#E09696" ;; "#b16464"
  "Fushsia color."
  :type 'string
  :group 'ground)

(defcustom ground-teal "#00838C"
  "Teal color."
  :type 'string
  :group 'ground)

(defcustom ground-aqua "#31D2C1"
  "Aqua color."
  :type 'string
  :group 'ground)

(defcustom ground-white ground-background
  "White color."
  :type 'string
  :group 'ground)

(defcustom ground-silver "#C0C0C0"
  "Silver color"
  :type 'string
  :group 'ground)

(custom-theme-set-variables
 'ground
 '(custom-raised-buttons nil))

(custom-theme-set-faces
 'ground
 ;; default color, sea water
 `(default ((t (:foreground ,ground-teal :background ,ground-background))))

 ;; mouse
 `(mouse ((t (:foreground ,ground-background :background ,ground-foreground :inverse t))))

 ;; cursor
 `(cursor ((t (:background ,ground-teal))))
 `(region ((t (:background "#96E0E0" :extend t :inherit highlight))))

 ;; appearance
 `(menu ((t (:foreground ,ground-foreground :background ,ground-background))))
 `(fringe ((t (:foreground ,ground-foreground :background ,ground-background))))
 `(vertical-border ((t (:foreground ,ground-silver))))
 `(highlight ((t (:background "#96E0E0"))))

 ;; font-lock
 `(font-lock-builtin-face ((t (:weight normal :foreground ,ground-purple))))
 `(font-lock-comment-delimiter-face ((t (:foreground ,ground-silver))))
 `(font-lock-comment-face ((t (:foreground ,ground-grey))))
 `(font-lock-constant-face ((t (:foreground "#F57878"))))
 `(font-lock-doc-face ((t (:foreground ,ground-fushsia))))
 `(font-lock-function-name-face ((t (:foreground ,ground-maroon))))
 `(font-lock-keyword-face ((t (:foreground ,ground-red))))
 `(font-lock-negation-char-face ((t (:weight bold :foreground ,ground-red))))
 `(font-lock-preprocessor-face ((t (:inherit (:face font-lock-builtin-face)))))
 `(font-lock-regexp-grouping-backslash ((t (:weight normal :foreground ,ground-green))))
 `(font-lock-regexp-grouping-construct ((t (:weight normal :foreground ,ground-yellow))))
 `(font-lock-string-face ((t (:foreground ,ground-olive))))
 `(font-lock-type-face ((t (:slant normal :foreground ,ground-lime))))
 `(font-lock-variable-name-face ((t (:foreground ,ground-blue))))
 `(font-lock-warning-face ((t (:weight bold :slant italic :underline t :foreground "red"))))

 ;; imenu-list
 `(imenu-list-entry-face-1 ((t (:foreground ,ground-navy :inherit imenu-list-entry-face))))
 
 ;; diff-hl
 `(diff-hl-change ((t (:foreground ,ground-aqua :background ,ground-aqua))))
 `(diff-hl-delete ((t (:foreground ,ground-red :background ,ground-red))))
 `(diff-hl-insert ((t (:foreground ,ground-green :background ,ground-green))))

 ;; linum
 `(line-number ((t (:foreground ,ground-foreground :background ,ground-background :underline nil :inherit default))))
 `(line-number-current-line ((t (:foreground ,ground-foreground :background ,ground-background :underline t :inherit default))))

 ;; isearch
 `(isearch ((t (:foreground ,ground-foreground :background ,ground-foreground :inherit region))))
 `(isearch-fail ((t (:foreground ,ground-purple :background ,ground-foreground :inherit isearch))))

 ;; widget
 '(custom-button-unraised ((t (:inherit underline))))
 `(custom-group-tag ((t (:height 1.2 :foreground ,ground-blue :inherit default))))
 '(custom-face-tag ((t (:height 1.0 :weight bold :foreground "hot pink" :inherit default))))
 `(custom-variable-tag ((t (:height 1.2 :foreground ,ground-blue :inherit default))))
 '(widget-field ((t (:box (:line-width (1 . -1) :color "#D9004A") :background "#F57878" :extend t))))
 `(help-key-binding ((t (:box (:line-width (1 . -1) :color "grey35") :foreground "darkblue" :background "grey19"))))

 ;; mini buffer
 '(minibuffer-prompt ((t (:foreground "#E53E36"))))

 ;; mode line
 `(mode-line-buffer-id ((t :weight normal :foreground ,ground-fushsia)))
 `(mode-line ((t (:box nil :foreground ,ground-background :background "#96E0E0")))) ;; "#569677"
 `(mode-line-inactive ((t (:box nil :foreground ,ground-grey :background ,ground-background))))

 ;; markdown
 '(markdown-code-face ((t (:inherit default :foreground "#B029B0"))))
 `(markdown-header-face ((t (:foreground ,ground-olive))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-inline-code-face ((t (:inherit font-lock-constant-face :foreground "#B029B0"))))

 ;; speedbar
 `(speedbar-button-face ((t (:foreground ,ground-fushsia :inherit default))))
 `(speedbar-directory-face ((t (:foreground ,ground-navy :inherit default))))
 `(speedbar-file-face ((t (:foreground ,ground-purple :inherit default))))
 `(speedbar-highlight-face ((t (:foreground "#D9004A" :inherit default))))
 `(speedbar-selected-face ((t (:foreground ,ground-maroon :underline t)))))

(provide-theme 'ground)
