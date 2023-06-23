#lang sicp
(#%require rackunit)
(define (expmod base exp m)
  (cond
    [(= exp 0) 1]
    [(even? exp) (remainder (square (expmod base (/ exp 2) m)) m)]
    [else (remainder (* base (expmod base (- exp 1) m)) m)]))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond
    [(= times 0) true]
    [(fermat-test n) (fast-prime? n (- times 1))]
    [else false]))

(define (square n)
  (* n n))
(define (even? a) (= 0 (remainder a 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond
    [(> (square test-divisor) n) n]
    [(divides? test-divisor n) test-divisor]
    [else (find-divisor n (next test-divisor))]))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)  
  (= n (smallest-divisor n)))

(define (next n)
  (if (even? n) (+ 1 n) (+ 2 n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n n) (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes a b)
  (cond
    [(and (= a b) (even? (+ 1 a))) (timed-prime-test a)]
    [(= a b) (display " ")]
    [(even? a) (search-for-primes (+ a 1) b)]
    [else
     (timed-prime-test a)
     (search-for-primes (+ a 1) b)]))