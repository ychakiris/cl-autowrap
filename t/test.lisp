(defpackage :autowrap.test
  (:use #:cl #:autowrap))

(in-package :autowrap.test)

#+(or)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi-sys:%load-foreign-library
   :libtest (merge-pathnames "libtest.so" (asdf-path 'cl-autowrap-test))))

#+(or)
(c-include '(cl-autowrap-test "test.h")
           :spec-path '(cl-autowrap-test))

#+(or)
(let ((foo (get-foo)))
  (print foo)
  (print (foo-t.a foo))
  (print (foo-t.x[].a foo 0))
  (print (foo-t.x[].f foo 1))
  (print (foo-t.x[].b0 foo 0))
  (print (foo-t.x[].b1 foo 0))
  (print (cffi-sys:%mem-ref (ptr foo) :unsigned-char (+ 16 24)))
  (setf (foo-t.x[].b0 foo 0) #b01)
  (setf (foo-t.x[].b1 foo 0) #b110)
  (print-bits foo)
  (free-foo foo))

