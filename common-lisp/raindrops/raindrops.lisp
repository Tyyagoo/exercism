(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defparameter *sounds* '((3 . "Pling") (5 . "Plang") (7 . "Plong")))

(defun convert (n)
  (let ((out (apply #'concatenate 'string 
                     (mapcar
                      #'(lambda (x)
                          (if (= (mod n (car x)) 0)
                              (cdr x)
                              ""))
                      *sounds*))))
    (if (string= out "")
        (princ-to-string n)
        out)))
