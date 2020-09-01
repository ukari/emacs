;; -*- lexical-binding: t -*-

(setq-default indent-tabs-mode nil)

;; charset
;; (set-language-environment "UTF-8")
;; (prefer-coding-system 'gb18030)
;; (prefer-coding-system 'utf-8)

(on-init
 ;;default directory
 (cd (getenv "HOME")))

(provide 'init-editor)
