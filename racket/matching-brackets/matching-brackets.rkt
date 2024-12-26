#lang racket

(provide balanced?)

(define (balanced? str)
  (empty?
    (foldl
      (λ
        (ch acc)
        (cond
          [(not (brackets? ch)) acc]
          [(empty? acc) (cons ch acc)]
          [(matches? ch (car acc)) (cdr acc)]
          [else (cons ch acc)]))
      '()
      (string->list str))))

(define (matches? x y)
  (or
     (and (char=? x #\)) (char=? y #\())
     (and (char=? x #\}) (char=? y #\{))
     (and (char=? x #\]) (char=? y #\[))))

(define (brackets? ch)
  (or
     (char=? ch #\()
     (char=? ch #\{)
     (char=? ch #\[)
     (char=? ch #\))
     (char=? ch #\})
     (char=? ch #\])))
