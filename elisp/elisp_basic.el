;;
;; Hello Emacs Lisp!
;;

(car '(1 2 3 4))                        ; => 1

(cdr '(1 2 3 4))                        ; => (2 3 4)

(cons '(1 2 3 4) '(5 6 7 8))            ; => ((1 2 3 4) 5 6 7 8)

;; (cons 1 2 3 4 '(5 6 7 8))            ; => Error!

(length '())                            ; 0

(atom nil)                              ;t

(defun factorial (n)
  (cond
   ((= n 0) 1)
   (t (* n (factorial (- n 1))))))      ; => factorial

(factorial 5)                           ; => 120

(defun nth (n list)
  (car (nthcdr n list)))                ; => nth

(nth 0 '(1 2 3))                        ; => 1

(defun first (list)
  (car list))                           ; => first

(first '(1 2 3))                        ; => 1
