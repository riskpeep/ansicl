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
