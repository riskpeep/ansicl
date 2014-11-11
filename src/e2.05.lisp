;Exercise 2.05:
;
;  What do these functions do?
;  
;  (a) (defun enigma (x)
;        (and (not (null x))
;             (or (null (car x))
;                 (enigma (cdr x)))))
;  (b) (defun mystery (x y)
;        (if (null y)
;          nil
;          (if (eql (car y) x)
;            0
;            (let ((z (mystery x (cdr y))))
;              (and z (+ z 1))))))

;; We can evaluate these methods first by inspection, and them empirically by 
;; testing an implementation
;;
;; Enigma
;; Enigma iterates through a passed list and returns T if the passed list 
;; contains nil.  If the list does not contain nil, enigma returns nil.  If the
;; passed parameter is not a list, the function will error.
;; 
;; To test, first we define enigma
(defun enigma (x)
  (and (not (null x))
       (or (null (car x))
           (enigma (cdr x)))))

;; Next we provide some test cases
;; List contains nil, should return true
(eql t (enigma (list '1 nil '3)))

;; List does not contain nil, should return false
(eql nil (enigma (list '1 '2 '3)))

;; Mystery
;; Mystery returns the element number of the first occurrence of x in list y.
;; If y does not contain x, then mystery returns nil.  If y is not a list, 
;; then mystery will error.
;; 
;; To test, we define mystery
(defun mystery (x y)
  (if (null y)
    nil
    (if (eql (car y) x)
      0
      (let ((z (mystery x (cdr y))))
        (and z (+ z 1))))))

;; Next we provide some test cases
;; Should return 2, since 2 and 3 occur before 4
(= 2 (mystery 4 (list '2 '3 '4 '5 '6 '7 '4 '3 '2 '1)))
;; Should return 0 since 4 is the first element and there are not elements
;; before it
(= 0 (mystery 4 (list '4 '2 '3 '4 '5 '6 '7 '4 '3 '2 '1)))
;; Should return nil since there are 4 does not appear in the list
(eql nil (mystery 4 (list '2 '3 '5 '6 '7 '3 '2 '1)))


