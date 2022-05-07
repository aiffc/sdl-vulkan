;; MIT License

;; Copyright (c) 2020 aiffc

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

(in-package #:sdl-vulkan)

(defun sdl-create-surface (instance window)
  (with-foreign-object (p-surface 'SDL_SurfaceKhr)
    (if (zerop (SDL_Vulkan_CreateSurface (sdl2-ffi::sdl-window-ptr window) (vk::instance-handle instance) p-surface))
	(error "create surface failed")
	(vk::make-surface-khr-wrapper (mem-ref p-surface 'SDL_SurfaceKhr)))))

(defun sdl-get-drawable-size (window)
  (with-foreign-objects ((w :int)
			 (h :int))
    (SDL_Vulkan_GetDrawableSize (sdl2-ffi::sdl-window-ptr window) w h)
    (vk:make-extent-2d :width (mem-ref w :int)
		       :height (mem-ref h :int))))

(defun sdl-get-instance-extensions (window)
  (with-foreign-object (p-count :unsigned-int)
    (if (zerop (SDL_Vulkan_GetInstanceExtensions (sdl2-ffi::sdl-window-ptr window) p-count (null-pointer)))
	(warn "no support extensions")
	(let ((count (mem-ref p-count :unsigned-int)))
	  (unless (zerop count)
	    (with-foreign-object (p-names '(:pointer :char) count)
	      (if (zerop (SDL_Vulkan_GetInstanceExtensions (sdl2-ffi::sdl-window-ptr window) p-count p-names))
		  (error "second get faield")
		  (loop for i from 0 below count
			collect (foreign-string-to-lisp (mem-aref p-names '(:pointer :char) i))))))))))

(defun sdl-get-instance-procaddr ()
  (SDL_Vulkan_GetVkInstanceProcAddr))

(defun sdl-load-library (path)
  (with-foreign-string (p-path path)
    (SDL_Vulkan_LoadLibrary p-path)))

(defun sdl-unload-library ()
  (SDL_Vulkan_UnloadLibrary))
