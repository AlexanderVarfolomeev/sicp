#lang sicp
(#%require rackunit)

;;; (define (accumulate combiner null-value term a next b)
;;;     (if (> a b) null-value
;;;         (combiner (term a) (accumulate combiner null-value term (next a) next b))))


(define (inc n)
  (+ n 1))
(define (square x)
  (* x x))
(define (identity x)
  x)
(define (even? a)
  (= 0 (remainder a 2)))

(define (filtered-accumulate combiner filter? null-value term a next b)
  (cond
    [(> a b) null-value]
    [(filter? a)
     (combiner (term a) (filtered-accumulate combiner filter? null-value term (next a) next b))]
    [else (filtered-accumulate combiner filter? null-value term (next a) next b)]))

(check-equal? (filtered-accumulate * odd? 1 square 1 inc 3 ) 9)
(check-equal? (filtered-accumulate * odd? 1 identity 3 inc 5 ) 15)
(check-equal? (filtered-accumulate + odd? 0 identity 1 inc 10 ) 25)