#lang sicp
(#%require rackunit)

(define (cons a b)
    (* (expt 2 a) (expt 3 b)))
(define (car x)
    (define (car-iter x cnt)
        (if (= 0 (remainder x 2))
                (car-iter (/ x 2) (+ cnt 1))
            cnt))
    (car-iter x 0))

(define (cdr x)
    (define (cdr-iter x cnt)
        (if (= 0 (remainder x 3))
                (cdr-iter (/ x 3) (+ cnt 1))
            cnt))
    (cdr-iter x 0))