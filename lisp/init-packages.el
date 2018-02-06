;; -*- lexical-binding: t -*-

(require 'init-repository)

(setq package-refresh-contents-once (once #'package-refresh-contents))

(defun require-package (package)
  (if (not (package-installed-p package))
      (progn
	(funcall package-refresh-contents-once)
	(package-install package))
    nil))

(provide 'init-packages)
