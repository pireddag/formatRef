




					;formatList is the list of all formats (for the moment empty)
(tm-define formatList (list))

					;
					;
					;====================
					; Comparison to format code

					; Check that str is at least as long as ref before extracting the initial substring from str.

(define (checkLength str ref)
  (<= (string-length ref) (string-length str)))

(define (extractBase str ref)
  (substring str 0 (string-length ref)))

					; If str is at least as long as ref, extract the substring; if not, return the empty string.
					;If the function returns the empty string, the format will not match, as we define it not to match in the matching function.

(define (extract str ref)
   (if (checkLength str ref)
       (extractBase str ref)
       ""))

					;
					;
					;
					; =========
					; Comparison between string and format code

					;The matching function will return false if either str or ref is the empty string (i.e., no format will be applied to an empty reference and no format with empty format code will be applied to a reference)

(define (checkLabelInputs str ref)
  (and
    (not (equal? str ""))
    (not (equal? ref ""))))

					; Use the extract function to compare str and ref.

(define (compareSubstrBase str ref)
   (equal? ref (extract str ref)))

					; Check first for empty ref or str, then compare.

(define (compareSubstr str ref)
   (if (checkLabelInputs str ref)
       (compareSubstrBase str ref)
        #f))

					;Compare the string to the first element of a format
					; The format is a list of two elements, the format code and the format itself
					; We want to match only on correctly formed formats.
					; Check that lst is a list of length 2.

(define (listCond lst)
   (if (not (list? lst))
        #f
        (= (length lst) 2)))

					; If ft is correctly formed, compare str to the first element of ft
					; otherwise return #f
(define (compareSubstrFt str ft)
  (if (listCond ft)
       (compareSubstr str (list-ref ft 0))
       #f))

					;
					;
					;
					; ==========
					; Extraction of format string

					; We extract from the format list the first matching format and from the format its format proper.
					; Filter format list labelFormats according to the compareSubstrFt predicate.
					; In a subsequent function, we will select the first element of the filtered list
					; if the filtered list is empty we will return an empty list.
(define (filterFormats str labelFormats)
  (filter
   (lambda (x) (compareSubstrFt str x))
      labelFormats))

					; We select here the first element of the filtered list
					; if the filtered list is empty we return an empty list
					; (we need to do that in a separate case, because car does not work on an empty list)
(define (extractFormat str labelFormats)
   (let ((matchList (filterFormats str labelFormats)))
     (if (null? matchList)
         (list)
         (car matchList))))

					; From the format, extract the format proper, which is the element in second position
					; return an empty string if the format is an empty list (i.e. we did not find any match for the reference string)
(define (extractFormatString str labelFormats)
   (let ((format (extractFormat str labelFormats)))
     (if (not (= (length format) 2))
                 ""
                 (car (cdr format)))))
