#lang racket
(require
 quickcheck
 rackunit
 rackunit/quickcheck
 rackunit/text-ui
 "../src/02-but-last.rkt")

(define matches-reverse-take-2-reverse
  (property ([my-list (choose-list (choose-integer 0 1000) 400)])
            (equal? (reverse (take (reverse my-list) 2)) (99/but-last my-list))))

(define 99/but-last-tests
  (test-suite
   "99/but-last"

   (test-case
       "should return only two elements when list has two elements"
     (check-equal? (99/but-last '(1 2)) '(1 2)))
   (test-case
       "should return last two elements when list has three elements"
     (check-equal? (99/but-last '(1 2 3)) '(2 3)))
   (test-case
       "should return last two elements in long list"
     (check-equal? (99/but-last '(1 2 3 4 5 6 7 8 9 10 11 12 13 14)) '(13 14)))

   (test-case
       "should match output of (reverse (take (reverse lst) 2))"
     (check-property matches-reverse-take-2-reverse))))

(run-tests 99/but-last-tests)
