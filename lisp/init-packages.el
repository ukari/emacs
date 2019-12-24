;; -*- lexical-binding: t -*-

(require 'init-repository)

(setq package-refresh-contents-once (once #'package-refresh-contents))

(setq selected-packages nil)

(defun require-package (package)
  (add-to-list 'selected-packages package)
  (print package)
  (print selected-packages)
  (if (not (package-installed-p package))
      (progn
	(funcall package-refresh-contents-once)
	(package-install package))
    nil))

(on-init
 (lambda ()
   (print selected-packages)
   (customize-save-variable 'package-selected-packages
                            (sort selected-packages #'string>))))

(provide 'init-packages)
