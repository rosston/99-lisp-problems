#lang racket
(require
 quickcheck
 rackunit
 rackunit/quickcheck
 rackunit/text-ui
 "../src/01-last.rkt")

(define matches-default-last
  (property ([my-list (choose-list (choose-integer 0 1000) 400)])
            (equal? (last my-list) (my-last my-list))))

(define my-last-tests
  (test-suite
   "my-last"

   (test-case
       "should return single element when list has one element"
     (check-equal? 1 (my-last '(1))))
   (test-case
       "should return second element when list has two elements"
     (check-equal? 2 (my-last '(1 2))))
   (test-case
       "should return last element in long list"
     (check-equal? 9 (my-last '(1 2 3 4 5 6 7 8 9))))

   (check-property matches-default-last)))

(run-tests my-last-tests)
