(load "/home/giovanni/test/test TeXmacs/De Benito/version_04/selectFormat.scm")
(load "/home/giovanni/test/test TeXmacs/De Benito/version_04/formatRefUtils.scm")
(load "/home/giovanni/test/test TeXmacs/De Benito/version_04/manipulateList.scm")
(load "unitTestsSimple.scm")

;; define formatList for the functions that rely on it
;; in the program is defined in defineList.scm using tm-define (so I cannot use it here and anyway an explicitly defined one is better)
(define formatList (list (list "eq:" "Equation") (list "fig:" "Figure") (list "tab:" "Table")))

;; the quotes and quasiquotes define a list without using the "list" command

;; Checks that a single format formatGroup is a list of two elements.
(display "testing checkGroup")
(test-expression "not a list" (checkGroup "eq") #f)
(test-expression "a list of one element" (checkGroup '("eq1")) #f)
(test-expression "a list of two elements" (checkGroup '("eq1" "eq2")) #t)
(test-expression "a list of three elements" (checkGroup '("eq1" "eq2" "eq3")) #f)

;; Checks that all elements of formatGroup are strings.
(display "testing checkFormatStrings")
(test-expression "a list of three elements, all of them strings" (checkFormatStrings '("eq1" "eq2" "eq3")) #t)
(test-expression "a list of three elements, one of them is not a string" (checkFormatStrings '("eq1" 2 "eq3")) #f)
;; checkFormatStrings can only be applied to lists (attempt to apply to a non-list results in error)

(display "testing checkFormatGroup")
(test-expression "a list of two elements, both strings" (checkFormatGroup '("eq:" "equation")) #t)
(test-expression "a list of three elements" (checkFormatGroup '("eq:" "equation" "eqn.")) #f)
(test-expression "not a list" (checkFormatGroup "eq:") #f)
(test-expression "a list of two elements, first is not a string" (checkFormatGroup `(0 "equation")) #f)
(test-expression "a list of two elements, second is not a string" (checkFormatGroup `("equation" 0)) #f)

;; Compare two formats (different from the “matching” function because it compares the lists that define formats)
;; Compares the cars of two formats, taking for granted that both are synctactically correct
(display "testing checkFormatEqual")
(test-expression "car is the same" (checkFormatEqual '("eq:" "equation") '("eq:" "Equation")) #t)
(test-expression "car is different" (checkFormatEqual '("eq:" "equation") '("fig:" "Equation")) #f)

;; Check that a format is present in the global variable formatList using checkFormatEqual and the filter function of Scheme.
;; Takes for granted:
;; formatList exists and is correctly formed
;; the input formatGroup is correctly formed
(display "testing checkFormatPresent")
(test-expression "format is not there" (checkFormatPresent '("sec:" "section")) #f)
(test-expression "format is there" (checkFormatPresent '("fig:" "figure")) #t)
