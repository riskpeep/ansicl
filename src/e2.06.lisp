;Exercise 2.06:
;
;  What could occur in place of the x in each of the following exchanges?
;
;  (a) > (car (x (cdr '(a (b c) d))))
;      B
;  (b) > (x 13 (/ 1 0))
;      13
;  (c) > (x #'list 1 n i l)
;      (1)

;; We evaluate each of these in turn.
;;
;; ;  (a) > (car (x (cdr '(a (b c) d))))
;; ;      B
;; (cdr '(a (b c) d)) is ((b c) d).  Since we want B and the first element of
;; the result is (b c), x is car.
(eql 'b (car (car (cdr '(a (b c) d)))))

;; ;  (b) > (x 13 (/ 1 0))
;; ;      13
;; The form (/ 1 0) is division by zero, so must not be evaluated.  We know
;; that the operators AND and OR will stop evaluation as soon as their result
;; can be confirmed.  Since we want 13, and 13 can be considered as T, we can
;; use OR.  So x is OR.
(= 13 (or 13 (/ 1 0)))

;; ;  (c) > (x #'list 1 nil)
;; ;      (1)
;; #' is the function named by the symbol.  Since the result we want is a list
;; (1), we want to apply the list function to the passed parameters.  x is 
;; apply.
(equal '(1) (apply #'list 1 nil))

