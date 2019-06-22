



					; An and function that can be applied to lists (using the Scheme function apply).
					; It returns #t if all elements of the list are #t.
					; Copied from a Stackexchange question.
(define and-list (lambda x
                    (if (null? x)
                        #t
                        (if (car x) (apply and-list (cdr x)) #f))))




					;
					;
					;====================
					; Check that a format list is syntactically correct

					; Checks that a single format formatGroup is a list of two elements (to do: must issue error).
(define (checkGroup formatGroup)
  (cond
     ((not (list? formatGroup)) #f)
      ((not (= (length formatGroup) 2)) #f)
      (else #t)))

; Checks that all elements of formatGroup are strings (to do: must issue error).
(define (checkFormatStrings formatGroup)
(apply and-list (map string? formatGroup)))

; Checks that the format is syntactically correct: it must be a list of two elements, each of which is a string.
(define (checkFormatGroup formatGroup)
  (and (checkGroup formatGroup)
       (checkFormatStrings formatGroup)))

	;
					;
					;====================
					; Check whether a format is present in the list

					; Compare two formats (different from the “matching” function because it compares the lists that define formats)

(define (checkFormatEqual formatGroup1 formatGroup2)
   (equal? (car formatGroup1) (car formatGroup2)))

					; Check that a format is present in the global variable formatList using checkFormatEqual and the find function of Scheme.

(define (checkFormatPresent formatGroup)
  (not
   (equal?
    (filter (lambda (x) (checkFormatEqual formatGroup x)) formatList)
    (list))))


					; ==================
					;
					; Adding a format to the list

					;Check on input:
					;•  The format is a list of two elements
					;•  The format list consists of strings
					;•  The format is not already present


(define (checkFormatGroupAdd formatGroup)
   (cond
      ((not (checkGroup formatGroup)) (begin (display "Format must be a list of two elements") #f))
       ((not (checkFormatStrings formatGroup)) (begin (display "Format must be a list of two strings") #f))
        ((checkFormatPresent formatGroup) (begin (display "Format is already present, use replaceFormatGroup to replace") #f))
         (else #t)))

(tm-define (addToFormatList formatGroup)
  (if (checkFormatGroupAdd formatGroup)
      (set! formatList (append formatList (list formatGroup)))
      (display "\nincorrect application of addToFormatList")))



					;
					;====================
					;Deleting a format from the list

					; Delete the n-th element of a list for which the predicate cd (for condition) is true.
(define (delete-nth-cond cd lst n)
   (cond ((null? lst) '()) ; base case
         ((cd (car lst)) (cond ((= n 1) (cdr lst)); if n = 1 return the cdr, otherwise we call it again with n-1
                                (else (cons (car lst)
                                            (delete-nth-cond cd (cdr lst) (+ -1 n))))))
         (else (cons (car lst) ; if the condition is not satisfied retain the last element
                             ; and apply the function to the rest of the list
                      (delete-nth-cond cd (cdr lst) n)))))


					; Delete the n-th occurrence of a format from the list

(define (deleteFromFormatList formatGroup n)
  (set! formatList
        (delete-nth-cond
          (lambda (x) (checkFormatEqual formatGroup x)) formatList n)))




					;
					;====================


					; Replace the n-th element of a list for which the predicate test (for condition) is true.
					; Replace the n-th element of a list that satisfied test
  (define (replace-nth-ElementCond lst test to n)
   (cond ((null? lst) '()) ; base case = end of input - issue warning here?
          ((test (car lst)) (if (= n 1) (cons to (cdr lst))
                                 (cons (car lst)
                                       (replace-nth-ElementCond (cdr lst) test to (+ n -1)))))
                  (else (cons (car lst)
                               (replace-nth-ElementCond (cdr lst) test to n)))))


					; Replace the n-th occurrence of a format in the list
					; Uses ideas from a Stackexchange question. Checks that there are at least n elements of the format list that match formatGroup.

(define (replaceFormatCore formatGroup n)
  (let ((condition (lambda (x) (checkFormatEqual formatGroup x))))
     (let ((lengthFts  (length (filter condition formatList))))
       (if (>= (length (filter condition formatList)) n)
            (set! formatList (replace-nth-ElementCond formatList condition formatGroup n))
             (begin (display "Format list contains only ")
                     (display lengthFts)
                       (display " formats corresponding to the input"))))))


					; Checks that formatGroup is sintactically correct, then replaces the n-th format whose format code matches.

(define (replaceFormat formatGroup n)
  (if (checkFormatGroup formatGroup)
       (replaceFormatCore formatGroup n)
        (display "did not execute replacement function")))









