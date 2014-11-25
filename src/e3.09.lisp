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

;; We begin by reviewing the functions given in the problem.
;; 
;; The first function (a) attempts the sum by first removing all nils from
;; the given list and then applying the plus function to the remainder.  The
;; problem with this function is that it doesn't check for non-numbers in the
;; list.  The letter A is a perfectly valid list member, but will cause plus
;; to error because it is not of type number.  A correct implementation will
;; use numberp to remove all non-number types from the list.
;; 
;; A second issue with the function (a) is that the remove line doesn't
;; actually change the value of 1st.  remove returns a new list that has the
;; passed values removed.  Since this returned value doesn't get assigned to
;; anything, it is lost.  The result is that the apply function works on the
;; originally passed list, not the list that has had nil removed.
;;
;; A corrected implementation is shown below.
;; 
(defun summit-a (1st)
  (apply #'+
         (remove-if (lambda (x) (not (numberp x))) 1st)))

;; Test
(= 6 (summit-a '(1 3 2)))

(= 6 (summit-a '(1 3 2 a b c)))

(= 6 (summit-a '(1 3 2 a b c (list d e))))

;  (b) (defun summit (1st)
;        (let ((x (car 1st)))
;          (if (null x)
;            (summit (cdr 1st))
;            (+ x (summit (cdr 1st))))))

;; Proceeding to (b) we find the following problems.
;; 
;; Function (b) suffers from the same non-number problem as (a) in that it
;; fails to check for non-numbers in the passed list.  In addition, the if test
;; is malformed.  As it is currently written the method never terminates.  The
;; method needs a check to see if the cdr value is a cons cell and to return 
;; properly if not.
;; 
;; A corrected implementation is shown below.
(defun summit-b (1st)
  (let ((x (if (numberp (car 1st))
             (car 1st)
             0)))
    (if (consp (cdr 1st))
      (+ x (summit-b (cdr 1st)))
      x)))

;; Test
(= 6 (summit-b '(1 3 2)))

(= 6 (summit-b '(1 3 2 a b c)))

(= 6 (summit-b '(1 3 2 a b c (list d e))))
