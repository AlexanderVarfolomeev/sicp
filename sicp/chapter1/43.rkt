#lang sicp
(#%require rackunit)
(define (inc x) (+ 1 x))
(define (square x) (* x x))

(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated f n)
    (cond 
        ((= 1 n) f)
        (else (compose f (repeated f (- n 1))))))

(check-equal? ((repeated square 1) 6) 36)

(check-equal? ((repeated square 2) 5) 625)

(check-equal? ((repeated inc 10) 10) 20)