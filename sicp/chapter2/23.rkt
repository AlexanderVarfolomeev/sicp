#lang sicp
(#%require rackunit)

(define (my-for-each proc items)
    (cond ((not (null? items)) (proc (car items)) (my-for-each proc (cdr items) ))))