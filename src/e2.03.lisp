;Exercise 2.03:
;
;  Using car and cdr, define a function to return the fourth element of a list.

;; We assume the function takes one parameter, a list, and returns the fourth 
;; element
(defun our-fourth (thelist)
  (car (cdr (cdr (cdr thelist)))))

;; And to test
(= 4 (our-fourth (list 1 2 3 4 5)))
