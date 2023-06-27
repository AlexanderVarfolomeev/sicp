#lang sicp
(#%require rackunit)

 (define (same-parity first . others)
   (define (same-parity? x) (= (remainder first 2) (remainder x 2)))
    (define (same-parity-inner others)
        (cond   
            ((null? others) nil)
            ((same-parity? (car others)) (cons (car others) (same-parity-inner (cdr others))))
            (else (same-parity-inner (cdr others)))))
    (cons first (same-parity-inner others)))




;;; (define (same-parity first . others)
;;;   (define (inner first others)
;;;     (if (null? others)
;;;       nil
;;;       (if (same-parity? first (car others))
;;;           (cons (car others) (inner first (cdr others)))
;;;           (inner first (cdr others)))))
;;;    (cons first (inner first others)))