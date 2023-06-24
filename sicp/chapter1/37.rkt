#lang sicp
(#%require rackunit)


(define (cont-frac n d k)
  (define (cont-frac-rec i)
    (cond
      [(< i k) (/ (n i) (+ (d i) (cont-frac-rec (+ 1 i))))]
      [else (/ (n i) (d i))]))
  (cont-frac-rec 1))


