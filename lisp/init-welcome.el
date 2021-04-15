;; -*- lexical-binding: t -*-

(require 'generator)

(setq inhibit-splash-screen t)

(defvar welcome-message "Our typewriter has been wired in... Please remember to check the window bird. Driving on your high way~>")

;; situations
;; 1. daemon mode, graphics client
;; 2. daemon mode, non graphics client
;; 3. non daemon mode, graphics
;; 4. non daemon mode, non graphics

;; situation 1, 3
;;(add-hook 'focus-in-hook #'frame-welcome)

(if (daemonp)
    (progn
      ;; inhibt default startup message in situation 1
      (advice-add #'server-execute :around #'server-execute-echo-area-silencer)
      ;; situation 1, 2
      (advice-add #'server-execute :around #'server-execute-welcome-wrapper)
      )
  (progn
    ;; inhibt default startup message in situation 3
    (advice-add #'display-startup-echo-area-message :around #'startup-echo-area-message-silencer)
    ;; situation 3, 4
    (advice-add #'display-startup-echo-area-message :around #'non-daemon-welcome-wrapper)
    ))

(defun server-execute-echo-area-silencer (origin &rest rest)
  (let ((inhibit-message t))
    (apply origin rest)))

(defun server-execute-welcome-wrapper (origin &rest rest)
  (print "here")
  (unwind-protect (apply origin rest)
    (welcome)))

(defun startup-echo-area-message-silencer (origin &rest rest)
  (let ((inhibit-message t))
    (apply origin rest)))

(defun non-daemon-welcome-wrapper (origin &rest rest)
  (advice-remove #'display-startup-echo-area-message #'non-daemon-welcome-wrapper)
  (unwind-protect (apply origin rest)
    (welcome)))

(defun welcome ()
  (run-at-time 0.24 nil (lambda () (type-message welcome-message)))
  t)

(iter-defun message-generator (mes)
  (let ((chars (split-string mes ""))
        (acc)
        (cur))
    (while chars
      (setf cur (car chars))
      (setf acc (concat acc cur))
      (setf chars (cdr chars))
      (iter-yield acc))))

;; (defun frame-welcome ()
;;   (let ((cur (selected-frame)))
;;     (unless (frame-parameter cur 'welcomed)
;;       (set-frame-parameter cur 'welcomed t)
;;       (when window-system (welcome)))))

(defun type-message (mes &optional delay)
  (unless delay
    (setf delay 0.019))
  (let ((after 0)
        (iter (message-generator mes)))
    (iter-do (x iter)
      (setf after (+ after delay))
      (run-at-time after nil ((lambda (fixx) (lambda () (let ((message-log-max nil)) (message fixx)))) x)))
    (run-at-time (+ after delay) nil (lambda () (message mes)))))

(provide 'init-welcome)
