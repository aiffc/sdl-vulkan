(defsystem "sdl-vulkan"
  :version "0.1.0"
  :author "yjc18915568435@gmail.com"
  :license "MIT"
  :depends-on (:sdl2 :cffi :vk)
  :components ((:file "src/package")
	       (:file "src/sdl-loader")
	       (:file "src/types")
	       (:file "src/functions")
	       (:file "src/wrapp")
	       (:file "test/test"))
  :description "for sdl vulkan")


