;Exercise 3.03:
;
;  Define a function that takes a list and returns a list indicating the number
;  of times each (eql) element appears, sorted from most common element to 
;  least common:
;
;  > (occurrences '(a b a d a c d c a))
;  ((A . 4) (C . 2) (D . 2) (B . 1))

;; This function must walk the initial list and build a result set as it goes,
;; and when complete, sort based on the count in the pairs.  As given in the
;; problem, the result is an alist that stores pairs for each element. 
;; 
(defun occurrences (olist)
  (let ((result nil))
    (dolist (item olist)
      (let ((item-pair (assoc item result)))
        (if (null item-pair)
          (setf result (cons (cons item 1) result))
          (setf (cdr item-pair) (+ 1 (cdr item-pair))))))
    (sort result #'(lambda (a b) (> (cdr a) (cdr b))))))

;; Testing
(equal '((a . 4) (c . 2) (d . 2) (b . 1)) (ocurrences '(a b a d a c d c a)))

