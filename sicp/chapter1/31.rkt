#lang sicp
(#%require rackunit)
(define (even? a) (= 0 (remainder a 2)))

;;; (define (product term a next b)
;;;   (if (> a b) 1 
;;;       (* (term a) (product term (next a) next b))))

(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* (term a) result))))
    (iter a 1))

(define (calc-pi n) 
(define (numerator n) 
    (define (term num) 
        (cond
             ((even? num) (+ num 2))
             (else (+ 2 (- num 1)))))
    (product term 1 inc n))
(define (denominator n) 
    (define (term num) 
        (cond
             ((even? num) (+ num 1))
             (else (+ num 2))))
    (product term 1 inc n))
    (* 4 (/ (numerator n) (denominator n))))

(define (factorial n)
    (product identity 1 inc n))

(define (inc n) (+ n 1))
(define (square x) (* x x))
(define (identity x) x)

(check-equal? (product square 1 inc 3) 36)
(check-equal? (product identity 3 inc 5) 60)
(check-equal? (factorial 5) 120)