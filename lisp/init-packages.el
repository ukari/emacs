(require 'init-repository)

(unless package-archive-contents
  (package-refresh-contents))

(defun require-package (package)
  (if (not (package-installed-p package))
      (package-install package)
    nil))

(require-package 'rjsx-mode)

(provide 'init-packages)
