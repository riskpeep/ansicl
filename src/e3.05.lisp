;Exercise 3.05:
;
;  Suppose the function pos+ takes a list and returns a list of each element
;  plus its position:
;  > (pos+ ' ( 7 5 1 4 ) )
;  (7 6 3 7)
;  
;  Define this function using (a) recursion, (b) iteration, (c) mapcar.

;;
;; Using recursion, we proceed as follows
;;
(defun pos+-recur-helper (list1 pos)
  (if (null list1)
    nil
    (cons (+ pos (car list1)) 
          (pos+-recur-helper (cdr list1) 
                       (+ 1 pos)))))
 
(defun pos+-recur (list1)
  (pos+-recur-helper list1 0))

;; Test
(equal '(7 6 3 7) (pos+-recur '(7 5 1 4)))

;;
;; Using iteration, we proceed as follows
;;
(defun pos+-iter (list1)
  (let ((pos 0)
        (result nil))
    (dolist (item list1)
      (setf result (cons (+ item pos) result))
      (setf pos (+ pos 1)))
    (reverse result)))

;; Test
(equal '(7 6 3 7) (pos+-iter '(7 5 1 4)))

;;
;; Using mapcar, we proceed as follows
;;
(defun pos+-mapcar (list1)
  (let ((pos -1))
    (mapcar #'(lambda (x)
                (setf pos (+ 1 pos))
                (+ x pos))
            list1)))

;; Test
(equal '(7 6 3 7) (pos+-mapcar '(7 5 1 4)))
