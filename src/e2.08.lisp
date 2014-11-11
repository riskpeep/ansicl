;Exercise 2.08:
;
;  Give iterative and recursive definitions of a function that
;
;  (a) takes a positive integer and prints that many dots.
;
;  (b) takes a list and returns the number of times the symbol a occurs in it.

;; ;  (a) takes a positive integer and prints that many dots.
;; 
;; For the first method, iterative, we can use a simple do loop
(defun print-dots (numdots)
  (do ((i 0 (+ i 1)))
    ((= i numdots))
    (format t ".")))

;; Testing
(print-dots 5)
(print-dots 4)

;; For the recursive solution we decrement the passed value until done
(defun print-dots-recur (numdots)
  (if (< numdots 0)
    nil
    (progn
      (format t ".")
      (print-dots (- numdots 1)))))

;; Testing
(print-dots-recur 5)
(print-dots-recur 4)

;; ;  (b) takes a list and returns the number of times the symbol a occurs in it.
;; 
;; For the iterative solution, we use dolist 
(defun num-times (list)
  (let ((count 0))
    (dolist (item list count)
      (if (eql 'a item)
        (setf count (+ count 1))))))

;; Testing
(= 2 (num-times (list 'a 'b 'c 'a)))
(= 0 (num-times (list 'b 'c )))

;; The recursive solution
(defun num-times-recur (list)
  (if (null list)
    0
    (if (eql 'a (car list))
      (+ 1 (num-times-recur (cdr list)))
      (num-times-recur (cdr list)))))

;; Testing
(= 2 (num-times-recur (list 'a 'b 'c 'a)))
(= 0 (num-times-recur (list 'b 'c )))
