<TeXmacs|1.99.9>

<style|source>

<\body>
  <use-module|(formatRef interfaceToTeXmacs)>

  <style-with|src-compact|none|<assign|formatRef|<style-with|src-compact|none|<macro|str|<style-with|src-compact|none|<with|fmtRef|<extern|formatRefScheme|<arg|str>>|<style-with|src-compact|none|<case|<equal|<length|<value|fmtRef>>|0>|<reference|<arg|str>>|<value|fmtRef>>>>>>>>>

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