;; -*- lexical-binding: t -*-

(require 'init-repository)

(setq package-refresh-contents-once (once #'package-refresh-contents))

(setq selected-packages nil)

(defun require-package (package)
  (add-to-list 'selected-packages package)
  (if (not (package-installed-p package))
      (progn
	(funcall package-refresh-contents-once)
	(package-install package))
    nil))

(on-init
 (lambda ()
   (customize-save-variable 'package-selected-packages
                            (sort selected-packages #'string>))
   (message "regenerate package-selected-packages")))

(provide 'init-packages)
