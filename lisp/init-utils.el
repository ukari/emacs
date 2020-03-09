;; -*- lexical-binding: t -*-

(defvar *on-init-list* nil)

(defmacro on-init (&rest expr)
  `(add-to-list '*on-init-list* (lambda () ,@expr)))

(defun call-on-init ()
  (seq-map (lambda (x) (add-hook 'after-init-hook x)) *on-init-list*))

(defun once(fn)
  (let ((done nil))
    (lambda () (unless done
                 (funcall fn)
                 (setf done t)))))

(provide 'init-utils)
