;Exercise 3.02:
;
;  Write a version of union that preserves the order of the elements in the 
;  original lists:
;
;  > (new-union '(a b c) '(b a d))
;  (A B C D)

;; We begin by reviewing the CL implementation of union.  It may not preserve
;; the order of the original lists.
;;
;; > (union '(a b c) '(b a d))
;; (C B A D)
;; 
;; Our implementation must do so.  We can accomplish this with dolist and 
;; adjoin
(defun new-union (list1 list2)
  (let ((result list1))
    (dolist (item list2)
      (setf result (reverse (adjoin item (reverse list1)))))
    result))

;; Note, this doesn't feel very 'lispy', ideally we wouldn't use let or setf

;; Testing
(equal '(a b c d) (new-union '(a b c) '(b a d)))
