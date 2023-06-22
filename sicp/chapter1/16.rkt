;;; Напишите процедуру, которая развивается в виде итеративного процесса и реализует возведе-
;;; ние в степень за логарифмическое число шагов, как fast-expt.

#lang sicp
(#%require rackunit)

(define (square n) (* n n))
(define (even? n) (= 0 (remainder n 2)))

;;; (define (expt n b) 
;;;         (cond ((= b 0) 1)
;;;               ((even? b) (square (expt n (/ b 2))))
;;;               (else (* n (expt n (- b 1))))))

(define (solution b n) (expt-iter b n 1))

(define (expt-iter b n a)
        (cond ((= n 0) a)
              ((even? n) (expt-iter (square b) (/ n 2) a))
                (else (expt-iter b (- n 1) (* a b)))))

(check-equal? (solution 10 0) 1)
(check-equal? (solution 3 20) (expt 3 20))
(check-equal? (solution 2 10) (expt 2 10))
(check-equal? (solution 0 5) 0)