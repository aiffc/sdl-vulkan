(defpackage #:sdl-vulkan-test
  (:use #:cl #:sdl2 #:sdl-vulkan #:cffi))

(in-package #:sdl-vulkan-test)

(defun test ()
  (with-init (:everything)
    (with-window (window :title "test" :w 600 :h 600 :flags '(:vulkan))
      (format t "~a~%" (sdl-get-instance-extensions window)))))
