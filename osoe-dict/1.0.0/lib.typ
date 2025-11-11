#import "@preview/nth:1.0.1": nths

#let _dict-has(dict, field) = dict.at(field, default: none) != none
#let _is-falsy(obj) = {
  (obj = ()
    or obj == false
    or obj == bytes()
    or obj == []
    or obj == decimal("0")
    or obj == (:)
    or obj == duration(seconds: 0)
    or obj == float(false)
    or obj == 0
    or obj == none
    or obj == regex("")
    or obj == ""
  )
}
#let _is-empty(obj) = {
  (obj == ()
    or obj == (:)
    or none
  )
}

#let _dict-word-types = state("dict-word-types", (:))
/// Return the dictionary of PoS definitions.  This is preferred to accessing
/// the internal state variable in case of changes to the internals.
///
/// -> dict
#let word-types() = _dict-word-types.get()

/// Format the document for content before the dictionary proper.
///
/// - body (content): 
/// -> content
#let front-matter(body) = {
  set page(columns: 1, numbering: "i")
  counter(page).update(1)
  set par(
    spacing: .65em,
    justify: true,
    first-line-indent: 2em,
  )
  set block(spacing: 1.2em)
  
  set heading(numbering: none)

  body
}

/// Format the document for the dictionary proper.
///
/// - body (content): 
/// -> content
#let main-matter(body) = {
  set page(columns: 2, numbering: "1")
  counter(page).update(1)
  set par(
    spacing: 1.2em,
    justify: true,
    first-line-indent: 0pt,
    hanging-indent: 1em
  )
  set block(spacing: 1.2em)

  set heading(numbering: none)

  body
}

#let _app_numbering(..it) = text(number-type: "lining", numbering("A.", ..it))
/// Format the document for content after the dictionary proper.
///
/// - body (content): 
/// -> content
#let back-matter(body) = {
  set page(columns: 1, numbering: "i")
  counter(page).update(1)

  show heading: set heading(numbering: (..it) => {
    numbering("1.", ..it.pos().slice(1))
  })
  show heading.where(level: 1): set heading(numbering: _app_numbering)
  show heading.where(level: 1): it => {
    pagebreak()
    block[
      #smallcaps[Appendix]
      #counter(heading).display(it.numbering)
      #it.body
    ]
  }
    
  {
    show heading: it => {
      align(center, block(text(2em, font: "Georgia", smallcaps(it.body))))
      v(-1em)
      line(length: 100%)
    }
    outline(
      title: "Appendices",
      target: heading.where(numbering: _app_numbering)
    )
  }

  counter(heading).update(0)

  body
}

/// Generate  the "signature" of a dictionary.
/// - word-type (str): The PoS of the entry.  This must be a PoS defined in 
///   `clong-dict()`.
/// - forms (dict): The forms of the entry, if applicable.  All principle forms
///   specified in the PoS definition must be included.  Additionally, the
///   special key `other` may be used to provide a `dict` of non-principle
///   forms: the key is the label for the form, and the value is the form
///   itself.  Default: `(:)`
/// - cats (dict): The categories of the entry, if applicable.  All categories
///   specified in the PoS definition must be included.  Default: `(:)`
/// -> content
#let entry(
  word-type,
  forms: (:),
  cats: (:),
) = context {
  // assert that the given word type exists
  assert(word-type in _dict-word-types.get(),
    message: "Unknown word type " + repr(word-type) + ".")
  // get the definition of the word type
  let tdef = _dict-word-types.get().at(word-type)

  strong(tdef.sym)
  if _dict-has(tdef, "cats") {  // print word categories if present
    let catstext = ()
    for cat in tdef.cats {
      assert(_dict-has(cats, cat),
        message: "missing category " + repr(cat) + ".")
      catstext.push(cats.at(cat))
    }
    strong[[#catstext.join(",")]]
  }
  if forms != (:) {
    [ (]
    let sections = ()

    if _dict-has(tdef, "infl") {  // print the inflection if present
      sections.push[#nths(forms.infl) #tdef.infl]
    }

    if _dict-has(tdef, "forms") {  // print the principle parts if present
      let formstext = ()
      for (fname, fsym) in tdef.forms {  // iterate over each defined part
        assert(_dict-has(forms, fname),  // assert that the part is present.
          message: "missing principle part " + repr(fname) + ".")
        formstext.push[#fsym #forms.at(fname)]
      }
      sections.push(formstext.join(", "))
    }

    if _dict-has(forms, "other") {  // print non-principle forms if present
      let formstext = ()
      for (fsym, ftext) in forms.other {
        formstext.push[#fsym #ftext]
      }
      sections.push(formstext.join(", "))
    }

    sections.join("; ")
    
    [)]
  }

  [ $bullet$]
}

/// Primary template function
///
/// - body (content):
/// - title (content, str): The title of the document.
/// - subtitle (content, str): The subtitle of the document.
/// - author (content, str): The author(s) of the document.
/// - types (dict): The definitions for all parts of speech in the dictionary.
///   The key is the internal name of the PoS as will be used in `entry()`.  The
///   value is a `dict` with the following keys:
///   
///   - `sym` (`content` or `str`) is the abbreviated name of the PoS, as will be
///     used in dictionary entries.  *This is the only required key.*
///   - `infl` (`content` or `str`) is the label placed after the name of the
///     inflectional paradigm.
///   - `forms` (`dict`) is a dictionary of the principle forms for a PoS, which
///     will be listed for every entry of this PoS.  The keys are `str`s which are
///     the internal name of the principle form as will be used in `entry()`.  The
///    values are `content` or `str`s which are the abbreviated name of the form
///     placed before the form in dictionary entries.
///   - `cats` (`array`) is an array of the categories of the PoS, e.g. noun class
///     or transivity.  The elements of the array are `str`s which are the
///     internal names for the category as will be used in `entry()`.
/// -> content
#let clong-dict(
  title: none,
  subtitle: none,
  author: none,
  types: (:),
  body
) = {
  set page(
    paper: "a4",
    margin: 1.5cm
  )
  set text(8pt,
    lang: "en",
    font: "Charis",
    number-type: "old-style",
    fallback: false,
  )

  set table(
    stroke: none,
  )
  set table.cell(
    align: center,
  )
  show table.cell.where(y: 0): text.with(number-type: "lining")
  _dict-word-types.update(types)

  page(margin: 2.5cm)[
    #set align(center)
    #v(1fr)

    #block[
      #set align(left)
      
      #if subtitle != none {
        text(2em, font: "Georgia")[#emph(smallcaps(subtitle))]

        v(-2em)
        context line(length:
          measure(text(2em, font: "Georgia")[#emph(smallcaps(subtitle))]).width
          + 3em)
        v(-3em)
      }    
      #text(3em, font: "Georgia")[#strong(smallcaps(title))]
    ]

    #v(2fr, weak: true)
    #text(1.2em)[#author]
  ]

  body
}