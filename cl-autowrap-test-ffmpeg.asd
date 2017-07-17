(defpackage :cl-autowrap-test-ffmpeg.asdf
  (:use #:cl #:asdf))

(in-package :cl-autowrap-test-ffmpeg.asdf)

(defsystem :cl-autowrap-test-ffmpeg
  :description "Testing for CL-AUTOWRAP using ffmpeg, may require manual work to run"
  :author "Yitzchok Chakiris" 
  :license "LLGPL"
  :version "0.0"

  :depends-on (:cl-autowrap)
  :pathname "t-ffmpeg"
  :serial t-ffmpeg
  :components
  ((:static-file "include/libavcodec/avcodec.h")
   (:static-file "include/libavformat/avformat.h")
   (:static-file "include/libswscale/swscale.h")
   (:static-file "include/imgutils.h")
   (:static-file "tut01.h")
   (:static-file "test.h")))

  ;; :components
  ;;  ((:static-file "test.c")
  ;;   (:static-file "test.h")
  ;;   (:file "test")))
