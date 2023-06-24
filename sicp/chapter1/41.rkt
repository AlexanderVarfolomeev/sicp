#lang sicp
(#%require rackunit)

(define (double f)
    (lambda (x) (f (f x))))