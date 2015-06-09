#! /usr/local/bin/racket

#lang racket/base

; z_score = 2 ~ 95% confidence interval or two standard deviations
; p +- f(p, n, z)
; f(p, n, z) = z * sqrt(p*(1-p)/n)
;
; coin flip p=0.5, n=100, z=2: [0.4,0.6] 95%
; coin flip p=0.5, n=40, z=2: [0.35,0.65] 95%

(define (f p n z)
  (* z (sqrt (/ (* p (- 1 p)) n))))

(define (format-round n)
  (number->string (inexact->exact (round n))))
 
(define (roughly p n)
  (printf
    (string-append
      "Around "
      (format-round (* n p))
      " ~~ ["
        (format-round (* (- p (f p n 2)) n))
      ", "
        (format-round (* (+ p (f p n 2)) n))
      "]\n")))
     ; with probability "
     ; (number->string (inexact->exact (* 100 p)))
     ; "% and "
     ; (number->string n)
     ; " trials.\n"

(define args (current-command-line-arguments))
(define p (string->number (vector-ref args 0)))
(define n (string->number (vector-ref args 1)))

(roughly p n)
