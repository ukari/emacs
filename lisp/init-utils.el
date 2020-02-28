;; -*- lexical-binding: t -*-

(defmacro on-init (&rest expr)
  `(add-hook 'after-init-hook (lambda () ,@expr)))

(defun once(fn)
  (let ((done nil))
    (lambda () (unless done
                 (funcall fn)
                 (setf done t)))))

(provide 'init-utils)
