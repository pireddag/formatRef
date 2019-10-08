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
	    exp))))

;; If the test is passed, display "test passed"
;; otherwise if the test is failed use echo_input_output to display expression, result, desired result
;; I have to define this again as a macro
;; if I try to define it as a function, exp gets passed to the echo_input_output macro
;; as the value 'exp (the input value does not get substituted for exp)
(define-syntax test-expression
  (syntax-rules ()
    ((_ comment exp res)
  (if (equal? exp res)
      "test passed"
      (begin (display "test failed")
	     (echo_input_output comment exp res))))))

