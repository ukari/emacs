;; -*- lexical-binding: t -*-

(defmacro on-init (fn)
  `(add-hook 'after-init-hook ,fn))

(defmacro on-frame (fn)
  `(add-hook 'after-make-frame-functions ,fn))

(defun once(fn)
  (let ((done nil))
    (lambda () (unless done
                 (funcall fn)
                 (setf done t)))))

(provide 'init-utils)
