;Exercise 2.04:
;
;  Define a function that takes two arguments and returns the greater of the
;  two.

;; Our solution
(defun our-gt (a b)
  (if (> a b)
    a
    b))

;; And to test
(= 2 (our-gt 1 2))

