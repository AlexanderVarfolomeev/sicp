#lang sicp
(#%require rackunit)

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b) 0 (+ (term a) (sum term (next a) next b))))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b) dx))

(define (even? a)
  (= 0 (remainder a 2)))

(define (calc-h a b n)
  (/ (- b a) n))

(define (calc-y term a k h)
  (term (+ a (* k h))))

(define (simpson term a k h n)
  (cond
    [(or (= n k) (= 0 k)) (calc-y term a k h)]
    [(even? k) (* 2 (calc-y term a k h))]
    [else (* 4 (calc-y term a k h))]))

(define (integral-simpson term a b n)
  (integral-simpson-k term a b n 0))

(define (integral-simpson-k term a b n k)
  (define (simpson-term num)
    (simpson term a num (calc-h a b n) n))
  (define (next num)
    (+ 1 num))
  (* (/ (calc-h a b n) 3) (sum simpson-term k next n)))
