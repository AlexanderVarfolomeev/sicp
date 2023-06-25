#lang sicp
(#%require rackunit)

(define (make-segment x y) (cons x y))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define (make-rectangle p w h) (cons p (cons w h)))
(define (perimeter rect) (* 2 (+ (car (cdr rect)) (cdr (cdr rect)))))
(define (area rect)  (* (car (cdr rect)) (cdr (cdr rect))))