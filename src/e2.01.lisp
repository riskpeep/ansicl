;Exercise 2.01:
;
;  Describe what happens when the following expressions are evaluated: 
;  (a) (+ (- 5 1) (+ 3 7)) 
;  (b) (list 1 (+ 2 3)) 
;  (c) (if (list p 1) (+ 12 ) (+ 3 4)) 
;  (d) (list (and (list p 3) t) (+ 1 2)) 
;
;; We can evaluate each of these expressions by inspection, and then test via
;; the REPL 
;; 
;; (a) (+ (- 5 1) (+ 3 7)) 
;;      Evaluates (- 5 1), then (+ 3 7), then inserts their results into the 
;;      expression (+ 4 10), yielding 14
(= 14 (+ (- 5 1) (+ 3 7)))

;; (b) (list 1 (+ 2 3)) 
;;      Evaluates (+ 2 3), then creates a list comprised of 1 and the result
;;      of the + expression
(equal '(1 5) (list 1 (+ 2 3)))

;; (c) (if (listp 1) (+ 12 ) (+ 3 4)) 
;;      Conditional expression, that first checks if 1 is a list.  Since 1 is
;;      not a list, it evaluates the second result form (+ 3 4) and returns its
;;      result 7.
(= 7 (if (listp 1) (+ 12) (+ 3 4)))

;; (d) (list (and (listp 3) t) (+ 1 2)) 
;;      Creates a list built from the results of an and form and a + form.
;;      The and form results in nil, and the + form results in 3, so the 
;;      created list is (nil 3)
(equal '(nil 3) (list (and (listp 3) t) (+ 1 2)))
