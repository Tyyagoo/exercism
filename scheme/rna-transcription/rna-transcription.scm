(import (rnrs))

(define (transcribe n)
  (cond
    ((char=? n #\G) #\C)
    ((char=? n #\C) #\G)
    ((char=? n #\T) #\A)
    ((char=? n #\A) #\U)))

(define (dna->rna dna)
  (let ((chars (string->list dna)))
    (list->string (map transcribe chars))))
