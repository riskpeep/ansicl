;Exercise e3.04.lisp
;
;  Why does (member '(a) '((a) (b))) return nil? 

;; This form returns nil because the default test (eql) for member returns nil
;; if the two items are not identical.  Since '(a) is not the exact same list
;; as the one in '((a) (b)), member returns nil.
;; 
;; This can be fixed by using equal as the test in member as shown below
(equal '((a) (b)) (member '(a) '((a) (b)) :test #'equal))
