(load "/home/giovanni/test/test TeXmacs/formatRef/version_04/selectFormat.scm")
(load "/home/giovanni/test/test TeXmacs/formatRef/version_04/formatRefUtils.scm")
(load "/home/giovanni/test/test TeXmacs/formatRef/version_04/manipulateList.scm")
(load "unitTestsSimple.scm")

(define formatList '())

;; Here I am setting a wrong result for (checkGroup "eq") (#t instead of the correct one #f) to see how test-expression/md behaves
(test-expression/md "not a list" (checkGroup "eq") #t)

;; Here I repeat the test with the correct output
(test-expression/md "not a list" (checkGroup "eq") #f)
