<TeXmacs|1.99.9>

<style|<tuple|generic|Formatted references_setup|Formatted references>>

<\body>
  <doc-data|<doc-title|Test formatRef>>

  Loads formatRef from the menu

  <\itemize>
    <item>It is available from <verbatim|/home/giovanni/.TeXmacs/packages/formatRef/Formatted
    references.ts>
  </itemize>

  <\equation>
    tan<around*|(|x|)>=<frac|sin<around*|(|x|)>|cos<around*|(|x|)>><label|eq:eq1>
  </equation>

  <formatRef|eq:eq1>

  <section|Section><label|sec:sec1>

  <formatRef|sec:sec1>

  \;

  Let us reference again <formatRef|eq:eq1>

  \;

  <small-figure|<image|../../../Maxima session/Maxima_session.jpg|150pt|||>|<label|fig:fig1>>

  Look at <formatRef|fig:fig1>.

  <small-table|<tabular|<tformat|<table|<row|<cell|a>|<cell|b>>|<row|<cell|c>|<cell|d>>>>>|<label|tab:table1>>

  Examine <formatRef|tab:table1>
</body>

<\initial>
  <\collection>
    <associate|info-flag|detailed>
    <associate|page-screen-margin|false>
    <associate|preamble|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|1|?>>
    <associate|eq:eq1|<tuple|1|?>>
    <associate|fig:fig1|<tuple|1|?>>
    <associate|sec:sec1|<tuple|1|?>>
    <associate|tab:table1|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||>|<pageref|auto-2>>
    </associate>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||>|<pageref|auto-3>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Section>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>