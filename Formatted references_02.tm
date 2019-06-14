<TeXmacs|1.99.9>

<style|generic>

<\body>
  <\hide-preamble>
    \;

    <assign|the-example|<macro|<compound|display-example|<value|<compound|counter-example>>>>>
  </hide-preamble>

  <assign|formatRef|<macro|str|<extern|formatRefScheme|<arg|str>><reference|<arg|str>>>>

  <assign|addToFormatRef|<macro|formatCode|formatString|<extern|addToFormatListScheme|<arg|formatCode>|<arg|formatString>>>>

  <assign|deleteFromFormatRef|<macro|formatCode|n|<extern|deleteFromFormatListScheme|<arg|formatCode>|<arg|n>>>>

  <assign|replaceInFormatRef|<macro|formatCode|formatString|n|<extern|replaceInFormatListScheme|<arg|formatCode>|<arg|formatString>|<arg|n>>>>

  <doc-data|<doc-title|Formatted references>|<\doc-subtitle>
    A set of Scheme functions for formatting references

    in a <TeXmacs> document - v 0.2
  </doc-subtitle>>

  <section|Description>

  This program is inspired by the <LaTeX> package <verbatim|prettyref>.

  It provides the macro <verbatim|formatRef><marginal-note|normal|c|<small|Are
  formatRef and formatList the names we want?>>
  (<with|color|blue|<verbatim|\<less\><with|color|blue|formatRef>\|<with|color|dark
  blue|lab>\<gtr\>>>) which formats a reference choosing in a list of formats
  saved in the global variable <verbatim|formatList>. Each format is a list
  consisting of two members; the first member is a format code, which is a
  short string, whicle the second member is the corresponding format to apply
  to the reference. The function selects the format by comparing the format
  code with the beginning of the label: the first element of
  <verbatim|formatList> that matches is selected and the corresponding format
  string <verbatim|formatString> is prepended to the TeXmacs reference, so
  that the reference obtained with the macro
  <with|color|blue|<verbatim|\<less\><with|color|blue|formatRef>\|<with|color|dark
  blue|lab>\<gtr\>>> looks like\ 

  <verbatim|formatString><with|color|blue|<verbatim|\<less\><with|color|blue|reference>\|<with|color|dark
  blue|lab>\<gtr\>>>

  The labels must be assigned according to the format codes so that the
  macros have an effect. If no format code matches, the macro returns

  <with|color|blue|<verbatim|\<less\><with|color|blue|reference>\|<with|color|dark
  blue|lab>\<gtr\>>>

  <section|<TeXmacs> macros and their use>

  I have defined the <TeXmacs> macros in the preamble of this document

  <paragraph|<with|color|blue|formatRef>>

  <with|color|blue|<verbatim|\<less\><with|color|blue|formatRef>\|<with|color|dark
  blue|lab<with|color|blue|_string>>\<gtr\>>>

  Formats a reference so that it looks like

  <verbatim|formatString> <with|color|blue|<verbatim|\<less\><with|color|blue|reference>\|<with|color|dark
  blue|lab>\<gtr\>>>

  where <verbatim|formatString> is the format string of the first matching
  format (empty string if there is no match).

  <paragraph|<with|color|blue|addToFormatRef>>

  <with|color|blue|<verbatim|\<less\><with|color|blue|addToFormatRef>\|<with|color|dark
  blue|formatCode<with|color|blue|_string>>\|<with|color|dark
  blue|formatString<with|color|blue|_string>>\<gtr\>>>

  Adds to the list of formats <verbatim|formatList> (which is a global Scheme
  variable) the new format which is composed of the strings
  <verbatim|<with|color|dark blue|formatCode>> and <verbatim|<with|color|dark
  blue|formatString>>.

  <strong|Example:>

  <with|color|blue|<verbatim|\<less\><with|color|blue|addToFormatRef>\|fig:\|Figure
  \<gtr\>>> makes the new format <verbatim|("fig:" "Figure")> available, so
  that the application of the macro

  <with|color|blue|<verbatim|\<less\><with|color|blue|formatRef>\|<with|color|dark
  blue|fig:figure1>\<gtr\>>>

  returns

  Figure <with|color|blue|<verbatim|\<less\><with|color|blue|reference>\|<with|color|dark
  blue|<with|color|dark blue|fig:figure1>>\<gtr\>>>

  <paragraph|<with|color|blue|deleteFromFormatRef>>

  <with|color|blue|<verbatim|\<less\><with|color|blue|deleteFromFormatRef>\|<with|color|dark
  blue|formatCode<with|color|blue|_string>>\|<with|color|dark
  blue|n<with|color|blue|_integer>>\<gtr\>>>

  Deletes from <verbatim|formatList> the n-th format that matches
  <verbatim|<with|color|dark blue|formatCode>>. If no format that matches
  format code remains after deletion, then\ 

  <with|color|blue|<verbatim|\<less\><with|color|blue|formatRef>\|<with|color|dark
  blue|lab>\<gtr\>>>

  will return

  <with|color|blue|<verbatim|\<less\><with|color|blue|reference>\|<with|color|dark
  blue|lab>\<gtr\>>>

  <strong|Example:>

  <with|color|blue|<verbatim|\<less\><with|color|blue|<with|color|blue|deleteFromFormatRef>>\|fig:\|1\<gtr\>>>

  deletes from <verbatim|formatList> the first occurrence of the format with
  format code <verbatim|"fig:">

  <paragraph|<with|color|blue|replaceInFormatRef>>

  <with|color|blue|<verbatim|\<less\><with|color|blue|replaceInFormatRef>\|<with|color|dark
  blue|formatCode<with|color|blue|_string>>\|<with|color|dark
  blue|formatString<with|color|blue|_string>>\|<with|color|dark
  blue|n<with|color|blue|_integer>>\<gtr\>>>

  Replaces in <verbatim|formatList> the n-th format with matching
  <verbatim|formatCode> with the format <verbatim|("formatCode"
  "formatString")>.

  <strong|Example:>

  Let the initial value of <code*|formatList> be <code*|(list (list "eq:"
  "eqn. ") (list "Sec:" "Section ") (list "eq:" "equation "))>

  <with|color|blue|<verbatim|\<less\><with|color|blue|<with|color|blue|deleteFromFormatRef>>\|eq:\|Equation
  \<gtr\>>>

  transforms <verbatim|formatList> into\ 

  <code*|(list (list "eq:" "eqn. ") (list "Sec:" "Section ") (list "eq:"
  "Equation "))>

  in this case the application of the macro\ 

  <with|color|blue|<verbatim|\<less\><with|color|blue|formatRef>\|<with|color|dark
  blue|eq:equation1>\<gtr\>>>

  returns

  eqn. <with|color|blue|<verbatim|\<less\><with|color|blue|reference>\|<with|color|dark
  blue|<with|color|dark blue|eq:equation1>>\<gtr\>>>

  like it did originally, as the matching format is the first one that
  matches the format code.

  <section|Scheme functions and their use>

  <paragraph|<with|color|blue|formatList>>

  Global variable, accessible from the whole document.\ 

  A list of formats. Each element of a list is a list of two elements (both
  strings). The first element is a \Pformat code\Q and is examined by the
  program to match label and format; the second element is the string which
  is applied to format the reference.

  <paragraph|<with|color|blue|extractFormatString>>

  <verbatim|(extractFormatString label_string \ formatList_list)>

  Extracts from the list of formats <verbatim|formatList> the matching
  format; returns the second member of the list that matches the format (that
  is, the format string).

  A format matches if its first element (the \Pformat code\Q) is equal to the
  beginning of the <verbatim|label> string.

  <strong|Example:>

  <verbatim|(extractFormatString "fig:" (list (list "fig:" "Figure ") (list
  "Sec:" "Section ")))>

  returns <verbatim|"Figure ">

  <paragraph|<with|color|blue|addToFormatList>>

  <verbatim|(addToFormatList format_list)>

  Adds to the list of formats <verbatim|formatList> (which is a global
  variable) the new format <verbatim|format>.

  Checks that <code*|format> is syntactically correct and that does not
  already exists in <verbatim|formatList>.

  \;

  <strong|Example:>

  Let the initial value of <code*|formatList> be <code*|(list (list "fig:"
  "Figure ") (list "Sec:" "Section "))>

  <verbatim|(addToFormatList (list "eq:" "Equation "))>

  transforms <verbatim|formatList> into\ 

  <code*|(list (list "fig:" "Figure ") (list "Sec:" "Section ") (list "eq:"
  "Equation "))>

  <paragraph|<with|color|blue|deleteFromFormatList>>

  <verbatim|(deleteFromFormatList formatToDelete_list n_integer)>

  Deletes from <verbatim|formatList> the n-th format that matches
  <verbatim|formatToDelete>.

  <verbatim|formatToDelete> must be a list<marginal-note|normal|c|<small|I
  would like to rewrite the function so that is accepts either lists or
  strings>>; it must not a syntactically correct format, as only its first
  element will be matched to formats.

  <strong|Example:>

  Let the initial value of <code*|formatList> be <code*|(list (list "eq:"
  "eqn. ") (list "Sec:" "Section ") (list "eq:" "equation "))>

  <verbatim|(deleteFromFormatList (list "eq:") 2)>

  transforms <verbatim|formatList> into\ 

  <code*|(list (list "eq:" "eqn. ") (list "Sec:" "Section "))>

  <paragraph|<with|color|blue|replaceFormat>>

  <verbatim|(replaceFormat newFormat_list n_integer)>

  Replaces in <verbatim|formatList> the n-th format that matches
  <verbatim|newFormat> with <verbatim|newFormat> itself.

  <verbatim|newFormat> must be a syntactically correct format. The match is
  done checking the first element of the list <verbatim|newFormat> (like the
  match done by <verbatim|extractFormatString>).

  <strong|Example:>

  Let the initial value of <code*|formatList> be <code*|(list (list "eq:"
  "eqn. ") (list "Sec:" "Section ") (list "eq:" "equation "))>

  <verbatim|(replaceFormat (list "eq:" "Equation ") 2)>

  transforms <verbatim|formatList> into\ 

  <code*|(list (list "eq:" "eqn. ") (list "Sec:" "Section ") (list "eq:"
  "Equation "))>

  \;

  <section|Functions - code and detailed description>

  <subsection|Global variables>

  <\session|scheme|default>
    <\textput>
      <verbatim|formatList> is the list of all formats (for the moment empty)
    </textput>

    <\input|Scheme] >
      (define formatList (list))
    </input>

    <\input|Scheme] >
      \;
    </input>
  </session>

  <subsection|Comparison to format code>

  We compare the reference string <verbatim|str> to a format code
  <verbatim|ref><verbatim|><marginal-note|normal|c|<small|<verbatim|ref> is a
  bad name here as the string is is already called \Preference\Q>>. To do
  this, we extract first from the string the intial substring of length equal
  to the length of <verbatim|ref>; we then compare the extracted substring to
  the format code.

  <\session|scheme|default>
    <\textput>
      Check that <verbatim|str> is at least as long as <verbatim|ref> before
      extracting the initial substring from <verbatim|str>.
    </textput>

    <\input|Scheme] >
      (define (checkLength str ref)

      \ \ (\<less\>= (string-length ref) (string-length str)))
    </input>

    <\input|Scheme] >
      (define (extractBase str ref)

      \ \ \ (substring str 0 (string-length ref)))
    </input>

    <\textput>
      If <verbatim|str> is at least as long as <verbatim|ref>, extract the
      substring; if not, return the empty string.

      If the function returns the empty string, the format will not match, as
      we define it not to match in the matching function.
    </textput>

    <\input|Scheme] >
      (define (extract str ref)

      \ \ \ (if (checkLength str ref)

      \ \ \ \ \ \ \ (extractBase str ref)

      \ \ \ \ \ \ \ \ ""))
    </input>

    <\input|Scheme] >
      \;
    </input>

    \;
  </session>

  <subsubsection|Comparison between string and format code>

  <\session|scheme|default>
    <\textput>
      The matching function will return false if either <verbatim|str> or
      <verbatim|ref> is the empty string (i.e., no format will be applied to
      an empty reference and no format with empty format code will be applied
      to a reference)
    </textput>

    <\input|Scheme] >
      (define (checkLabelInputs str ref)

      \ \ \ (and

      \ \ \ \ (not (equal? str ""))

      \ \ \ \ (not (equal? ref ""))))
    </input>

    <\textput>
      Use the <verbatim|extract> function to compare <verbatim|str> and
      <verbatim|ref>.
    </textput>

    <\input|Scheme] >
      (define (compareSubstrBase str ref)

      \ \ \ (equal? ref (extract str ref)))
    </input>

    <\textput>
      Check first for empty <verbatim|ref> or <verbatim|str>, then compare.
    </textput>

    <\input|Scheme] >
      (define (compareSubstr str ref)

      \ \ \ (if (checkLabelInputs str ref)

      \ \ \ \ \ \ \ (compareSubstrBase str ref)

      \ \ \ \ \ \ \ \ #f))
    </input>

    <\textput>
      <paragraph|Compare the string to the first element of a format >

      The format is a list of two elements, the format code and the format
      itself
    </textput>

    <\textput>
      We want to match only on correctly formed formats.

      Check that <verbatim|lst> is a list of length 2.

      We probably need a comprehensive check that the format is correctly
      formed, that is <verbatim|lst> is a list of length 2 and both elements
      are strings.<marginal-note|normal|c|<small|The check on <verbatim|lst>
      needs to be complete>>

      <\note>
        I already wrote the complete check in the functions the compose the
        list; I need to apply it consistently
      </note>
    </textput>

    <\input|Scheme] >
      (define (listCond lst)

      \ \ \ (if (not (list? lst))

      \ \ \ \ \ \ \ \ #f

      \ \ \ \ \ \ \ \ (= (length lst) 2)))
    </input>

    <\textput>
      If <verbatim|ft> is correctly formed, compare <verbatim|str> to the
      first element of <verbatim|ft>; otherwise return <verbatim|#f>
    </textput>

    <\input|Scheme] >
      (define (compareSubstrFt str ft)

      \ \ (if (listCond ft)

      \ \ \ \ \ \ \ (compareSubstr str (list-ref ft 0))

      \ \ \ \ \ \ \ #f))
    </input>

    <\input|Scheme] >
      \;
    </input>

    \;
  </session>

  <subsection|Extraction of format string>

  We extract from the format list the first matching format and from the
  format its format proper.<marginal-note|normal|c|<small|Find a good way of
  referring to the \Pformat string\Q part of the format>>

  <\session|scheme|default>
    <\textput>
      Filter format list <verbatim|labelFormats> according to the
      <verbatim|compareSubstrFt> predicate. In a subsequent function, we will
      select the first element of the filtered list; if the filtered list is
      empty we will return an empty list.
    </textput>

    <\input|Scheme] >
      (define (filterFormats str labelFormats)

      \ \ (filter

      \ \ \ (lambda (x) (compareSubstrFt str x))

      \ \ \ \ \ \ labelFormats))
    </input>

    <\textput>
      We select here the first element of the filtered list; if the filtered
      list is empty we return an empty list (we need to do that in a separate
      case, because <verbatim|car> does not work on an empty
      list<marginal-note|normal|c|<small|Check again <verbatim|car> on an
      empty list>>)
    </textput>

    <\input|Scheme] >
      (define (extractFormat str labelFormats)

      \ \ \ (let ((matchList (filterFormats str labelFormats)))

      \ \ \ \ \ (if (null? matchList)

      \ \ \ \ \ \ \ \ \ (list)

      \ \ \ \ \ \ \ \ \ (car matchList))))
    </input>

    <\textput>
      From the format, extract the format proper, which is the element in
      second position; return an empty string if the format is an empty list
      (i.e. we did not find any match for the reference string)
    </textput>

    <\input|Scheme] >
      (define (extractFormatString str labelFormats)

      \ \ \ (let ((format (extractFormat str labelFormats)))

      \ \ \ \ \ (if (not (= (length format) 2))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ""

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (car (cdr format)))))
    </input>

    <\input|Scheme] >
      \;
    </input>
  </session>

  <subsection|Manipulation of format list >

  <subsubsection|Check that a format list is syntactically correct>

  <\session|scheme|default>
    <\textput>
      Checks that a single format <verbatim|formatGroup><marginal-note|normal|c|<small|Is
      <verbatim|checkGroup> a good name for this function? Same question for
      the other function names in this section>> is a list of two elements
      (<with|color|red|to do>: must issue error).
    </textput>

    <\input|Scheme] >
      (define (checkGroup formatGroup)

      \ \ (cond

      \ \ \ \ \ ((not (list? formatGroup)) #f)

      \ \ \ \ \ \ ((not (= (length formatGroup) 2)) #f)

      \ \ \ \ \ \ (else #t)))
    </input>

    <\textput>
      Checks that all elements of <verbatim|formatGroup> are strings
      (<with|color|red|to do>: must issue error).
    </textput>

    <\input|Scheme] >
      (define (checkFormatStrings formatGroup)

      \ \ \ (apply and-list (map string? formatGroup)))
    </input>

    <\textput>
      Checks that the format is syntactically correct: it must be a list of
      two elements, each of which is a string.
    </textput>

    <\input|Scheme] >
      (define (checkFormatGroup formatGroup)

      \ \ (and (checkGroup formatGroup)

      \ \ \ \ \ \ \ (checkFormatStrings formatGroup)))
    </input>

    <\input|Scheme] >
      \;
    </input>

    \;
  </session>

  <subsubsection|Check whether a format is present in the list>

  <\session|scheme|default>
    <\textput>
      Compare two formats (different from the \Pmatching\Q function because
      it compares the lists that define formats)
    </textput>

    <\input|Scheme] >
      (define (checkFormatEqual formatGroup1 formatGroup2)

      \ \ \ (equal? (car formatGroup1) (car formatGroup2)))
    </input>

    <\textput>
      Check that a format is present in the global variable
      <verbatim|formatList> using <verbatim|checkFormatEqual> and the
      <verbatim|find> function of Scheme.
    </textput>

    <\input|Scheme] >
      (define (checkFormatPresent formatGroup)

      \ \ (not

      \ \ \ (equal?

      \ \ \ \ (filter (lambda (x) (checkFormatEqual formatGroup x))
      formatList)

      \ \ \ \ (list))))
    </input>

    <\input|Scheme] >
      \;
    </input>

    \;
  </session>

  <subsubsection|Adding a format to the list>

  <\session|scheme|default>
    <\textput>
      Check on input:

      <\itemize>
        <item>The format is a list of two elements

        <item>The format list consists of strings

        <item>The format is not already present
      </itemize>
    </textput>

    <\note>
      The first two checks should be combined into one, the test of the
      correct syntax of the format
    </note>

    <\input|Scheme] >
      (define (checkFormatGroupAdd formatGroup)

      \ \ \ (cond

      \ \ \ \ \ \ ((not (checkGroup formatGroup)) (begin (display "Format
      must be a list of two elements") #f))

      \ \ \ \ \ \ \ ((not (checkFormatStrings formatGroup)) (begin (display
      "Format must be a list of two strings") #f))

      \ \ \ \ \ \ \ \ ((checkFormatPresent formatGroup) (begin (display
      "Format is already present, use replaceFormatGroup to replace") #f))

      \ \ \ \ \ \ \ \ \ (else #t)))
    </input>

    <\input|Scheme] >
      (define (addToFormatList formatGroup)

      \ \ (if (checkFormatGroupAdd formatGroup)

      \ \ \ \ \ \ (set! formatList (append formatList (list formatGroup)))

      \ \ \ \ \ \ \ (display "\\nincorrect application of addToFormatList")))
    </input>

    <\input|Scheme] >
      \;
    </input>

    \;
  </session>

  <subsubsection|Deleting a format from the list>

  <\session|scheme|default>
    <\textput>
      <paragraph|Delete the n-th element of a list for which the predicate
      <verbatim|cd> (for condition)<marginal-note|normal|c|<with|font-series|medium|<small|I
      could call the input parameter <verbatim|cd> with the name
      <verbatim|pred>>>> is true.>

      In part copied from a <hlink|Stackexchange
      question|https://stackoverflow.com/questions/29273374/scheme-guile-remove-only-first-occurrence-from-a-list-non-destructive>.
    </textput>

    <\input|Scheme] >
      (define (delete-nth-cond cd lst n)

      \ \ \ (cond ((null? lst) '()) ; base case

      \ \ \ \ \ \ \ \ \ ((cd (car lst)) (cond ((= n 1) (cdr lst)); if n = 1
      return the cdr, otherwise we call it again with n-1

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (else
      (cons (car lst)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (delete-nth-cond
      cd (cdr lst) (+ -1 n))))))

      \ \ \ \ \ \ \ \ \ (else (cons (car lst) ; if the condition is not
      satisfied retain the last element

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ; and apply
      the function to the rest of the list

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (delete-nth-cond cd (cdr
      lst) n)))))
    </input>

    \;

    <\textput>
      <paragraph|Delete the n-th occurrence of a format from the list>
    </textput>

    <\input|Scheme] >
      (define (deleteFromFormatList formatGroup n)

      \ \ (set! formatList

      \ \ \ \ \ \ \ \ (delete-nth-cond

      \ \ \ \ \ \ \ \ \ \ (lambda (x) (checkFormatEqual formatGroup x))
      formatList n)))
    </input>

    <\input|Scheme] >
      \;
    </input>

    \;
  </session>

  <subsubsection|Replace the n-th element of a list for which the predicate
  <verbatim|test> (for condition)<marginal-note|normal|c|<with|font-series|medium|<small|Here
  the input parameter for the condition is called <verbatim|test>; perhaps it
  is a good name for <verbatim|delete-nth-cond> too>>> is true.>

  <\session|scheme|default>
    <\textput>
      <paragraph|Replace the n-th element of a list that satisfied test>
    </textput>

    <\textput>
      This is copied from <verbatim|replace-nth-Test2> in the Emacs file, I
      have renamed it here
    </textput>

    <\input|Scheme] >
      (define (replace-nth-ElementCond lst test to n)

      \ \ \ (cond ((null? lst) '()) ; base case = end of input - issue
      warning here?

      \ \ \ \ \ \ \ \ \ \ ((test (car lst)) (if (= n 1) (cons to (cdr lst))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (cons
      (car lst)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (replace-nth-ElementCond
      (cdr lst) test to (+ n -1)))))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (else (cons (car lst)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (replace-nth-ElementCond
      (cdr lst) test to n)))))
    </input>

    \;

    <\textput>
      <paragraph|Replace the n-th occurrence of a format in the list>

      Uses ideas from a <hlink|Stackexchange
      question|https://stackoverflow.com/questions/15856346/replacing-an-element-into-a-list-scheme>.
      Checks that there are at least n elements of the format list that match
      <verbatim|formatGroup>.
    </textput>

    <\input|Scheme] >
      (define (replaceFormatCore formatGroup n)

      \ \ (let ((condition (lambda (x) (checkFormatEqual formatGroup x))))

      \ \ \ \ \ (let ((lengthFts \ (length (filter condition formatList))))

      \ \ \ \ \ \ \ (if (\<gtr\>= (length (filter condition formatList)) n)

      \ \ \ \ \ \ \ \ \ \ \ \ (set! formatList (replace-nth-ElementCond
      formatList condition formatGroup n))

      \ \ \ \ \ \ \ \ \ \ \ \ \ (begin (display "Format list contains only ")

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (display lengthFts)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (display " formats
      corresponding to the input"))))))
    </input>

    \;

    <\textput>
      Checks that <verbatim|formatGroup> is sintactically correct, then
      replaces the n-th format whose format code matches.
    </textput>

    <\input|Scheme] >
      (define (replaceFormat formatGroup n)

      \ \ (if (checkFormatGroup formatGroup)

      \ \ \ \ \ \ \ (replaceFormatCore formatGroup n)

      \ \ \ \ \ \ \ \ (display "did not execute replacement function")))
    </input>

    <\input|Scheme] >
      \;
    </input>

    \;
  </session>

  <\section>
    <subsection|Helper functions>
  </section>

  An <verbatim|and> function that can be applied to lists (using the Scheme
  function <verbatim|apply>). It returns <verbatim|#t> if all elements of the
  list are <verbatim|#t>. Copied from a <hlink|Stackexchange
  question|https://stackoverflow.com/questions/387775/using-and-with-the-apply-function-in-scheme>.

  <\session|scheme|default>
    <\input|Scheme] >
      (define and-list (lambda x

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (if (null? x)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ #t

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (if (car x) (apply
      and-list (cdr x)) #f))))
    </input>

    <\textput>
      <\note>
        <verbatim|and-list> is lambda variadic, so it can be applied to
        either an arbitrary number of arguments - for example <code*|(and-l
        #t #t #f)> - or to a list using <verbatim|apply> - example
        <verbatim|(apply and-list (list #t #t
        #f))>matches\Q?<marginal-note|normal|c|<small|I do not understand how
        the parameters of <verbatim|and-list> are determined. Is there a
        general rule that applied to this case and I do not know?>>
      </note>
    </textput>

    <\input|Scheme] >
      \;
    </input>
  </session>

  <section|Interface to <TeXmacs>>

  <\session|scheme|default>
    <\input|Scheme] >
      (set! formatList (list (list "eq:" "Equation ") (list "fig:" "Figure
      ")))
    </input>

    <\unfolded-io|Scheme] >
      (tm-define (formatRefScheme str)

      \ \ (set! str (tree-\<gtr\>stree str))

      \ \ (stree-\<gtr\>tree (extractFormatString str formatList)))
    <|unfolded-io>
      ((guile-user) (guile-user))
    </unfolded-io>

    <\unfolded-io|Scheme] >
      (extractFormatString "eq:" formatList)
    <|unfolded-io>
      "Equation "
    </unfolded-io>

    <\input|Scheme] >
      \;
    </input>
  </session>

  <subparagraph|Test>

  <\equation>
    sin<around*|(|x|)><rsup|2>+cos<around*|(|x|)><rsup|2>=1<label|eq:testFormat>
  </equation>

  <formatRef|eq:testFormat>

  <subsection|Manipulation of format list><label|sec:listManipulation>

  <subsubsection|Add to format list>

  <\session|scheme|default>
    <\unfolded-io|Scheme] >
      (tm-define (addToFormatListScheme formatCode formatString)

      \ \ (set! formatCode (tree-\<gtr\>stree formatCode))

      \ \ (set! formatString (tree-\<gtr\>stree formatString))

      \ \ (let ((ft (cons formatCode (cons formatString (list) ))

      \ \ \ \ \ \ \ \ \ \ \ \ ))

      \ \ \ \ \ \ \ \ \ \ \ \ (addToFormatList ft)))
    <|unfolded-io>
      ((guile-user) (guile-user) (guile-user) (guile-user))
    </unfolded-io>

    <\input|Scheme] >
      \;
    </input>
  </session>

  <addToFormatRef|sec:|Section >

  <\note>
    I need to execute the macro addToFormatRefList without returning anything
  </note>

  <\session|scheme|default>
    <\unfolded-io|Scheme] >
      formatList
    <|unfolded-io>
      (("eq:" "Equation ") ("fig:" "Figure "))
    </unfolded-io>

    <\input|Scheme] >
      \;
    </input>
  </session>

  <subparagraph|Test>

  <formatRef|sec:listManipulation>

  <subsubsection|Delete from format list>

  <\session|scheme|default>
    <\unfolded-io|Scheme] >
      (tm-define (deleteFromFormatListScheme formatCode n)

      \ \ (set! formatCode (tree-\<gtr\>stree formatCode))

      \ \ (set! n (string-\<gtr\>number (tree-\<gtr\>stree n)))

      \ \ \ \ \ \ \ \ (let (

      (ft (cons formatCode (list)))

      )

      \ \ \ \ \ \ \ \ \ \ (deleteFromFormatList ft n)))
    <|unfolded-io>
      ((guile-user) (guile-user) (guile-user))
    </unfolded-io>

    <\input|Scheme] >
      \;
    </input>

    <\textput>
      <subparagraph|Test>

      <deleteFromFormatRef|sec:|1>

      <\session|scheme|default>
        <\unfolded-io|Scheme] >
          formatList
        <|unfolded-io>
          (("eq:" "Equation ") ("fig:" "Figure "))
        </unfolded-io>

        <\input|Scheme] >
          \;
        </input>

        <\textput>
          <formatRef|sec:listManipulation>
        </textput>
      </session>
    </textput>
  </session>

  <subsubsection|Replace in format list>

  <\session|scheme|default>
    <\unfolded-io|Scheme] >
      (tm-define (replaceInFormatListScheme formatCode formatString n)

      \ \ (set! formatCode (tree-\<gtr\>stree formatCode))

      \ \ (set! formatString (tree-\<gtr\>stree formatString))

      \ \ (set! n (string-\<gtr\>number (tree-\<gtr\>stree n)))

      \ \ (let (

      (ft (cons formatCode (cons formatString (list))))

      \ )

      \ \ \ \ (replaceFormat ft n)))
    <|unfolded-io>
      ((guile-user))
    </unfolded-io>

    <\input|Scheme] >
      \;
    </input>
  </session>

  <subparagraph|Test>

  <addToFormatRef|sec:|Section >

  <replaceInFormatRef|sec:|sect. |1>

  <\session|scheme|default>
    <\unfolded-io|Scheme] >
      formatList
    <|unfolded-io>
      (("eq:" "Equation ") ("fig:" "Figure ") ("sec:" "sect. "))
    </unfolded-io>

    <\input|Scheme] >
      \;
    </input>

    <\textput>
      <formatRef|sec:listManipulation>
    </textput>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|page-screen-margin|false>
    <associate|preamble|false>
    <associate|section-display-numbers|false>
    <associate|subsection-display-numbers|false>
    <associate|subsubsection-display-numbers|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|7|3>>
    <associate|auto-11|<tuple|8|3>>
    <associate|auto-12|<tuple|9|3>>
    <associate|auto-13|<tuple|4|4>>
    <associate|auto-14|<tuple|4.1|4>>
    <associate|auto-15|<tuple|4.2|4>>
    <associate|auto-16|<tuple|4.2.1|4>>
    <associate|auto-17|<tuple|4.2.1.1|4>>
    <associate|auto-18|<tuple|4.3|5>>
    <associate|auto-19|<tuple|4.4|5>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-20|<tuple|4.4.1|5>>
    <associate|auto-21|<tuple|4.4.2|6>>
    <associate|auto-22|<tuple|4.4.3|6>>
    <associate|auto-23|<tuple|4.4.4|6>>
    <associate|auto-24|<tuple|4.4.4.1|6>>
    <associate|auto-25|<tuple|4.4.4.2|7>>
    <associate|auto-26|<tuple|4.4.5|7>>
    <associate|auto-27|<tuple|4.4.5.1|7>>
    <associate|auto-28|<tuple|4.4.5.2|7>>
    <associate|auto-29|<tuple|5|7>>
    <associate|auto-3|<tuple|1|1>>
    <associate|auto-32|<tuple|5.3|7>>
    <associate|auto-33|<tuple|6|8>>
    <associate|auto-34|<tuple|6.0.0.2.1|8>>
    <associate|auto-35|<tuple|6.1|8>>
    <associate|auto-36|<tuple|6.1.1|8>>
    <associate|auto-37|<tuple|6.1.1.0.2|8>>
    <associate|auto-38|<tuple|6.1.2|8>>
    <associate|auto-39|<tuple|6.1.2.0.3|9>>
    <associate|auto-4|<tuple|2|1>>
    <associate|auto-40|<tuple|6.1.3|9>>
    <associate|auto-41|<tuple|6.1.3.0.4|9>>
    <associate|auto-5|<tuple|3|2>>
    <associate|auto-6|<tuple|4|2>>
    <associate|auto-7|<tuple|3|2>>
    <associate|auto-8|<tuple|5|2>>
    <associate|auto-9|<tuple|6|2>>
    <associate|eq:testFormat|<tuple|1|8>>
    <associate|sec:listManipulation|<tuple|6.1|8>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Description>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn>|0fn|-0.1fn>>
      macros and their use> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|4tab>|<with|color|<quote|blue>|formatRef>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|<with|color|<quote|blue>|addToFormatRef>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|<with|color|<quote|blue>|deleteFromFormatRef>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|<with|color|<quote|blue>|replaceInFormatRef>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.15fn>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Scheme
      functions and their use> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|4tab>|<with|color|<quote|blue>|formatList>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|<with|color|<quote|blue>|extractFormatString>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|<with|color|<quote|blue>|addToFormatList>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|<with|color|<quote|blue>|deleteFromFormatList>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|<with|color|<quote|blue>|replaceFormat>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.15fn>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Functions
      - code and detailed description> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Global variables
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|Comparison to format code
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|2tab>|Comparison between string and format code
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|4tab>|Compare the string to the first element of
      a format \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.15fn>>

      <with|par-left|<quote|1tab>|Extraction of format string
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|Manipulation of format list
      \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|2tab>|Check that a format list is syntactically
      correct <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|2tab>|Check whether a format is present in the
      list <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <with|par-left|<quote|2tab>|Adding a format to the list
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|2tab>|Deleting a format from the list
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|4tab>|Delete the n-th element of a list for which
      the predicate <with|font-family|<quote|tt>|language|<quote|verbatim>|cd>
      (for condition)<with|dummy1|<quote|2cm>|dummy2|<quote|5mm>|<line-note|<tformat|<tformat|<twith|table-width|2cm>|<twith|table-hmode|exact>|<cwith|1|1|1|1|cell-hyphen|c>|<twith|table-valign|C>|<cwith|1|1|1|1|cell-lsep|0em>|<cwith|1|1|1|1|cell-rsep|0em>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<\cell>
        <\with|par-par-sep|<quote|0em>|par-line-sep|<quote|0em>|par-mode|<quote|right>>
          <with|font-series|<quote|medium>|<with|font-size|<quote|0.841>|I
          could call the input parameter <with|font-family|<quote|tt>|language|<quote|verbatim>|cd>
          with the name <with|font-family|<quote|tt>|language|<quote|verbatim>|pred>>>
        </with>
      </cell>>>>>|<tmlen|-151181>|0cm><flag|marginal note|dark brown>> is
      true. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Delete the n-th occurrence of a format from
      the list <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25><vspace|0.15fn>>

      <with|par-left|<quote|2tab>|Replace the n-th element of a list for
      which the predicate <with|font-family|<quote|tt>|language|<quote|verbatim>|test>
      (for condition)<with|dummy1|<quote|2cm>|dummy2|<quote|5mm>|<line-note|<tformat|<tformat|<twith|table-width|2cm>|<twith|table-hmode|exact>|<cwith|1|1|1|1|cell-hyphen|c>|<twith|table-valign|C>|<cwith|1|1|1|1|cell-lsep|0em>|<cwith|1|1|1|1|cell-rsep|0em>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<\cell>
        <\with|par-par-sep|<quote|0em>|par-line-sep|<quote|0em>|par-mode|<quote|right>>
          <with|font-series|<quote|medium>|<with|font-size|<quote|0.841>|Here
          the input parameter for the condition is called
          <with|font-family|<quote|tt>|language|<quote|verbatim>|test>;
          perhaps it is a good name for <with|font-family|<quote|tt>|language|<quote|verbatim>|delete-nth-cond>
          too>>
        </with>
      </cell>>>>>|<tmlen|-151181>|0cm><flag|marginal note|dark brown>> is
      true. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      <with|par-left|<quote|4tab>|Replace the n-th element of a list that
      satisfied test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Replace the n-th occurrence of a format in
      the list <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28><vspace|0.15fn>>

      <vspace*|1fn><\with|font-series|<quote|bold>|math-font-series|<quote|bold>>
        <assign|subsection-numbered|false><assign|subsection-prefix|<macro|<compound|the-subsection>.>><assign|subsection-nr|1><hidden-binding|<tuple>|5.1><assign|subsubsection-nr|0><flag|table
        of contents|dark green|what><assign|auto-nr|30><write|toc|<with|par-left|<quote|1tab>|Helper
        functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
        <no-break><pageref|auto-30>>><toc-notify|toc-2|Helper
        functions><surround|<no-indent>|<specific|texmacs|<htab|0fn|first>>|<with|font-series|<quote|bold>|math-font-series|<quote|bold>|<vspace*|1fn><with|font-size|<quote|1.189>|Helper
        functions><vspace|0.3333fn>><no-page-break><no-indent*>>
      </with> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Helper functions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Interface
      to T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn>|0fn|-0.1fn>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33><vspace|0.5fn>

      Test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34><vspace|0.15fn>

      <with|par-left|<quote|1tab>|Manipulation of format list
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>>

      <with|par-left|<quote|2tab>|Add to format list
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      Test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37><vspace|0.15fn>

      <with|par-left|<quote|2tab>|Delete from format list
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>>

      Test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39><vspace|0.15fn>

      <with|par-left|<quote|2tab>|Replace in format list
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>>

      Test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41><vspace|0.15fn>
    </associate>
  </collection>
</auxiliary>