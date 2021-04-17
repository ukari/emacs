;; -*- lexical-binding: t -*-

(require-package 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)

(require-package 'flycheck-haskell)

(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)
(add-hook 'haskell-mode-hook #'flycheck-mode)
(add-hook 'haskell-mode-hook #'interactive-haskell-mode)

(add-hook 'haskell-mode-hook #'enable-paredit-mode)
(add-hook 'haskell-interactive-mode-hook #'enable-paredit-mode)

(setq haskell-process-path-ghci "stack")
(setq haskell-process-args-ghci '("ghci"))
(setq haskell-compile-cabal-build-command "cabal new-build --ghc-option=-ferror-spans")
(setq haskell-compile-cabal-build-alt-command "cabal new-clean -s && cabal new-build --ghc-option=-ferror-spans")

(advice-add #'haskell-process-load-file :around #'load-haskell-context-wrapper)

(defun load-haskell-context-wrapper (origin &rest rest)
  (window-manager (lambda () (apply origin rest)))
  (modify-syntax-entry ?-  ". 123" haskell-mode-syntax-table))

;; revert buffer when haskell process reload due to cabal file changed
;; https://github.com/haskell/haskell-mode/blob/e72677668f5fc7cc148008e885a0f256e245dd43/haskell-load.el#L33

(advice-add #'haskell-process-look-config-changes :around #'haskell-process-look-config-changes-wrapper)

(defun haskell-process-look-config-changes-wrapper (origin &rest rest)
  (advice-add #'y-or-n-p :around #'y-or-n-p-wrapper)
  (unwind-protect
      (apply origin rest)
    (advice-remove #'y-or-n-p #'y-or-n-p-wrapper)))

(defun y-or-n-p-wrapper (origin prompt &rest rest)
  (let ((res (apply origin (cons prompt rest))))
    (when (and (equal prompt "Cabal file changed. Restart GHCi process? ")
               res)
      (advice-add #'haskell-process-start :around #'haskell-process-start-wrapper))
    res))

(defun haskell-process-start-wrapper (origin &rest rest)
  (unwind-protect
      (apply origin rest)
    (revert-buffer t t)
    (advice-remove #'haskell-process-start #'haskell-process-start-wrapper)))

;; highlight glsl for haskell quasi-quote
(seq-map (lambda (x) (add-to-list 'haskell-font-lock-quasi-quote-modes (cons x 'glsl-mode)))
         '("glsl"
           "vert" "frag" "geom" "tesc" "tese" "comp"
           "rgen" "rint" "rahit" "rchit" "rmiss" "rcall"
           "task" "mesh"))

;; C-c C-l to load context
;; C-c C-t to infer type

(provide 'init-haskell)
