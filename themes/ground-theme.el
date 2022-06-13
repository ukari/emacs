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

(defcustom ground-background "#f7f7ed";;"#FAFAD9"
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

(defcustom ground-lime "#e3d397";;"#e3d19a";; "#e6d197";;"#dfd993";;"#9de0ad";;"#a3d9bf" ;;"#a9c781" ;;"#7CC470"
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

(defcustom ground-teal "#51638a";;"#537c8a" ;; "#a1c7b9" ;;"#a1c1b4" ;;"#a3ceb6" ;;"#00838C"
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
  "Silver color."
  :type 'string
  :group 'ground)

(defcustom ground-note ground-lime
  "Note color."
  :type 'string
  :group 'ground)

(defcustom ground-info ground-aqua
  "Info color."
  :type 'string
  :group 'ground)

(defcustom ground-warning ground-yellow
  "Warning color."
  :type 'string
  :group 'ground)

(defcustom ground-error ground-red
  "Error color."
  :type 'string
  :group 'ground)

(defcustom ground-success ground-green
  "Success color."
  :type 'string
  :group 'ground)

(defcustom ground-highlight "#8ae6c8" ;;"#8ae6cf" ;;"#8ae6d8" ;; "#96E0E0" ;;"#00838C"
  "Highlight color."
  :type 'string
  :group 'ground)

(custom-theme-set-variables
 'ground
 ;; widget
 '(custom-raised-buttons nil)
  ;; tooltip
 `(x-gtk-use-system-tooltips nil)
 `(tooltip-frame-parameters '((alpha . 100) (name . "tooltip") (internal-border-width . 8) (border-width . 0) (no-special-glyphs . t))))

(custom-theme-set-faces
 'ground
 ;; default color, sea water
 `(default ((t (:foreground ,ground-teal :background ,ground-background))))

 ;; mouse
 `(mouse ((t (:foreground ,ground-background :background ,ground-foreground :inverse t))))

 ;; cursor
 `(cursor ((t (:background ,ground-teal))))
 `(region ((t (:background ,ground-highlight :extend t :inherit highlight))))

 ;; appearance
 `(menu ((t (:foreground ,ground-foreground :background ,ground-background))))
 `(fringe ((t (:foreground ,ground-foreground :background ,ground-background))))
 `(vertical-border ((t (:foreground ,ground-silver))))
 `(highlight ((t (:background ,ground-highlight))))
 `(variable-pitch ((t (:family unspecified))))
 `(shadow ((t (:foreground "grey50"))))
 `(homoglyph ((t (:foreground "brown"))))
 `(warning ((t (:foreground ,ground-warning :weight bold))))
 `(error ((t (:foreground ,ground-error :weight bold))))
 `(success ((t (:foreground ,ground-success :weight bold))))

 ;; font-lock
 `(font-lock-builtin-face ((t (:weight normal :foreground ,ground-purple))))
 `(font-lock-comment-delimiter-face ((t (:foreground ,ground-silver))))
 `(font-lock-comment-face ((t (:foreground ,ground-grey))))
 `(font-lock-constant-face ((t (:foreground "#F57878"))))
 `(font-lock-doc-face ((t (:foreground ,ground-fushsia))))
 `(font-lock-function-name-face ((t (:foreground ,ground-maroon))))
 `(font-lock-keyword-face ((t (:foreground ,ground-red))))
 `(font-lock-negation-char-face ((t (:weight bold :foreground ,ground-red))))
 `(font-lock-preprocessor-face ((t (:inherit font-lock-builtin-face))))
 `(font-lock-regexp-grouping-backslash ((t (:weight normal :foreground ,ground-green))))
 `(font-lock-regexp-grouping-construct ((t (:weight normal :foreground ,ground-yellow))))
 `(font-lock-string-face ((t (:foreground ,ground-olive))))
 `(font-lock-type-face ((t (:slant normal :foreground ,ground-lime))))
 `(font-lock-variable-name-face ((t (:foreground ,ground-blue))))
 `(font-lock-warning-face ((t (:weight bold :slant italic :underline t :foreground ,ground-warning))))

 ;; header-line
 `(header-line ((t (:foreground ,ground-lime :background ,ground-background :underline nil :box nil :inherit mode-line))))
 `(header-line-highlight ((t (:inherit mode-line-highlight))))
 
 ;; imenu-list
 `(imenu-list-entry-face-1 ((t (:foreground ,ground-navy :inherit imenu-list-entry-face))))
 
 ;; diff-hl
 `(diff-hl-change ((t (:foreground ,ground-aqua :background ,ground-aqua))))
 `(diff-hl-delete ((t (:foreground ,ground-red :background ,ground-red))))
 `(diff-hl-insert ((t (:foreground ,ground-green :background ,ground-green))))

 ;; rainbow
 `(rainbow-delimiters-base-error-face ((t (:foreground "#D9004A" :inherit rainbow-delimiters-base-face))))
 `(rainbow-delimiters-base-face ((t (:inherit nil))))
 `(rainbow-delimiters-depth-1-face ((t (:foreground "#C25151" :inherit rainbow-delimiters-base-face))))
 `(rainbow-delimiters-depth-2-face ((t (:foreground "#C28F51" :inherit rainbow-delimiters-base-face))))
 `(rainbow-delimiters-depth-3-face ((t (:foreground "#BCC251" :inherit rainbow-delimiters-base-face))))
 `(rainbow-delimiters-depth-4-face ((t (:foreground "#7AC251" :inherit rainbow-delimiters-base-face))))
 `(rainbow-delimiters-depth-5-face ((t (:foreground "#51C286" :inherit rainbow-delimiters-base-face))))
 `(rainbow-delimiters-depth-6-face ((t (:foreground "#51BAC2" :inherit rainbow-delimiters-base-face))))
 `(rainbow-delimiters-depth-7-face ((t (:foreground "#5155C2" :inherit rainbow-delimiters-base-face))))
 `(rainbow-delimiters-depth-8-face ((t (:foreground "#9951C2" :inherit rainbow-delimiters-base-face))))
 `(rainbow-delimiters-depth-9-face ((t (:foreground "#C2518D" :inherit rainbow-delimiters-base-face))))
 `(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face))))
 `(rainbow-delimiters-unmatched-face ((t (:inherit rainbow-delimiters-base-error-face))))

 ;; linum
 `(line-number ((t (:foreground ,ground-foreground :background ,ground-background :underline nil :inherit default))))
 `(line-number-current-line ((t (:foreground ,ground-foreground :background ,ground-background :underline t :inherit default))))

 ;; isearch
 `(isearch ((t (:foreground ,ground-background :background "#4b96e0" :inherit region))))
 `(isearch-fail ((t (:foreground ,ground-background :background ,ground-fushsia :inherit isearch))))

 ;; widget
 `(custom-button-unraised ((t (:inherit underline))))
 `(custom-group-tag ((t (:height 1.2 :foreground ,ground-blue :inherit default))))
 `(custom-face-tag ((t (:height 1.0 :weight bold :foreground "hot pink" :inherit default))))
 `(custom-variable-tag ((t (:height 1.2 :foreground ,ground-blue :inherit default))))
 `(widget-field ((t (:foreground ,ground-background :background "#F57878" :box nil :extend t))))
 `(help-key-binding ((t (:foreground ,ground-background :background "#F57878" :box nil))))

 ;; tooltip
 `(tooltip ((t (:foreground ,ground-olive :background ,ground-purple :inherit variable-pitch))))

 ;; mini buffer
 `(minibuffer-prompt ((t (:foreground "#E53E36"))))

 ;; mode line
 `(mode-line ((t (:foreground ,ground-background :background ,ground-highlight :box nil)))) ;; "#569677"
 `(mode-line-buffer-id ((t (:weight normal :foreground ,ground-fushsia)))) ;;,ground-yellow
 `(mode-line-emphasis ((t (:weight bold))))
 `(mode-line-highlight ((t (:foreground ,ground-purple :box nil)))) ;; "#f1dd6a"
 `(mode-line-inactive ((t (:foreground ,ground-grey :background ,ground-background :box nil))))

 ;; markdown
 `(markdown-code-face ((t (:inherit font-lock-builtin-face))))
 `(markdown-header-face ((t (:inherit font-lock-function-name-face))))
 `(markdown-header-face-1 ((t (:height 1.0 :inherit markdown-header-face))))
 `(markdown-header-face-2 ((t (:height 1.0 :inherit markdown-header-face))))
 `(markdown-header-face-3 ((t (:height 1.0 :inherit markdown-header-face))))
 `(markdown-header-face-4 ((t (:height 1.0 :inherit markdown-header-face))))
 `(markdown-inline-code-face ((t (:inherit font-lock-builtin-face))))

 ;; speedbar
 `(speedbar-button-face ((t (:foreground ,ground-fushsia :inherit default))))
 `(speedbar-directory-face ((t (:foreground ,ground-navy :inherit default))))
 `(speedbar-file-face ((t (:foreground ,ground-purple :inherit default))))
 `(speedbar-highlight-face ((t (:foreground "#D9004A" :inherit default))))
 `(speedbar-selected-face ((t (:foreground ,ground-maroon :underline t))))

 ;; flycheck
 `(flycheck-error ((t (:underline (:color ,ground-error :style wave)))))
 `(flycheck-info ((t (:underline (:color ,ground-info :style wave)))))
 `(flycheck-warning ((t (:underline (:color ,ground-warning :style wave)))))

 ;; flymake
 `(flymake-error ((t (:underline (:color ,ground-error :style wave)))))
 `(flymake-note ((t (:underline (:color ,ground-note :style wave)))))
 `(flymake-warning ((t (:underline (:color ,ground-warning :style wave)))))

 ;; lsp
 `(lsp-headerline-breadcrumb-path-error-face ((t (:underline (:color ,ground-error :style wave) :inherit lsp-headerline-breadcrumb-path-face))))
 `(lsp-headerline-breadcrumb-path-hint-face ((t (:underline (:color ,ground-green :style wave) :inherit lsp-headerline-breadcrumb-path-face))))
 `(lsp-headerline-breadcrumb-path-info-face ((t (:underline (:color ,ground-lime :style wave) :inherit lsp-headerline-breadcrumb-path-face))))
 `(lsp-headerline-breadcrumb-path-warning-face ((t (:underline (:color ,ground-warning :style wave) :inherit lsp-headerline-breadcrumb-path-face))))
 `(lsp-headerline-breadcrumb-symbols-error-face ((t (:underline (:color ,ground-error :style wave) :inherit lsp-headerline-breadcrumb-symbols-face))))
 `(lsp-headerline-breadcrumb-symbols-hint-face ((t (:underline (:color ,ground-green :style wave) :inherit lsp-headerline-breadcrumb-symbols-face))))
 `(lsp-headerline-breadcrumb-symbols-info-face ((t (:underline (:color ,ground-lime :style wave) :inherit lsp-headerline-breadcrumb-symbols-face))))
 `(lsp-headerline-breadcrumb-symbols-warning-face ((t (:underline (:color ,ground-warning :style wave) :inherit lsp-headerline-breadcrumb-symbols-face))))
 `(lsp-headerline-breadcrumb-unknown-project-prefix-face ((t (:weight bold :inherit shadow))))
 `(lsp-installation-buffer-face ((t (:foreground ,ground-teal))))
 `(lsp-installation-finished-buffer-face ((t (:foreground ,ground-yellow))))
 `(lsp-modeline-code-actions-face ((t (:inherit homoglyph))))
 `(lsp-modeline-code-actions-preferred-face ((t (:foreground ,ground-olive)))))

(provide-theme 'ground)
