;Exercise 3.09:
;
;  A friend is trying to write a function that returns the sum of all the 
;  non-nil elements in a list. He has written two versions of this function,
;  and neither of them work. Explain what's wrong with each, and give a correct
;  version:
;
;  (a) (defun summit (1st)
;        (remove nil 1st)
;        (apply #' + 1st))
;
;  (b) (defun summit (1st)
;        (let ((x (car 1st)))
;          (if (null x)
;            (summit (cdr 1st))
;            (+ x (summit (cdr 1st))))))
