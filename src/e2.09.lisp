;Exercise e2.09:
;
;  A friend is trying to write a function that returns the sum of all the
;  non-nil elements in a list. He has written two versions of this function,
;  and neither of them work. Explain what's wrong with each, and give a
;  correct version:
;  
;  (a) (defun summit (1st)
;        (remove nil 1st)
;        (apply #'+ 1st))
;
;  (b) (defun summit (1st)
;        (let ((x (car 1st)))
;          (if (null x)
;            (summit (cdr 1st))
;            (+ x (summit (cdr 1st))))))

;; First we evaluate the two incorrect implementations in turn.
;; ;  (a) (defun summit (1st)
;; ;        (remove nil 1st)
;; ;        (apply #'+ 1st))
;;
;; The issue with this implementation occurs on the second line.  The function 
;; remove returns a new list with the elements removed.  It does not change 
;; the passed list.  So the list that gets sent to the apply function is the
;; original list passed into the function.
;; 
;; ;  (b) (defun summit (1st)
;; ;        (let ((x (car 1st)))
;; ;          (if (null x)
;; ;            (summit (cdr 1st))
;; ;            (+ x (summit (cdr 1st))))))
;;
;; This method will never terminate.  Since nil is returned as the cdr of the 
;; empty list, after iterating through all the elements correctly, the function
;; will get stuck in an infinite chain of recursive calls until the stack is full
;; 
;; Next we present two different correct implementations based on the erroneous
;; implementations above

(defun summit (1st)
  (apply #'+ (remove nil 1st)))

(defun summit2 (1st)
  (if (null 1st)
    0
    (let ((x (car 1st)))
      (if (null x)
        (summit2 (cdr 1st))
        (+ x (summit2 (cdr 1st)))))))

;; Testing
(= 6 (summit (list '1 nil '2 '3)))
(= 6 (summit2 (list '1 nil '2 '3)))

