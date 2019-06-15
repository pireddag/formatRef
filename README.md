# formatRef
A set of Scheme functions for  formatting references in a TeXmacs document


This program is inspired by the LaTeX package prettyref.

It provides the macro `formatRef` (`<formatRef|lab>`) which formats a reference choosing in a list of formats saved in the global variable formatList. Each format is a list consisting of two members; the first member is a format code, which is a short string, whicle the second member is the corresponding format to apply to the reference. The function selects the format by comparing the format code with the beginning of the label: the first element of formatList that matches is selected and the corresponding format string formatString is prepended to the TeXmacs reference, so that the reference obtained with the macro `<formatRef|lab>` looks like 
`formatString<reference|lab>`
The labels must be assigned according to the format codes so that the macros have an effect. If no format code matches, the macro returns
`<reference|lab>`

The .pdf files show how the TeXmacs files look like after the Scheme functions have been loaded and the TeXmacs macros executed.
