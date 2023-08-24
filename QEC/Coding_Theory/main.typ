#let chap_counter = counter("chap_counter")

#let chapter(title) = [
        #chap_counter.step()
        #set align(center)
        #set text(20pt)
        #line(length: 100%)
        Chapter #counter("chap_counter").display(): *#title*
        #line(length: 100%)
        #v(25pt)
    ]

#set heading(numbering: (..nums) => counter("chap_counter").display() + "." +
                                    nums.pos().map(str).join("."))

#set heading(outlined: true)

#set page(
        paper: "us-letter",
        numbering: "1",
    )

#set par(justify: true)
#set text(
        font: "Linux Libertine",
        size: 11pt,
     )


#let title = "Notes on Coding Theory"
#let author = "Edward Kim"
#let last_updated = "Summer 2023"


#block(height:25%,fill:none)
#align(center, text(17pt)[#title])
#align(center, text(12pt)[#author])
#align(center, text(10pt)[#last_updated])
#block(height:35%,fill:none)

#pagebreak()
#outline()
#pagebreak()

#chapter[Linear Codes]

#include "linear_codes.typ"

