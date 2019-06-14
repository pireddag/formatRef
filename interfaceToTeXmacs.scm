(tm-define (formatRefScheme str)
  (set! str (tree->stree str))
  (stree->tree (extractFormatString str formatList)))

(tm-define (addToFormatListScheme formatCode formatString)
  (set! formatCode (tree->stree formatCode))
  (set! formatString (tree->stree formatString))
  (let ((ft (cons formatCode (cons formatString (list) ))
            ))
    (addToFormatList ft)))

(tm-define (deleteFromFormatListScheme formatCode n)
  (set! formatCode (tree->stree formatCode))
  (set! n (string->number (tree->stree n)))
        (let (
(ft (cons formatCode (list)))
)
(deleteFromFormatList ft n)))

(tm-define (replaceInFormatListScheme formatCode formatString n)
  (set! formatCode (tree->stree formatCode))
  (set! formatString (tree->stree formatString))
  (set! n (string->number (tree->stree n)))
  (let (
(ft (cons formatCode (cons formatString (list))))
 )
    (replaceFormat ft n)))







