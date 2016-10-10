#lang racket
(require
 quickcheck
 rackunit
 rackunit/quickcheck
 rackunit/text-ui
 "../src/03-nth.rkt")

(define matches-first-list-tail
  (property ([my-list (choose-list (choose-integer 0 1000) 400)])
            (equal? (first (list-tail my-list 299)) (99/nth my-list 300))))

(define 99/nth-tests
  (test-suite
   "99/nth"

   (test-case
       "should return first element when 1 is provided"
     (check-equal? (99/nth '("foo" "bar" "baz") 1) "foo"))
   (test-case
       "should return second element when 2 is provided"
     (check-equal? (99/nth '("foo" "bar" "baz") 2) "bar"))
   (test-case
       "should return nth element when n is provided"
     (check-equal? (99/nth '("foo" "bar" "baz" "qux" "norf") 5) "norf"))

   (test-case
       "should match output of (first (list-tail lst (- n 1)))"
     (check-property matches-first-list-tail))))

(run-tests 99/nth-tests)
