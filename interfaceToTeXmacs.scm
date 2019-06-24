(texmacs-module (formatRef interfaceToTeXmacs))


;(tm-define (formatRefScheme str)
;  (set! str (tree->stree str))
;  (stree->tree (extractFormatString str formatList)))

(tm-define (formatRefScheme str)
  (set! str (tree->stree str))
  (stree->tree (concat (combineFormatStringRef str formatList))))

(tm-define (formatRefSchemeFirst str)
	   (set! str (tree->stree str))
	   (stree->tree (extractFormatStringFirst str formatList)))

(tm-define (formatRefSchemeRest str)
	   (set! str (tree->stree str))
	   (stree->tree (extractFormatStringRest str formatList)))



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

(load "manipulateList.scm")

(load "selectFormat.scm")

(load "formatRefUtils.scm")




