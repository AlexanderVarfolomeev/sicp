#lang sicp
(#%require rackunit)

;;; (define (sum term a next b)
;;;   (if (> a b) 0 
;;;       (+ (term a) (sum term (next a) next b))))


(define (sum term a next b)
  (define (iter a result)
    (if (> a b) result (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (inc n)
  (+ n 1))

(define (cube x)
  (* x x x))

(define (identity x)
  x)

(check-equal? (sum cube 0 inc 2) 9)

(check-equal? (sum cube 1 inc 10) 3025)

(check-equal? (sum identity 1 inc 10) 55)
