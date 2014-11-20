;Exercise 3.07:
;
;  Modify the program in Figure 3.6 to use fewer cons cells. (Hint: Use dotted
;  lists.)

;; From the text Figure 3.6 we have the following
;; 
;; (defun compress (x)
;;   (if (consp x)
;;    (compr (car x) 1 (cdr x))
;;    x))
;;
;; (defun compr (elt n 1st)
;;   (if (null 1st)
;;     (list (n-elts elt n))
;;     (let ((next (car 1st)))
;;         (if (eql next e l t)
;;           (compr elt (+ n 1) (cdr 1st))
;;           (cons (n-elts elt n)
;;                 (compr next 1 (cdr 1st )))))))
;;
;; (defun n-elts (elt n)
;;   (if (> n 1)
;;     (list n elt)
;;     elt))
