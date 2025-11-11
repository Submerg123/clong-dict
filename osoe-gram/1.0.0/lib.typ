#import "@preview/nth:1.0.1": nths
#import "@preview/tblr:0.4.1": *

#let is-par-indented = true
#let toggle-par-indented = {
  if is-par-indented {
    set par(first-line-indent: 0em)
  } else {
    set par(first-line-indent: 2em)
  }
  is-par-indented = not is-par-indented
}
#let no-indent(body) = context {
  let _prev = par.first-line-indent
  set par(first-line-indent: 0em)
  body
  set par(first-line-indent: _prev)
}

#let lining(body) = text(number-type: "lining", body)

#let exmp(script, rom, pron, morphs, gloss, trans) = {
  let cols = morphs.split().len() + 1
  block(breakable: false, [
    #script\
    #rom\
    #pron
    #tblr(
      //stroke: black,
      columns: cols,
      align: bottom+left,
      inset: 0pt,
      column-gutter: 2em,
      row-gutter: .65em,
      rows(0, hooks: emph),
      rows(1, hooks: (raw, it => it.trim(regex("[\"\[\]]")), repr)),
      //table.cell(colspan: cols+1, script),
      //table.cell(colspan: cols+1, emph(rom)),
      //table.cell(colspan: cols+1, pron),
      ..morphs.split(), [],
      ..gloss.split(), [],
      table.cell(colspan: cols, trans),
    )
  ])
}

#let sc(body) = smallcaps(body)

#let backmatter(body) = {
  counter(page).update(1)
  set page(numbering: "i")
  set heading(numbering: none)

  body
}

#let clong-grammar(
  title: none,
  subtitle: none,
  author: none,
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

  show link: underline
  set table(
    stroke: none,
    align: center+horizon
  )
  show table.cell.where(y: 0): text.with(number-type: "lining")

  set enum(
    full: true, // necessary to receive all numbers at once, so we can know which level we are at
    numbering: (..nums) => {
      let nums = nums.pos()  // just positional args
      let num = nums.last()  // just the current level’s number
      let level = nums.len()  // level is the amount of numbers available

      // format for current level (or stop at i. If going too deep)
      let format = ("1.", "a.", "i.").at(calc.min(2, level - 1))
      let result = numbering(format, num) // formatted number
      if level < 3 { // first 2 levels for example
          text(number-type: "lining", result)
      } else {
          result
      }
    }
  )

  show heading: set heading(supplement: "Subsection") // default for lvl > 2
  set heading(numbering: (..it) =>
    text(number-type: "lining", numbering("1.1", ..it)))
  show heading.where(level: 1): set text(size: 11.2pt)
  show heading.where(level: 1): set heading(supplement: "Chapter")
  show heading.where(level: 2): set text(size: 9.6pt)
  show heading.where(level: 2): set heading(supplement: "Section")
  show heading.where(level: 3): set text(size: 9.6pt, weight: "medium")
  show heading.where(level: 4): set text(size: 9.6pt, style: "italic", weight: "regular")

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

  set par(
    spacing: .65em,
    justify: true,
    first-line-indent: 2em,
  )
  set block(spacing: 1.2em)

  set page(numbering: "i")
  counter(page).update(1)

  page(outline())

  set page(numbering: (..nums) =>
    text(number-type: "lining", numbering("1", nums.at(0))))
  counter(page).update(0)

  body
}