# formatRef
A set of Scheme functions for  formatting references in a TeXmacs document


This program is inspired by the LaTeX package prettyref.

## Description

This program provides the macro `formatRef` (`<formatRef|lab>`) which formats a reference choosing in a list of formats saved in the global variable formatList. Each format is a list consisting of two members; the first member is a format code, which is a short string, whicle the second member is the corresponding format to apply to the reference. The function selects the format by comparing the format code with the beginning of the label: the first element of formatList that matches is selected and the corresponding format string formatString is prepended to the TeXmacs reference, so that the reference obtained with the macro `<formatRef|lab>` looks like 
`formatString<reference|lab>`
The labels must be assigned according to the format codes so that the macros have an effect. If no format code matches, the macro returns
`<reference|lab>`

The .pdf file shows how the TeXmacs files look like after the Scheme functions have been loaded and the TeXmacs macros executed.

## Macros

* `<addToFormatRef|formatKey|formatString>`
    * Adds the format key `formatKey` with corresponding format string `formatString` from the list of formats
* `<replaceInFormatRef|formatKey|formatString|n>`
    * Replaces in the n-th occurrence of the format with `formatKey` format key the given format string `formatString`
* `<deleteFromFormatRef|formatKey|n>`
    * Deletes the n-th occurrence of the format with `formatKey` format key
* `<formatRef|lab>`
    * Generates a formatted reference for item with the label `lab`

## Instructions

The program consists of the following files:
* Style file
    * `Formatted references.ts`
* Scheme files
    * `interfaceToTeXmacs.scm`
    * `manipulateList.scm`
    * `selectFormat.scm`

* Put the style file in the directory `~/.TeXmacs/packages` or in a subdirectory of it (for example `~/.TeXmacs/packages/formatRef`)
* Put the scheme files in the directory `~/.TeXmacs/progs/formatRef`.
    * It has to be in this subdirectory as the style file is looking for the Scheme files there through the command `<use-module|(formatRef interfaceToTeXmacs)>`
    
After this, the package will be availabe in TeXmacs under the menu `Document->S tyle-> Add package`.
It will be possible to add format definitions using the macro `addToFormatRef` and use them with the macro `formatRef`.

### Adding format keys (and warning - improvement is necessary)
For the moment (2019.06.22) I am placing the macros which add format definitions in the hidden preamble (with the macro `<hide-preamble|`); but I am not able not able to execute them only once: they get executed every time TeXmacs updates itself automatically. The format list does not get affected by the repeated use of `addToFormatRef` because `addToFormatRef` checks for the existence of the format key in the format list before adding it; this has to be corrected anyway for a "clean code". The macro `replaceInFormatRef` would continue modifying the format list (as long as the format key that `replaceInFormatRef` is trying to modify exists), while `deleteFromFormatRef` in combination with  `addToFormatRef` would keep deleting and adding a given key from the format list.
