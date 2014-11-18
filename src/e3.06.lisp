;Exercise 3.06:
;
;  After years of deliberation, a government commission has decided that
;  lists should be represented by using the cdr to point to the first element
;  and the car to point to the rest of the list. Define the government
;  versions of the following functions:
;
;  (a) cons
;  (b) list
;  (c) length (for lists)
;  (d) member (for lists; no keywords)

;; The challenge here is to basically have lists work backwards.  That is to
;; say that in a properly formed list, the cdr should hold the element, and the
;; car should point to the next element or nil.
;; 
;; We can implement this regime by implementing a news cons (gov-cons) that
;; creates list in this backwards manner, and then by re-implementing the other
;; methods (list, length, and member), to use the new method in their 
;; implementations.
;;
;; We begin with cons.  For cons, we need to reverse the passed parameters so 
;; the original car becomes the cdr and the original cdr becomes the car.
(defun gov-cons (new-car new-cdr)
  (cons new-cdr new-car))

;; Lists are implemented as a chain of cons cells, so we need to re-implement
;; list to chain cons cells backwards using our gov-cons.
;; NOTE: The CL implementation of list uses an &rest parameter.  &rest has not
;; been introduced yet, so it is clear the author intends that some other,
;; perhaps simpler implementation, is used.  We are not sure what that
;; implementation is, however.  So we will use &rest in our implementation even
;; though it has not yet been introduced in the text.
(defun gov-list (&rest items)
  (let ((result nil))
    (dolist (item (reverse items) result)
      (setf result (gov-cons item result)))))

