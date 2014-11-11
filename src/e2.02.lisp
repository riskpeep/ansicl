;Exercise 2.02:
;
;  Give three distinct cons expressions that return (a b c).
;
;; 1.
(equal '(a b c) (cons 'a (cons 'b (cons 'c nil))))

;; 2.
(equal '(a b c) (cons 'a (cons 'b (list 'c))))

;; 3.
(equal '(a b c) (cons 'a (list 'b 'c)))


