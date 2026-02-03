#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - October 10, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

#set math.mat(delim: "[")

= Key Concepts

#note-box[
  I fremtiden skrives tuplerne af lineære ligningssystemer som

  $
    mat(delim: "[",
      v_1;
      dots.v;
      v_n
    )
  $

  altså en søjle vektor.
]

#let du(v) = $underline(underline(#v))$


Lad os gå tilbage til eksemplet

$
  mat(v_1;v_2;v_3) = mat(0;3;0) + v_3 dot mat(1;-2;1)
$

Men i stedet for $v_3 dot mat(1;-2;1)$ skriver vi $t dot mat(1;-2;1)$

$
  mat(v_1;v_2;v_3) = mat(0;3;0) + t dot mat(1;-2;1)
$

Hvor $t dot mat(1;-2;1)$ er løsmning til det tilhørende homogene system, og $mat(0;3;0)$ er en partikulær løsning.


#definition("6.3.3 (rang af matrix)")[
  Givet en matrix $du("A") in FF^(m crossmark n)$, så defineres $du("A")$'s rang til at være antallet af pivot-elementer i dens reducerede trappeform notation:
  $
    op("rang")(du("A")) = p(du("A"))
  $
]

= Examples

#example[

  $
    cases(
      x_1 + x_2 + x_3 &= 6 \
      x_1 + 2 x_2 + 3 x_3 &= 6
    )
  $

  Hvor

  $
    underline(underline("I")) = mat(delim: "[",
      1, 1, 1, 3;
      1,2,3,6
    ) -->_(R_2 <- R_2 - R_1) mat(
      1,1,1,3;
      0,1,2,3
    ) -->_(R_1 <- R_1 - R_2) mat(1,0,-1,0;0,1,2,3)
  $


  Hvor $du("A")$ er det samme som $du("I")$ uden koefficienter.
]


#example[
  $
    cases(
      x_1 - x_3 &= 0 \
      x_2 + 2 x_3 &= 3
    )
  $


  Hvor $mat(v_1;v_2;v_3)$ er en løsning hvis og kun hvis $v_1 = v_3$ og $v_2 = 3 - 2v_3$

  $
    mat(v_1;v_2;v_3) &= mat(v_3;3-2v_3;v_3) = mat(0;3;0) + v_3 dot mat(1;-2;1) \
  $

  derfra vælges $v_3$ frit fra $RR$.
]

#example[
  $
    cases(
      x_1 + x_2 &= 0 \
      2x_1 + 2x_2 &= 1 \
    ) "over" RR
  $

  Ingen løsninger (Systemet er inkonsistent)


  $
    du("I") = mat(1,1,0;2,2,1) -->_(R_2 <- R_2 - 2R_2) mat(1,0,0;0,0,1)
  $

  Hvilket bliver

  $
    cases(
      x_1 + x_2 &= 0 \
     0 &= 1
    )

  $
  Så vi har altså ingen løsninger.

  Generelt hvis $p(du("I"))$
]





= Important Points



= Questions & Follow-up
