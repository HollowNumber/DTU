#import "@local/dtu-template:0.4.3":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - November 04, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Key Concepts

Givet et vektorrum $V$ over et legeme $FF$

#definition("10.1.1")[
  Er vektorrum $V$ er en mængde hvorpå der er defineret en addition og en skalar multiplikation, således at

  1. $underline(u) + (underline(v) + underline(w)) = (underline(u) + underline(v)) + underline(w) $
  2. $ underline(u) + underline(v) = underline(v) + underline(u)$
  3. Der findes en vektor $ underline(0)  <= V$ således at $underline(0) + underline(u) = underline(u)$
  4. For enhver $underline(u) in V$, findes et additiv invers $-underline(u)$ således at $underline(u) + (-underline(u)) = underline(0)$
  5. $c (d dot underline(u)) = (c dot d) dot underline(u)$, for alle $c,d in FF$ og $underline(u) in V$
  6. $1 dot underline(u) = underline(u)$
  7. $c dot (underline(u) + underline(v)) = c dot underline(u) + c dot underline(v)$
  8. $(c + d) dot underline(u) = c dot underline(u) + d dot underline(u)$
]


= Examples

#example[
  Vektorrumet kan være $V = RR^n$ hvor legemet $FF = RR$
]

#example[
  $V = RR^(m times n)$, $FF = RR$

  $
    underline(0) = mat(0, dots)
  $


]

= Important Points



= Questions & Follow-up
