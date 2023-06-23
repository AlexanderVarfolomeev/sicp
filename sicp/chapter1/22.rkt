;;; напишите процедуру search-for-primes, которая проверяет на про-
;;; стоту все нечетные числа в заданном диапазоне.
#lang sicp
(#%require rackunit)

(define (square n)
  (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond
    [(> (square test-divisor) n) n]
    [(divides? test-divisor n) test-divisor]
    [else (find-divisor n (+ test-divisor 1))]))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)  
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n) (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (even? a) (= 0 (remainder a 2)))

(define (search-for-primes a b)
  (cond
    [(and (= a b) (even? (+ 1 a))) (timed-prime-test a)]
    [(= a b) (display " ")]
    [(even? a) (search-for-primes (+ a 1) b)]
    [else
     (timed-prime-test a)
     (search-for-primes (+ a 1) b)]))