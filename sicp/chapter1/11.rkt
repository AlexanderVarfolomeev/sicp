;;; Функция f определяется правилом: f (n) = n, если n < 3, и f (n) = f (n − 1) + f (n − 2) +
;;; f (n − 3), если n ≥ 3. Напишите процедуру, вычисляющую f с помощью рекурсивного процесса.
;;; Напишите процедуру, вычисляющую f с помощью итеративного процесса.

#lang sicp
(#%require rackunit)

(define (f n) 
    (if (< n 3) n
        (+ (f (- n 1)) (f (- n 2)) (f (- n 3))) 
        ))

(define (f2 n)
    (f-iter 2 1 0 n))

(define (f-iter a b c count)
    (if (= count 0)
        c
        (f-iter (+ a b c) a b (- count 1))))

(check-equal? (f 4) 6)
(check-equal? (f 3) 3)
(check-equal? (f 1) 1)
(check-equal? (f2 4) 6)
(check-equal? (f2 3) 3)
(check-equal? (f2 1) 1)