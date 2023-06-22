;;; Предположим те-
;;; перь, что, наряду со сложением, у нас есть операции double, которая удваивает целое число,
;;; и halve, которая делит (четное) число на 2. Используя их, напишите процедуру, аналогичную
;;; fast-expt, которая затрачивает логарифмическое число шагов.
#lang sicp
(#%require rackunit)

(define (double a) (+ a a))
(define (halve a) (/ a 2))
(define (even? n) (= 0 (remainder n 2)))

(define (fast-mul a b) 
        (cond   ((= 1 b) a)
                ( (and (even? a) (even? b)) (fast-mul (double a) (halve b)))
                ( (even? b) (fast-mul b a) )
                (else (+ a (fast-mul (double a) (halve (- b 1)))))))

(check-equal? (fast-mul 1 1) 1)
(check-equal? (fast-mul 40 30) (* 40 30))
(check-equal? (fast-mul 5 0) 0)
(check-equal? (fast-mul 5 15) (* 5 15))