

					;https://stackoverflow.com/questions/30071930/any-idea-of-how-to-interleave-two-lists-in-dr-racket
; code in the question, enough for me

(define (interleave list1 list2)
  (flatten (map (lambda (x y) (cons x (cons y (list)))) list1 list2)))

					; https://stackoverflow.com/questions/33338078/flattening-a-list-in-scheme
; the scheme implementation I have does not have a flatten function

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
