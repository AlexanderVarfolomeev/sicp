#lang sicp
(#%require rackunit)

(define (make-segment x y) (cons x y))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (midpoint-segment s)
    (make-point 
        (/ 
            (+ 
                (x-point (start-segment s)) 
                (x-point (end-segment s))) 
            2)
        (/ 
            (+ 
                (y-point (start-segment s)) 
                (y-point (end-segment s))) 
            2)))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))



(define p1 (make-point 2 3))
(define p2 (make-point 4 5))

(define s (make-segment p1 p2))

(check-equal? (make-segment p1 p2) '((2 . 3) 4 . 5))
(check-equal? (midpoint-segment s) '(3 . 4))
(check-equal? (start-segment s) p1)
(check-equal? (end-segment s) p2)
(check-equal? (x-point p1) 2)
(check-equal? (y-point p2) 5)