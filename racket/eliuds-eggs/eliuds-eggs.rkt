#lang racket

(provide number->eggs)

(define (number->eggs n)
  (foldl + 0 (for/list ([i (in-range 0 64)])
    (bitwise-and 1 (arithmetic-shift n (- i))))))

