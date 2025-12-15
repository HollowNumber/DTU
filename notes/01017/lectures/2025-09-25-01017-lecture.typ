#import "@local/dtu-template:0.4.3":*

#show: dtu-note.with(
  course: "01017",
  course-name: "Discrete Mathematics",
  title: "Lecture - September 25, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

#set enum(numbering: "(i)")

//  Sections 4.1 and (a bit of) 4.3

= Divisibility and Modular Arithmetic

== Division

#definition("1")[
  If $a$ and $b$ are integers with $a != 0$, we say that $a$ _divides_ $b$ if there is an integer $c$ such that $b = a c$ (or equivalently if $b/a$ is an integer).
  When $a$ _divides_ $b$ we say that $a$ is a _factor_ or _divisor_ of $b$, and that $b$ is a _multiple_ of $a$. The notation $a divides b$ denotes that $a$ _divides_ b. We write $a divides.not b$ when $a$ does not divide $b$.
]

#example[
  We determine whether $3 divides 15$, $4 divides 16$ and $3 divides 7$.

  So we see that $3 divides 15$, $4 divides 16$ and $3 divides.not 7$.
  That is because $15 slash 3 = 5$ and $16 slash 4  = 4$.
  However $7 slash 3 = 2.3 overline(3)$ which is not an integer.
]

#theorem(name: "1")[
  Let $a,b$ and $c$ be integers, where $a != 0$. Then

  1. if $a | b$ and $a | c$, then $a | (b + c)$
  2. if $a | b$, then $a | b c$ for all integers
  3. if $a | b$ and $b | c$, then $a | c$.
]

= Examples



= Important Points



= Questions & Follow-up
