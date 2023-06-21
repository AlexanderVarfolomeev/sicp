#lang sicp

(#%require rackunit)

(define (average y x)
    (
        /
        (+ 
            (* 2 y)
            (/ x (* y y)))
        3 
    ))

(define (good-enough? guess x)
    (< (abs (- (* guess guess guess) x)) 0.00001))   


(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (average guess x)
            x)))

(define (cube-root x)
    (sqrt-iter 1.0 x))



(check-equal? (round (* 1000 (cube-root 8.0))) 2000.0)

(check-equal? (round (* 1000 (cube-root 1000.0))) 10000.0)

(check-equal? (round (* 1000 (cube-root 1000000000.0))) 1000000.0)

(check-equal? (round (* 1000 (cube-root 0.008))) 200.0)