#lang sicp
(#%require rackunit)
;;; (define (sum term a next b)
;;;   (define (iter a result)
;;;     (if (> a b) result (iter (next a) (+ (term a) result))))
;;;   (iter a 0))
  
;;; (define (accumulate combiner null-value term a next b)
;;;     (if (> a b) null-value
;;;         (combiner (term a) (accumulate combiner null-value term (next a) next b))))


(define (accumulate combiner null-value term a next b)
    (define (iter a result)
        (if (> a b) result
            (iter (next a) (combiner (term a) result))))
    (iter a null-value))


(define (inc n) (+ n 1))
(define (square x) (* x x))
(define (identity x) x)

(check-equal? (accumulate * 1 square 1 inc 3) 36)

(check-equal? (accumulate * 1 identity 3 inc 5) 60)

(check-equal? (accumulate + 0 identity 1 inc 10) 55)