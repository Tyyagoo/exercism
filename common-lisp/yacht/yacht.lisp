(defpackage :yacht
  (:use :cl)
  (:export :score))
(in-package :yacht)

(defun count-occurrences (xs)
  (let ((counts (make-hash-table)))
    (dolist (x xs counts)
      (incf (gethash x counts 0)))
    (let (result)
      (maphash (lambda (key value)
                 (push value result))
               counts)
      (values (sort result #'>) counts))))

(defun singles (scores n)
  (reduce #'+
    (remove-if (lambda (x) (not (equal x n))) scores)))

(defun full-house (scores)
  (multiple-value-bind (sorted-counts counts) (count-occurrences scores)
    (let ((fst (car sorted-counts)) (snd (cadr sorted-counts)))
      (if (and (equal 3 fst) (equal 2 snd))
          (choice scores)
          0))))

(defun four-of-a-kind (scores)
  (multiple-value-bind (sorted-counts counts) (count-occurrences scores)
    (let ((result 0))
      (maphash (lambda (key value)
                 (when (>= value 4)
                   (setf result (* 4 key))))
               counts)
      result)))

(defun contains-straight (start scores)
  (every (lambda (x) (member x scores))
         (loop for i from start to (+ start 4) collect i)))

(defun little-straight (scores)
  (if (contains-straight 1 scores)
      30
      0))

(defun big-straight (scores)
  (if (contains-straight 2 scores)
      30
      0))

(defun choice (scores)
  (reduce #'+ scores))

(defun yacht (scores)
  (if (equal 5 (count (car scores) scores))
      50
      0))

(defun score (scores category)
  (case category
    (:ones (singles scores 1))
    (:twos (singles scores 2))
    (:threes (singles scores 3))
    (:fours (singles scores 4))
    (:fives (singles scores 5))
    (:sixes (singles scores 6))
    (:full-house (full-house scores))
    (:four-of-a-kind (four-of-a-kind scores))
    (:little-straight (little-straight scores))
    (:big-straight (big-straight scores))
    (:choice (choice scores))
    (:yacht (yacht scores))))
