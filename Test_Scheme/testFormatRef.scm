;; I do not want to see this output in this "unit testing"
;; try this https://stackoverflow.com/questions/50693165/is-there-a-way-to-turn-down-the-verbosity-of-mit-scheme
;; tried - it works
;; run scheme --quiet < testFormatRef.scm in a terminal window


(load "/home/giovanni/test/test TeXmacs/formatRef/version_04/selectFormat.scm")
(load "/home/giovanni/test/test TeXmacs/formatRef/version_04/formatRefUtils.scm")
(load "/home/giovanni/test/test TeXmacs/formatRef/version_04/manipulateList.scm")
(load "unitTestsSimple.scm")

;; define formatList for the functions that rely on it
;; in the program is defined in defineList.scm using tm-define (so I cannot use it here and anyway an explicitly defined one is better)
(define formatList (list (list "eq:" "Equation") (list "fig:" "Figure") (list "tab:" "Table")))

;; the quotes and quasiquotes define a list without using the "list" command

;; Checks that a single format formatGroup is a list of two elements.
(display "testing checkGroup\n")
(test-expression "not a list" (checkGroup "eq") #f)
(test-expression "a list of one element" (checkGroup '("eq1")) #f)
(test-expression "a list of two elements" (checkGroup '("eq1" "eq2")) #t)
(test-expression "a list of three elements" (checkGroup '("eq1" "eq2" "eq3")) #f)

;; Checks that all elements of formatGroup are strings.
(display "testing checkFormatStrings\n")
(test-expression "a list of three elements, all of them strings" (checkFormatStrings '("eq1" "eq2" "eq3")) #t)
(test-expression "a list of three elements, one of them is not a string" (checkFormatStrings '("eq1" 2 "eq3")) #f)
;; checkFormatStrings can only be applied to lists (attempt to apply to a non-list results in error)

(display "testing checkFormatGroup\n")
(test-expression "a list of two elements, both strings" (checkFormatGroup '("eq:" "equation")) #t)
(test-expression "a list of three elements" (checkFormatGroup '("eq:" "equation" "eqn.")) #f)
(test-expression "not a list" (checkFormatGroup "eq:") #f)
(test-expression "a list of two elements, first is not a string" (checkFormatGroup `(0 "equation")) #f)
(test-expression "a list of two elements, second is not a string" (checkFormatGroup `("equation" 0)) #f)

;; Compare two formats (different from the “matching” function because it compares the lists that define formats)
;; Compares the cars of two formats, taking for granted that both are synctactically correct
(display "testing checkFormatEqual\n")
(test-expression "car is the same" (checkFormatEqual '("eq:" "equation") '("eq:" "Equation")) #t)
(test-expression "car is different" (checkFormatEqual '("eq:" "equation") '("fig:" "Equation")) #f)

;; Check that a format is present in the global variable formatList using checkFormatEqual and the filter function of Scheme.
;; Takes for granted:
;; formatList exists and is correctly formed
;; the input formatGroup is correctly formed
(display "testing checkFormatPresent\n")
(test-expression "format is not there" (checkFormatPresent '("sec:" "section")) #f)
(test-expression "format is there" (checkFormatPresent '("fig:" "figure")) #t)

;; Check that a format can be added to the lists fo formats
;; I would like to check this function making sure that the format group goes through the two different checks
;; (correct syntax, and format not present) rather than checking if format is correct
;; I do not yet know how to check in this way
(display "testing checkFormatGroupAdd\n")

;; add the format to the list
;; here too I would like to check that the check takes place, and I need to figure out a way for this.
;; by the way this shows that checking a function with mutable data is more difficult than checking a function which does not mutate data
;; in fact now
;; 1) the check is not on the output of the function
;; 2) I have to take into account that after the application of the function formatList is different
;; I "save" myself by resetting formatList, but I need to find a better and general solution so that I test without worrying about the state of formatList
;; (perhaps a function that sets and resets formatList)
;; (done)

;; redone below with a function for checking format list modifications

(display "testing addToFormatList\n")
(test-formatList-modification
 "adding a format to the list"
 (addToFormatList '("sec:" "Section"))
 (list (list "eq:" "Equation") (list "fig:" "Figure") (list "tab:" "Table") (list "sec:" "Section")))
			      

