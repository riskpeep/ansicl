;Exercise 3.09:
;
;  Write a program to find the longest finite path through a network 
;  represented as in Section 3.15. The network may contain cycles.

;; From the text, we have the shortest path algorithm as shown below
;;
;; (defun shortest-path (start end net)
;;   (bfs end (list (list start)) net))
;;
;; (defun bfs (end queue net)
;;   (if (null queue)
;;     nil
;;     (let ((path (car queue)))
;;       (let ((node (car path)))
;;         (if (eql node end)
;;           (reverse path)
;;           (bfs end
;;                (append (cdr queue)
;;                        (new-paths path node net))
;;                net))))))
;;
;; (defun new-paths (path node net)
;;   (mapcar #'(lambda (n)
;;               (cons n path))
;;           (cdr (assoc node net))))
;;
;;

;; We begin solution by making some observations.  First, in order to find the
;; longest path, we'll need to make an exhaustive search of the network.  This
;; differs from the current solution since the bfs method terminates as soon
;; as it identifies a path.  We can modify the existing bfs method to do this
;; search if we remove the existing termination condition, and replace it with
;; a new condition that terminates when there are no more paths to explore.
;; 
;; Second, if we do an exhastive search, it is likely that we'll identify
;; multiple paths to the network.  When we find a solution path, then, we must
;; check to see if it is longer than any previously identified solution.  If
;; so, then we replace any previous path with the new one.  In our solution,
;; we'll create a path variable that we update during the search and that is
;; returned on completion.
;;
;; Thrid, the exhaustive search must account for the existence of cycles.  We
;; can detect a cycle by checking if the next added node on a path currently
;; exists in the path.  If it does, we've identified a cycle.
;; 
;;
;; Given these observations, we can begin our solution.

;; First we define a high level function to kick off the search.  Note that
;; we refer to a modified bfs function 'bfse' to indicate that it is an
;; exhaustive search
(defun longest-path (start end net)
   (bfse end (list (list start)) net))

;; Next we write our modified bfse function
(defun bfse (end queue net)
  (let ((longest-path nil))
    (if (null queue)
      ;; We're at the end, return the best-path
      longest-path

      ;; Still more to search
      (let ((path (car queue)))
        (let ((node (car path)))
          ;; Have we found a solution?
          (if (eql node end)
            ;; Yes, lets see if it is better than the current solution
            (if (> (length path) (length longest-path))
              ;; It is better, update the best-path and continue the search
              (progn
                (setf longest-path (reverse path))
                (bfse end (cdr queue) net)))  ; We don't need to search on the 
                                             ; current path anymore, so don't
                                             ; worry about appending new paths
                                             ; here
            ;; No, continue the search
            (bfse end
                 (append (cdr queue)
                         (new-paths path node net))  ; Add new paths from the
                                                     ; current node to the 
                                                     ; search space
                 net)))))))

;; Finally we define the new-paths function
(defun new-paths (path node net)
  (mapcar #'(lambda (n)
              ;; Add paths, but only if the node isn't currently in the path
              ;; (this is to prevent adding cycles)
              (if (not (member node n))
                (cons n path)))
          (cdr (assoc node net))))

;; Now we test

