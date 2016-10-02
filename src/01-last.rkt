#lang racket

(provide my-last)

(define (my-last a-list)
  (let ([list-rest (cdr a-list)])
    (if (empty? list-rest)
        (car a-list)
        (my-last list-rest))))
