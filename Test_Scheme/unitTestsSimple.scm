;; Add initial and final quotes to all strings in an expression
;; This seems to work on an arbitrary expression if I quote it (it does not try to evaluate expressions even inside the recursions)
(define (addQuotesLst lst)
  (cond ((null? lst) '())
	((list? lst) (cons (addQuotesLst (car lst)) (addQuotesLst (cdr lst))))
	(else (if (string? lst)
		  (string-append "\"" lst "\"")
		  lst))))  

;; Display both the expression and its result
;; I do not understand this syntax, but it works
;; it is a macro
;; the underscore is a placeholder for the name of the macro
;; https://stackoverflow.com/questions/18005589/display-an-expression-as-a-string-in-scheme

(define-syntax echo_input_output
  (syntax-rules ()
    ((_ comment exp res)
     (begin (display "\n")
	    (display (addQuotesLst comment))
	    (display "\n")
	    (display (addQuotesLst 'exp))
	    (display "\n")
	    (display "expected result: ")
	    (display res)
	    (display "\n")
	    (display "result: ")
	    (display exp)
	    (display "\n")))))

;; If the test is passed, display "test passed"
;; otherwise if the test is failed use echo_input_output to display expression, result, desired result
;; I have to define this again as a macro
;; if I try to define it as a function, exp gets passed to the echo_input_output macro
;; as the value 'exp (the input value does not get substituted for exp)
;; I do not understand how Scheme macros work
(define-syntax test-expression
  (syntax-rules ()
    ((_ comment exp res)
  (if (equal? exp res)
      "test passed"
      (begin (display "test failed")
	     (echo_input_output comment exp res))))))

;; For work with mutable data
;; - Set the format list to a fixed value
;; - Apply the test
;; - Reset the format list to the initial value
;; This too needs to be defined as a macro as well; if I define it as a function then
;; (display 'exp) gives 'exp, that is the input value of exp does not get substituted for the expression exp

;; The following definition does not work
;; (define (test-expression/md comment exp res)
;;   (begin (set! formatList (list (list "eq:" "Equation") (list "fig:" "Figure") (list "tab:" "Table")))
;; 	 (test-expression comment exp res)
;; 	 (set! formatList (list (list "eq:" "Equation") (list "fig:" "Figure") (list "tab:" "Table")))))

;; 
(define-syntax test-expression/md
  (syntax-rules ()
    ((_ comment exp res)
     (begin (set! formatList (list (list "eq:" "Equation") (list "fig:" "Figure") (list "tab:" "Table")))
	    (test-expression comment exp res)
	    (set! formatList (list (list "eq:" "Equation") (list "fig:" "Figure") (list "tab:" "Table")))))))

