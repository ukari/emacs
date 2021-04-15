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
 (let* ((regenerated-package-selected-packages (sort selected-packages #'string>))
        (need-regenerate-p (not (equal package-selected-packages
                                    regenerated-package-selected-packages))))
   (message "Custom variable package-selected-packages check finished.")
   (when need-regenerate-p
     (message "Regenerate package-selected-packages.")
     (customize-save-variable 'package-selected-packages
                              regenerated-package-selected-packages))))

(provide 'init-packages)
