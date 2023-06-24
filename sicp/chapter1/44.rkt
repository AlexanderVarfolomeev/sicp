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

(define dx 0.00001)
(define (smooth f) 
    (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (smooth-n f n) 
    ((repeated smooth n) f))