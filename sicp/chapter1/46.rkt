#lang sicp
(#%require rackunit)

(define (iterative-improve guess? improve)
    (define (iter x) 
        (let [(next (improve x))]
        (if (guess? x next) 
             next
            (iter next))))
    iter)
    
(define (square x) (* x x))


(define (cube-root x)
    (define dx 0.00001)
    (define (close-enough? x1 x2)
      (< (abs (- x1 x2)) dx))
    (define (improve guess)
      (/ (+ (* 2 guess) (/ x (square guess))) 3))
    ((iterative-improve close-enough? improve) 1.0))



(check-equal? (round (cube-root 27)) 3.0)

(check-equal? (round (cube-root 64)) 4.0)