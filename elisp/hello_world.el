;;
;; "Hello Lisp!" by github.com@sotaro-ac
;;

" [Tips]:
- The area from multiple ';' to the end-of-line is the one-line comment.
- The area between of two double-quotes '\"...\"' is the multiple-line comment (Just like here).
- The comment of ';; =>' is required by lispxmp to output the evaluation of precending formula.
"

;; Define function "hello-world"
(defun hello-world()
  (interactive)
  (message "Hello World!")
  )

;; TODO: Execute command 'C-x C-e' on the end of the above line to evaluate precending formula.
;; => hello-world


;; Call "hello-world" function
(hello-world)

;; TODO: Evaluate the above formula.
;; => "Hello World!"

