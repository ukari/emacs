;; -*- lexical-binding: t -*-

(defmacro on-init (fn)
  `(add-hook 'after-init-hook ,fn))

(provide 'init-utils)
