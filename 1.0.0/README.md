`clong-dict`  is  a  Typst template for typesetting dictionaries, originally and
currently  aimed  at conlangers.  This README serves as a quick documentation of
the template.

Note  that  several  functions  in this template are prefixed with an undescore;
these  are  private functions and are not intended for public use.  No guarantee
of backward compatibility regarding these private functions is made.

The  code  has  been  documented  in  accordance with Tinymist.  No guarantee of
compatibility with other software is made.

This template currently supports the following languages:

- English

Template Function
=================
The  main  template function for `clong-dict` is `clong-dict()`.  Its parameters
are as follows:

`title: content, str = none`
: The title of the document.
`subtitle: content, str = none`
: The subtitle of the document.
`author: content, str = none.`
: The author(s) of the document.
`types: dict = (:)`
: The  definitions  for  all parts of speech in the dictionary.  Each key is the
  internal  name  of  PoS, as will be used in `entry()`.   The value is either a
  `dict` or a `str`.  The `dict` will be of the following format:
  
  `sym: content, str` (req.)
  : The abbreviated name of the PoS, as will be used in dictionary entries.
  `infl: content, str` (opt.)
  : The label placed after the name of the inflectional paradigm.
  `forms: dict` (opt.)
  : A  dictionary  of  the  principle  forms for a PoS, which will be listed for
    every entry of this PoS.  The keys are `str`s which are the internal name of
    the  principle  form as will be used in `entry()`.  The values are `content`
    or  `str`s which are the abbreviated name of the form placed before the form
    in dictionary entries.
  `cats: array` (opt.)
  : An  array o f the categories of the PoS, e.g. noun class or transivity.  The
    elements  of  the  array  are  `str`s  which  are the internal names for the
    category as will be used in `entry()`.

Matter Functions
======================
The   are  three  "matter"  functions:  `front-matter()`,  `main-matter()`,  and
`back-matter()`,  named  in  analogy  to  the identically-named LaTeX functions.
These  functions are intended to be used with `show`, e.g. `#show front-matter`.
They  are  used  as  follows: place `#show front-matter` before any content that
occurs  before the dictionary proper.  *Always* place `#show main-matter` before
the  dictionary  proper.   Place `#show back-matter` before any appendices after
the  dictionary  proper.  Note that `back-matter()` is currently not intended to
work with anything other than appendices.

Dictionary Entries
=========
`entry()`  is  the  main  function  of  this  template,  and is used to generate
dictionary  entries.   Specifically,  it generates the "signature" of the entry;
the  word,  romanization,  pronunciation, etymology and definition should all be
specified   outside  of  `entry()`.   See  the  provided  example  document  for
clarification.

The signature of `entry()` is as follows:

`word-type: str`
: The PoS of the entry.  This must be a PoS defined in `clong-dict()`.
`forms: dict = (:)`
: The  forms  of the entry, if applicable.  All principle forms specified in the
  PoS definition must be included.  Additionally, the special key `other` may be
  used  to provide a `dict` of non-principle forms: the key is the label for the
  form, and the value is the form itself.
`cats: dict = (:)`
: The  categories  of the entry, if applicable.  All categories specified in the
  PoS definition must be included.