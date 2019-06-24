

					;https://stackoverflow.com/questions/30071930/any-idea-of-how-to-interleave-two-lists-in-dr-racket
; code in the question, enough for me

(define (interleave list1 list2)
  (flatten (map (lambda (x y) (cons x (cons y (list)))) list1 list2)))

					; https://stackoverflow.com/questions/33338078/flattening-a-list-in-scheme
					; the scheme implementation I have does not have a flatten function
					; it is slightly modified as I want to flatten one level only, so I append (car lst) and not (flatten (car lst))
					; I do not have completely clear the else case of the cond, but it should take care of all elements that are not lists, so it does not unpack them. I have to rethink about the whole implementation of this function as it involves understanding the Scheme data types.
; The application of append is the critical thing. It appends a list to the next rather than inserting it as an element. I do have to check why "pair?" makes sure that this is possible. 

(define (flatten lst)
  (cond ((null? lst) '())
        ((pair? (car lst))
         (append  (car lst)
                 (flatten (cdr lst))))
        (else (cons (car lst) (flatten (cdr lst))))))

(define (genList elem n)
  (cond ((equal? n 0) (list))
	(else (cons elem (genList elem (- n 1))))))

; If I have copied it, I do not recall where from; probably I wrote this myself
(define (combine str ref)
  (let ((lst (string-split str #\#)))
    (removeLast (interleave lst (genList ref (length lst))))))


; https://stackoverflow.com/questions/5006750/removing-last-element-of-a-listscheme

(define (removeLast lst)
  (reverse (cdr (reverse lst))))
