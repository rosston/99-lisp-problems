#lang racket
(require
 quickcheck
 rackunit
 rackunit/quickcheck
 rackunit/text-ui
 "../src/04-length.rkt")

(define matches-length
  (property ([my-list (choose-list (choose-integer 0 1000) 400)])
            (equal? (length my-list) (99/length my-list))))

(define 99/length-tests
  (test-suite
   "99/length"

   (test-case
       "should return 0 when an empty list is provided"
     (check-equal? (99/length '()) 0))
   (test-case
       "should return 1 when a list of length 1 is provided"
     (check-equal? (99/length '("foo")) 1))
   (test-case
       "should return 2 when a list of length 2 is provided"
     (check-equal? (99/length '("foo" "bar")) 2))
   (test-case
       "should return 9 when a list of length 9 is provided"
     (check-equal? (99/length '(1 2 3 4 5 6 7 8 9)) 9))

   (test-case
       "should match output of (length lst)"
     (check-property matches-length))))

(run-tests 99/length-tests)
