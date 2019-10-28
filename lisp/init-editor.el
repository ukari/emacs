;; -*- lexical-binding: t -*-

(setq-default indent-tabs-mode nil)

(on-init (lambda ()
           ;;default directory
           (cd (getenv "HOME"))))

(provide 'init-editor)
