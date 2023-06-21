;;; Напишите процедуру, вычисляющую элементы треугольника Паскаля с
;;; помощью рекурсивного процесса.

#lang sicp
(#%require rackunit)

(define (paskal n x)
    (cond ((= x n) 1)
          ((= x 1) 1)
          (else (+ (paskal (- n 1) x) (paskal (- n 1) (- x 1))))))

(check-equal? (paskal 1 1) 1)
(check-equal? (paskal 3 2) 2)
(check-equal? (paskal 4 3) 3)
(check-equal? (paskal 5 2) 4)
(check-equal? (paskal 5 3) 6)