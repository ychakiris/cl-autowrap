(defpackage :autowrap.test.ffmpeg
  (:use #:cl #:autowrap))

(in-package :autowrap.test.ffmpeg)

#+(or)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi-sys:%load-foreign-library
   :libswresample (merge-pathnames "lib/libswresample.so" (asdf-path 'cl-autowrap-test-ffmpeg))))

#+(or)
 (eval-when (:compile-toplevel :load-toplevel :execute)
   (cffi-sys:%load-foreign-library
    :libavformat (merge-pathnames "lib/libavformat.so" (asdf-path 'cl-autowrap-test-ffmpeg))))


#+(or)
(c-include '(cl-autowrap-test-ffmpeg "test.h")
           :trace-c2ffi t
           :exclude-sources ("/usr/include" "/usr/local/include")
           :sysincludes '("/usr/include/x86_64-linux-gnu" )
           :spec-path '(cl-autowrap-test-ffmpeg)
           :no-accessors cl:t :no-functions cl:t)



(plus-c:c-with ((x x-test-struct))
  (print x)
  (print (x :something))
  (setf (x :something) 2)
  (print (x :something)))


