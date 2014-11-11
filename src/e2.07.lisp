;Exercise 2.07:
;
;  Using only operators introduced in this chapter, define a function that 
;  takes a list as an argument and returns true if one of its elements is a
;  list.

;; We can implement this method using a listp and a recursive method
(defun contains-list (x)
  (if (null x)
    nil
    (if (listp (car x))
      T
      (contains-list (cdr x)))))

;; Testing
(eql nil (contains-list (list '1 '2 '3)))

(eql T (contains-list (list 1 '2 (list '3 '4))))

