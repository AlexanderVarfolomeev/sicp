#lang sicp
(#%require rackunit)

(define (last-pair items)
    (if (= (length items) 1) (car items)
        (last-pair (cdr items))))

