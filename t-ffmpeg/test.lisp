(defpackage :autowrap.test.ffmpeg
  (:use #:cl #:autowrap))

(in-package :autowrap.test.ffmpeg)

#+(or)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi-sys:%load-foreign-library
   :libswresample (merge-pathnames "lib/libavutil.so" (asdf-path 'cl-autowrap-test-ffmpeg))))



#+(or)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi-sys:%load-foreign-library
   :libswresample (merge-pathnames "lib/libswresample.so" (asdf-path 'cl-autowrap-test-ffmpeg))))

#+(or)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi-sys:%load-foreign-library
   :libswresample (merge-pathnames "lib/libavcodec.so" (asdf-path 'cl-autowrap-test-ffmpeg))))



#+(or)
 (eval-when (:compile-toplevel :load-toplevel :execute)
   (cffi-sys:%load-foreign-library
    :libavformat (merge-pathnames "lib/libavformat.so" (asdf-path 'cl-autowrap-test-ffmpeg))))


#+(or)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi-sys:%load-foreign-library
   :libswscale (merge-pathnames "lib/libswscale.so" (asdf-path 'cl-autowrap-test-ffmpeg))))


#+(or)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi-sys:%load-foreign-library
   :libtut01 (merge-pathnames "tutorial/libtut01.so.1.0.1" (asdf-path 'cl-autowrap-test-ffmpeg))))


#+(or)
(c-include '(cl-autowrap-test-ffmpeg "tut01.h")
           :trace-c2ffi t
           :exclude-sources ("/usr/include" "/usr/local/include")
           :include-sources ("/usr/include/stdint.h")
           :sysincludes '("/usr/include/x86_64-linux-gnu"
                          "/home/yitzchok/quicklisp/local-projects/cl-autowrap/t-ffmpeg/include" )
           :spec-path '(cl-autowrap-test-ffmpeg)
           :no-accessors cl:t)

(av-register-all)
(setq pFormatCtx  (avformat-alloc-context))
(type-of pformatctx)


(autowrap:alloc-ptr (type-of (autowrap:alloc-ptr (type-of pformatctx)))

(setq pointer-to-pformatctx (autowrap:alloc-ptr (type-of pformatctx)))

(autowrap:c-aptr pformatctx 0)

;; (avformat-open-input )

(autowrap:sizeof pformatctx)



(in-package :plus-c)
(c-with ((x :char :count 5))
  (setf x[0] #\a)
  (print x[0])
  (print (x &))
  (print (type-of x)) )






(type-of #\3)

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

(c-with ((x :int))                ;; same as c-let with :free T
  (print x)                       ;; => whatever value was in memory
  (setf x 42)
  (print (x &))                   ;; => &x (pointer)
  (print x))   


