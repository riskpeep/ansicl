;Exercise 4.01:
;
;  Read the description of reduce on page 368, then use it to define:
;  (a) copy-list
;  (b) reverse (for lists)

;; From the text (p. 368), we have the following:
;;
;; (reduce function proseq &key key from-end start end initial-value) Function
;;      If the function is f and the elements of proseq are a, b, c, then the 
;;      behavior of reduce is indicated by the following table:
;;
;;        --------------------------------------------------------------------
;;        |  from-end  |  initial-value  |          EQUIVALENT TO            |
;;        |  false     |  no             |  (f (f a b) c)                    |
;;        |  false     |  yes            |  (f (f (f initial-value a) b) c)  |
;;        |  true      |  no             |  (f a (f b c))                    |
;;        |  true      |  yes            |  (f a (f b (f c initial-value)))  |
;;        --------------------------------------------------------------------
;;
;;      If proseq contains just one element and no initial-value is provided, 
;;      that element is returned. If proseq is empty and an initial-value is 
;;      provided, it is returned, but if no initial-value is provided, the 
;;      return value is the result of calling function with no arguments. If 
;;      both key and initial-value are provided, the former is not called on 
;;      the latter.
