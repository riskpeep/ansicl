;Exercise 4.01:
;
;  Define a function to take a square array (an array whose dimensions are
;  (n n)) and rotate it 90° clockwise:
;
;  > (quarter-turn #2A((a b) (c d)))
;  #2A((C A) (D B))
;
;  You'll need array-dimensions (page 361).

;; The problem refers to array-dimensions as a hint.  Reviewing 
;; array-dimensions, we find that array-dimensions takes an array and returns
;; a list of integers that represent the length of each dimension in an array.
;; 
;; This problem is easier to understand if we draw it out graphically as shown
;; here:
;; 
;; Given array A, we want to create array B.
;; 
;; .-----.       .-----.
;; | A B |       | C A |
;; | C D |  ==>  | D B |
;; .-----.       .-----.
;;
;;    A             B
;;
;; We can accomplish this rotation by iterating through the source array and
;; setting the correct value in a destination array.
;;
(defun quarter-turn (src)
  (let* ((dims (array-dimensions src))
         (dst (make-array (list (cadr dims) (car dims)))))

    (do ((src-x 0 (+ 1 src-x))
         (dst-y (- (cadr dims) 1) (- 1 dst-y))) 
        ((= src-x (car dims)) dst)

        (do ((src-y 0 (+ 1 src-y))
             (dst-x 0 (+ 1 dst-x)))
          ((= src-y (cadr dims)) dst)
          (setf (aref dst dst-x dst-y) (aref src src-x src-y))))))


;; Test
(quarter-turn #2A((a b) (c d)))
;; #2A((C A) (D B))

