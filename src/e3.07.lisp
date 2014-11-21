;Exercise 3.07:
;
;  Modify the program in Figure 3.6 to use fewer cons cells. (Hint: Use dotted
;  lists.)

;; From the text in Figure 3.6 we have the following
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
;;         (if (eql next elt)
;;           (compr elt (+ n 1) (cdr 1st))
;;           (cons (n-elts elt n)
;;                 (compr next 1 (cdr 1st )))))))
;;
;; (defun n-elts (elt n)
;;   (if (> n 1)
;;     (list n elt)
;;     elt))

;; When encoding a run, the function n-elts uses two cons cells because it 
;; places the run elements into a list.  Since encoding a run will always be
;; exactly two items (the number of times 'n' and the repeated element 'elt')
;; this can be made more efficient by using a single cons cell instead of a
;; list.  The change is simple as shown below

(defun n-elts (elt n)
   (if (> n 1)
     (cons n elt)  ; <- Change list to cons here.
     elt))

;; The remainder of the implementation is unchanged.
