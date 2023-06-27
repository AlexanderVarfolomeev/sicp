#lang sicp
(#%require rackunit)

(define (reverse items)
    (if (= 1 (length items)) (list (car items))
        (append (reverse (cdr items)) (list (car items)) )))