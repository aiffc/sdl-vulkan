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

(defcfun ("SDL_Vulkan_CreateSurface" SDL_Vulkan_CreateSurface) SDL_bool
  (window :pointer)
  (instance SDL_VkInstance)
  (surface (:pointer SDL_SurfaceKhr)))

(defcfun ("SDL_Vulkan_GetDrawableSize" SDL_Vulkan_GetDrawableSize) :void
  (window :pointer)
  (w (:pointer :int))
  (h (:pointer :int)))

(defcfun ("SDL_Vulkan_GetInstanceExtensions" SDL_Vulkan_GetInstanceExtensions) SDL_bool
  (window :pointer)
  (p-count (:pointer :unsigned-int))
  (p-names (:pointer (:pointer :char))))

(defcfun ("SDL_Vulkan_GetVkInstanceProcAddr" SDL_Vulkan_GetVkInstanceProcAddr) :void)

(defcfun ("SDL_Vulkan_LoadLibrary" SDL_Vulkan_LoadLibrary) :int
  (path (:pointer :char)))

(defcfun ("SDL_Vulkan_UnloadLibrary" SDL_Vulkan_UnloadLibrary) :void)
