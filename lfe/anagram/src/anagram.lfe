(defmodule anagram
  (export (find 2)))

(defun find (word candidates)
  (let* ((lower (string:to_lower word)))
    (lists:filter
      (lambda (w) (is_anagram lower w))
      candidates)))

(defun is_anagram (word candidate)
  (let* ((lower (string:to_lower candidate)))
    (and
      (/= word lower)
      (== (lists:sort word) (lists:sort lower)))))