;;; Используя результаты упражнений 1.16 и 1.17, разработайте процедуру, которая порождает
;;; итеративный процесс для умножения двух чисел с помощью сложения, удвоения и деления
;;; пополам, и затрачивает логарифмическое число шагов.

#lang sicp
(#%require rackunit)
(define (double a) (+ a a))
(define (halve a) (/ a 2))
(define (even? n) (= 0 (remainder n 2)))

(define (mul a b) (mul-iter a b 0))

(define (mul-iter a b c) 
        (cond ((= b 1) (+ a c))
              ((and (even? a) (even? b)) (mul-iter (double a) (halve b) c))
              ((even? a) (mul-iter (double a) (halve (- b 1)) (+ c a)))
              ((even? b) (mul-iter b a c))
              (else (mul-iter (double a) (halve (- b 1)) (+ c a)))))

(check-equal? (mul 1 1) 1)
(check-equal? (mul 40 30) (* 40 30))
(check-equal? (mul 5 0) 0)
(check-equal? (mul 5 15) (* 5 15))