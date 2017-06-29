(defpackage :cl-autowrap-test-curl.asdf
  (:use #:cl #:asdf))

(in-package :cl-autowrap-test-curl.asdf)

(defsystem :cl-autowrap-test-curl
  :description "Testing for CL-AUTOWRAP using curl, may require manual work to run"
  :author "Yitzchok Chakiris"
  :license "LLGPL"
  :version "0.0"

  :depends-on (:cl-autowrap)
  :pathname "t-curl"
  :serial t-curl
  :components
  ((:static-file "include/curl/curl.h")
   (:static-file "include/curl/easy.h")
   (:static-file "test.h")))

  ;; :components
  ;;  ((:static-file "test.c")
  ;;   (:static-file "test.h")
  ;;   (:file "test")))
