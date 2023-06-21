#lang sicp

(#%require rackunit)

(define (sqrt-iter guess_old guess_new x)
    (if (good-enough? guess_old guess_new)
        guess_new
        (sqrt-iter guess_new (improve guess_new x)
            x)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess_old guess_new)
    (< (abs (- guess_new guess_old)) 0.00001))        

(define (square-root x)
    (sqrt-iter 0.0 1.0 x))

(check-equal? (round (* 1000 (square-root 4.0))) 2000.0)

(check-equal? (round (* 1000 (square-root 100.0))) 10000.0)

(check-equal? (round (* 1000 (square-root 1000000.0))) 1000000.0)

(check-equal? (round (* 1000 (square-root 0.04))) 200.0)

(check-equal? (round (* 1000 (square-root 10000000000000000.0))) 100000000000.0)