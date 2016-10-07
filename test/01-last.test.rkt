#lang racket
(require
 quickcheck
 rackunit
 rackunit/quickcheck
 rackunit/text-ui
 "../src/01-last.rkt")

(define matches-default-last
  (property ([my-list (choose-list (choose-integer 0 1000) 400)])
            (equal? (last my-list) (99/last my-list))))

(define 99/last-tests
  (test-suite
   "99/last"

   (test-case
       "should return single element when list has one element"
     (check-equal? (99/last '(1)) 1))
   (test-case
       "should return second element when list has two elements"
     (check-equal? (99/last '(1 2)) 2))
   (test-case
       "should return last element in long list"
     (check-equal? (99/last '(1 2 3 4 5 6 7 8 9)) 9))

   (test-case
       "should match output of default `last`"
     (check-property matches-default-last))))

(run-tests 99/last-tests)
