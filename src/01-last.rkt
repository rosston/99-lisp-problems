#lang racket

(provide 99/last)

(define (99/last a-list)
  (let ([list-rest (cdr a-list)])
    (if (empty? list-rest)
        (car a-list)
        (99/last list-rest))))
