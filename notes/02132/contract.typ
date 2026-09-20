#set terms(hanging-indent: 1.5em)

#set table(
  inset: 6pt,
  stroke: none,
)

#let horizontalRule = line(start: (25%, 0%), end: (75%, 0%))
// Polyfill divider to allow compiling with typst < 0.15:
#let divider = if "divider" in std { divider } else { horizontalRule }

#show figure.where(
  kind: table,
): set figure.caption(position: top)

#show figure.where(
  kind: image,
): set figure.caption(position: bottom)

#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}
#let conf(
  title: none,
  subtitle: none,
  authors: (),
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: none,
  fontsize: 11pt,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  pagenumbering: "1",
  doc,
) = {
  set document(
    title: title,
    keywords: keywords,
  )
  set document(
    author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set page(
    paper: paper,
    margin: margin,
    numbering: pagenumbering,
    columns: cols,
  )

  set par(
    justify: true,
    leading: linestretch * 0.65em,
  )
  set text(lang: lang, region: region, size: fontsize)

  set text(font: font) if font != none
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none

  set heading(numbering: sectionnumbering)

  show link: set text(fill: rgb(content-to-string(linkcolor))) if linkcolor != none
  show ref: set text(fill: rgb(content-to-string(citecolor))) if citecolor != none
  show link: this => {
    if filecolor != none and type(this.dest) == label {
      text(this, fill: rgb(content-to-string(filecolor)))
    } else {
      text(this)
    }
  }

  if title != none {
    place(top, float: true, scope: "parent", clearance: 4mm, block(below: 1em, width: 100%)[
      #if title != none {
        align(center, block[
          #text(weight: "bold", size: 1.5em, hyphenate: false)[#title #if thanks != none {
              footnote(thanks, numbering: "*")
              counter(footnote).update(n => n - 1)
            }]
          #(
            if subtitle != none {
              parbreak()
              text(weight: "bold", size: 1.25em, hyphenate: false)[#subtitle]
            }
          )])
      }

      #if authors != none and authors != [] {
        let count = authors.len()
        let ncols = calc.min(count, 3)
        grid(
          columns: (1fr,) * ncols,
          row-gutter: 1.5em,
          ..authors.map(author => align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ])
        )
      }

      #if date != none {
        align(center)[#block(inset: 1em)[
          #date
        ]]
      }

      #if abstract != none {
        block(inset: 2em)[
          #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
        ]
      }
    ])
  }
  doc
}
#show: doc => conf(
  abstract-title: [Abstract],
  pagenumbering: "1",
  cols: 1,
  doc,
)


#strong[Group contract]

#strong[Course 02132 -- Computer Systems]

#strong[Instructions:] Fill up the #emph[Questionnaire on group work]
individually (one questionnaire per group member). Compare and discuss
the results while filling up this contract. Use the questions in the
OBJECTIVES, EXPECTATIONS, POLICIES & PROCEDURES, and EXPECTATIONS boxes
as guidelines. Submit the contract in the Assignment facility on
DTU-Learn.

#figure(
  align(center)[#table(
    columns: (20.57%, 79.43%),
    align: (auto, auto),
    table.header(
      [Group members],
      [Member 1 name and student number

        Member 2 name and student number

        Member 3 name and student number

      ],
    ),
    table.hline(),
    [Group number], [Number from DTU-Learn],
    [Group name], [Choose your own group name],
  )],
  kind: table,
)

#figure(
  align(center)[#table(
    columns: 99.9%,
    align: (auto,),
    table.header([OBJECTIVES]),
    table.hline(),
    [What are our team goals for this project?

      What skills do we want to develop or refine?

      What grade do we aim for?

    ],
  )],
  kind: table,
)

#figure(
  align(center)[#table(
    columns: 99.9%,
    align: (auto,),
    table.header([EXPECTATIONS]),
    table.hline(),
    [What do we expect of one another in regard to:

      - Attendance to group work and meetings?

      - Frequency of communication/meetings?

      - Type of communication/meetings (online/physical)?

      - Division of work (who does what)?

      - The quality of work?

    ],
  )],
  kind: table,
)

#figure(
  align(center)[#table(
    columns: 99.9%,
    align: (auto,),
    table.header([POLICIES & PROCEDURES]),
    table.hline(),
    [What are the rules on how we meet our objectives and expectations?

      What are the roles of the members of the group?

      What are the tools we plan to use (software, communication tools,
      etc.)?

      How is information stored?

      How do we make and agree on design decisions?

    ],
  )],
  kind: table,
)

#figure(
  align(center)[#table(
    columns: 99.9%,
    align: (auto,),
    table.header([CONSEQUENCES]),
    table.hline(),
    [What happens when a member of the group is not collaborating as
      agreed upon in terms of OBJECTIVES, EXPECTATIONS, and
      POLICIES/PROCEDURES?],
  )],
  kind: table,
)

We share and agree to these OBJECTIVES, EXPECTATIONS, POLICIES &
PROCEDURES, and EXPECTATIONS.

#figure(
  align(center)[#table(
    columns: (24.98%, 75.02%),
    align: (auto, auto),
    table.header([Date], [-\-/-\-/-\-\-\-]),
    table.hline(),
    [Signature member 1], [#strong[Member 1]],
    [Signature member 2], [#strong[Member 2]],
    [Signature member 3], [#strong[Member 3]],
  )],
  kind: table,
)
