#lang sicp

(#%require rackunit)



(define (square x) (* x x))
(define (pr x y z) (cond ((and (>= x y) (>= z y)) (+ (square x) (square z)))
                         ((and (>= x y) (>= y z)) (+ (square x) (square y)))
                         ((and (>= y x) (>= x z)) (+ (square x) (square y)))
                         (else (+ (square y) (square z)))
                        ))


(check-equal? (pr 1 2 3) 13)
(check-equal? (pr 3 3 3) 18)
(check-equal? (pr 3 0 0) 9)
(check-equal? (pr 3 4 1) 25)
(check-equal? (pr 4 3 1) 25)
(check-equal? (pr 1 4 3) 25)
(check-equal? (pr 1 3 4) 25)