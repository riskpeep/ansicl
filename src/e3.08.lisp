;Exercise e3.08:
;
;  Define a function that takes a list and prints it in dot notation:
;
;  > (showdots '(a b c))
;  (A . (B . (C . NIL)))
;  NIL

;; We can implement this method using a recursive function and the format
;; function
(defun showdots (lst)
  (if (consp lst)
    (progn
      (if (consp (car lst))
        (progn 
          (format t "(") 
          (showdots (car lst))
          (format t " . "))
        (format t "(~A . " (car lst)))
      (showdots (cdr lst))
      (format t ")"))
    (format t "NIL")))

;; Testing
;; Prints "(A . (B . (C . NIL)))"
(showdots '(a b c))

;; Prints "(A . (B . ((C . (D . NIL)) . (E . NIL)))"
(showdots '(a b (c d) e))

