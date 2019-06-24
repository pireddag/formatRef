<TeXmacs|1.99.9>

<style|source>

<\body>
  <use-module|(formatRef interfaceToTeXmacs)>

  <assign|formatRef|<macro|str|<extern|formatRefScheme|<arg|str>>>>

  <assign|addToFormatRef|<macro|formatCode|formatString|<extern|addToFormatListScheme|<arg|formatCode>|<arg|formatString>>>>

  <assign|deleteFromFormatRef|<macro|formatCode|n|<extern|deleteFromFormatListScheme|<arg|formatCode>|<arg|n>>>>

  <assign|replaceInFormatRef|<macro|formatCode|formatString|n|<extern|replaceInFormatListScheme|<arg|formatCode>|<arg|formatString>|<arg|n>>>>

  \;

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|preamble|true>
  </collection>
</initial>