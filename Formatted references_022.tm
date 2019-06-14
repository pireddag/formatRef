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

    in a <TeXmacs> document - v 0.22
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

  <section|Load Scheme functions>

  <\session|scheme|default>
    <\input|Scheme] >
      (load "manipulateList.scm")
    </input>

    <\input|Scheme] >
      (load "selectFormat.scm")
    </input>

    <\input|Scheme] >
      (load "interfaceToTeXmacs.scm")
    </input>

    <\input|Scheme] >
      \;
    </input>
  </session>

  <section|Test of <TeXmacs> macros>

  <\session|scheme|default>
    <\input|Scheme] >
      (set! formatList (list (list "eq:" "Equation ") (list "fig:" "Figure
      ")))
    </input>

    <\unfolded-io|Scheme] >
      (extractFormatString "eq:" formatList)
    <|unfolded-io>
      "Equation "
    </unfolded-io>

    <\input|Scheme] >
      \;
    </input>
  </session>

  <subsection|Test format application>

  <\equation>
    sin<around*|(|x|)><rsup|2>+cos<around*|(|x|)><rsup|2>=1<label|eq:testFormat>
  </equation>

  <formatRef|eq:testFormat>

  <subsection|Manipulation of format list><label|sec:listManipulation>

  <subsubsection|Test addition to format list>

  <with|color|blue|<verbatim|addToFormatRef>> sec: Section

  <inactive|<addToFormatRef|sec:|Section >>

  <\session|scheme|default>
    <\unfolded-io|Scheme] >
      formatList
    <|unfolded-io>
      (("eq:" "Equation ") ("fig:" "Figure ") ("sec:" "sect. "))
    </unfolded-io>

    <\input|Scheme] >
      \;
    </input>
  </session>

  <subparagraph|Test>

  <formatRef|sec:listManipulation>

  <subsubsection|Test deletion from format list>

  <verbatim|<with|color|blue|deleteFromFormatRef>> sec: 1

  <\session|scheme|default>
    <\textput>
      <inactive|<deleteFromFormatRef|sec:|1>>

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

  <subsubsection|Test replacement in format list>

  <with|color|blue|<verbatim|addToFormatRef>> sec: Section

  <addToFormatRef|sec:|Section >

  <with|color|blue|<verbatim|replaceInFormatRef>> sec: Section

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

  <section|To do>

  <\itemize>
    <item><verbatim|formatList> should perhaps be a tuple

    <\itemize>
      <item>In this way it could be easy to initialize it
    </itemize>

    <item>I need to load the Scheme functions automatically

    <\itemize>
      <item>Is it possible?
    </itemize>

    <item>Certain <TeXmacs> macros - the ones that manipulate the list -
    should be called only once.\ 

    <\itemize>
      <item>How can I make sure of this?

      <item>Should I put them in the preamble?
    </itemize>

    <item>General error checking

    <\itemize>
      <item>For example, what happens if I input a non-integer number in the
      macros for list manipulation?
    </itemize>

    <item>Error messages are sent to the standard output. I would need nice
    messages in <TeXmacs> too.

    <item>The space after the format string should be dealt with well
  </itemize>
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
    <associate|auto-1|<tuple|1|1|Formatted references_021.tm>>
    <associate|auto-10|<tuple|4.2|3|Formatted references_021.tm>>
    <associate|auto-11|<tuple|4.2.1|3|Formatted references_021.tm>>
    <associate|auto-12|<tuple|4.2.1.0.1|3|Formatted references_021.tm>>
    <associate|auto-13|<tuple|4.2.2|3|Formatted references_021.tm>>
    <associate|auto-14|<tuple|4.2.3|3|Formatted references_021.tm>>
    <associate|auto-15|<tuple|5|3|Formatted references_021.tm>>
    <associate|auto-2|<tuple|2|1|Formatted references_021.tm>>
    <associate|auto-3|<tuple|1|1|Formatted references_021.tm>>
    <associate|auto-4|<tuple|2|1|Formatted references_021.tm>>
    <associate|auto-5|<tuple|3|2|Formatted references_021.tm>>
    <associate|auto-6|<tuple|4|2|Formatted references_021.tm>>
    <associate|auto-7|<tuple|3|2|Formatted references_021.tm>>
    <associate|auto-8|<tuple|4|2|Formatted references_021.tm>>
    <associate|auto-9|<tuple|4.1|3|Formatted references_021.tm>>
    <associate|eq:testFormat|<tuple|1|3|Formatted references_021.tm>>
    <associate|sec:listManipulation|<tuple|4.2|3|Formatted
    references_021.tm>>
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Load
      Scheme functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Test
      of T<rsub|<space|-0.4spc><move|<resize|<with|math-level|<quote|0>|E>||||0.5fn>|0fn|-0.1fn>><space|-0.4spc>X<rsub|<space|-0.4spc><move|<resize|M<space|-0.2spc>A<space|-0.4spc>CS||||0.5fn>|0fn|-0.1fn>>
      macros> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Test format application
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|Manipulation of format list
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|2tab>|Test addition to format list
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      Test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.15fn>

      <with|par-left|<quote|2tab>|Test deletion from format list
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|2tab>|Test replacement in format list
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|To
      do> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>