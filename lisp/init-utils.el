;; -*- lexical-binding: t -*-

(defmacro on-init (fn)
  `(add-hook 'after-init-hook ,fn))

(defun once(fn)
  (let ((done nil))
    (lambda () (unless done
		 (funcall fn)
		 (setf done t)))))

(provide 'init-utils)
