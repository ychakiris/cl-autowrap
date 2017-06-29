(defpackage :autowrap.test.curl
  (:use #:cl #:autowrap))

(in-package :autowrap.test.curl)

#+(or)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi-sys:%load-foreign-library
   :libcurl (merge-pathnames "lib/libcurl.so" (asdf-path 'cl-autowrap-test-curl))))

#+(or)
(c-include '(cl-autowrap-test-curl "test.h")
           :trace-c2ffi t 
           :exclude-sources ("/usr/include" "/usr/local/include")
           :sysincludes '("/usr/include/x86_64-linux-gnu")
           :spec-path '(cl-autowrap-test-curl))




