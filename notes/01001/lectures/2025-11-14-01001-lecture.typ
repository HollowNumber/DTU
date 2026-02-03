#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - November 14, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall",
)

= Key Concepts
#set math.vec(delim: "[")
#set math.mat(delim: "[")

== Koordinatvektorer og afbildningsmatricer

Givet en ordnet basis $beta = (v_1, dots, v_n)$ for et vektorrum $V$ over $FF$, og en ordnet basis $gamma = (w_1, dots, w_m)$ for et vektorrum $W$ over $FF$.

For en vektor $bold(v) in V$ gælder at koordinatvektoren $amat(bold(v), , beta) in FF^n$ er givet ved:

$
  amat(bold(v), , beta) = vec(c_1, dots.v, c_n) in FF^n <==> bold(v) = c_1 dot v_1 + dots.c + c_n dot v_n
$

Tilsvarende for en vektor $bold(w) in W$ gælder:

$
  amat(bold(w), , gamma) = vec(d_1, dots.v, d_m) in FF^m <==> bold(w) = d_1 dot w_1 + dots.c + d_m dot w_m
$

Givet en lineær afbildning $L : V -> W$, så er afbildningsmatricen $amat(L, gamma, beta)$ defineret således at:

$
  amat(L, gamma, beta) dot amat(v, , beta) = amat(L(v), , gamma)
$

#note-box[
  I dag bruges afbildningsmatricen $amat(L, gamma, beta)$ til at beregne $ker(L)$ og $im(L)$, og til at løse ligningen $L(bold(v)) = bold(w)$ for $bold(w) in W$.
]

== Beregning af $ker(L)$ og $im(L)$

Når vi har en bestemt lineær afbildning givet ved en matrix:

$ L_bold(A) : FF^n &-> FF^m\ bold(v) &mapsto bold(A) dot bold(v) $

#note-box[
  Så er kernen:
  $ker(L_bold(A)) &= {bold(v) in FF^n | bold(A) dot bold(v) = bold(0)} \ &= ker(bold(A)) $

  og billedet (image):

  $ im(L_bold(A)) &= {bold(w) in FF^m | bold(w) = bold(A) dot bold(v) "for et" bold(v) in FF^n} \
                &= op("colsp")(bold(A)) $

  og dimensionssætningen siger:

  $
    dim(ker(bold(A))) + dim(op("colsp")(bold(A))) = n
  $
]

Generelt for en lineær afbildning:

$
  L: V -> W
$

Er kernen defineret som:

$
  ker(L) = {bold(v) in V | L(bold(v)) = bold(0)}
$

Vi kan beregne kernen ved hjælp af afbildningsmatricen. En vektor $bold(v) in V$ er i kernen hvis og kun hvis:

$
  bold(v) in ker(L) &<==> L(bold(v)) = bold(0) <==> amat(L(bold(v)), , gamma) = amat(bold(0), , gamma) = vec(0, dots.v, 0) \
                    &<==> amat(L, gamma, beta) dot amat(bold(v), , beta) = vec(0, dots.v, 0) \
                    &<==> amat(bold(v), , beta) in ker(amat(L, gamma, beta))
$

Tilsvarende for billedet har vi:

$
  bold(w) in im(L) <==> amat(bold(w), , gamma) in op("colsp")(amat(L, gamma, beta))
$

== Løsning af ligninger

#theorem(
  title: "11.4.1",
)[
  Ligningen $L(bold(v)) = bold(w)$ betragtes.

  1. Hvis $bold(w) in.not im(L)$ så har ligningen ingen løsninger
  2. Hvis der findes $bold(v)_p in V$ så $L(bold(v)_p) = bold(w)$, så er løsningsmængden givet ved:

  ${bold(v)_p + bold(v)_h | bold(v)_h in ker(L)}$

  #note-box[
    Dette gælder fordi:
    $
      L(bold(v)_p + bold(v)_h) = L(bold(v)_p) + L(bold(v)_h) = bold(w) + bold(0) = bold(w)
    $

    Hvor $bold(v)_p$ er en partikulær løsning til den inhomogene ligning $L(bold(v)) = bold(w)$, og $bold(v)_h$ er løsning til det tilhørende homogene ligning $L(bold(v)) = bold(0)$.
  ]
]

= Examples

#example[
  Lad os betragte vektorummet:

  $
    V    &= {a + b Z + c Z^2 | a, b, c in RR} \
    beta &= (1, Z, Z^2) "Ordnet basis for" V \
  $

  Så er $beta$-koordinatvektoren for et polynomium $a + b Z + c Z^2$ givet ved:

  $
    amat(a + b Z + c Z^2, , beta) = vec(a, b, c)
  $

  Lad os nu betragte vektorummet $W = RR^2$ med ordnet basis:

  $
    gamma = (vec(1, 0), vec(0, 1))
  $

  Så er $gamma$-koordinatvektoren:

  $
    amat(vec(k, l), , gamma) = vec(k, l)
  $

  Vi definerer nu den lineære afbildning:

  $
    L : V &-> W \
    p(Z)  &mapsto vec(p(1), p(2))
  $

  Lad os nu beregne afbildningsmatricen $amat(L, gamma, beta)$. Dette gøres ved at beregne $L$ for hvert basisvektor i $beta$:

  $
    amat(L, gamma, beta) &= mat(amat(L(1), , gamma), amat(L(Z), , gamma), amat(L(Z^2), , gamma)) \
                         &= mat(vec(1, 1), vec(1, 2), vec(1, 4)) \
                         &= mat(1, 1, 1;1, 2, 4)
  $

  === Beregning af kernen

  Vi kan nu bruge afbildningsmatricen til at beregne kernen. Først beregner vi reduceret trappeform af afbildningsmatricen:

  $
    amat(L, gamma, beta) = mat(1, 1, 1;1, 2, 4) -> mat(1, 1, 1;0, 1, 3) -> mat(1, 0, -2;0, 1, 3)
  $

  Så gælder:

  $
    vec(a, b, c) in ker(amat(L, gamma, beta)) <==> cases(a - 2c &= 0, b + 3c &= 0) <==> vec(a, b, c) = vec(2c, -3c, c) = c dot vec(2, -3, 1), c in RR
  $

  Derfor:

  $
    a + b Z + c Z^2 in ker(L) <==> a + b Z + c Z^2 = c dot (2 - 3 Z + Z^2), c in RR
  $

  Dvs.

  $
    ker(L) = op("span")_RR (2 - 3Z + Z^2)
  $

  === Beregning af billedet

  Billedet $im(L)$ bestemmes ved:

  $
    op("colsp")(amat(L, gamma, beta)) &= op("span")_RR (vec(1, 1), vec(1, 2)) \
    im(L)                             &= op("span")_RR (vec(1, 1), vec(1, 2)) \
                                      &= RR^2
  $

  Dimensionssætningen er opfyldt:

  $
    dim(ker(L)) + dim(im(L)) = 1 + 2 = 3 = dim(V)
  $
]

#example[
  Fortsættelse af forrige eksempel...

  Givet den samme lineære afbildning:

  $
    L : V                  &-> RR^2 \
    p(Z) = a + b Z + c Z^2 &mapsto vec(p(1), p(2))
  $

  Vi løser ligningen $L(p(Z)) = vec(3, 1)$.

  Dette er ækvivalent med:

  $
    L(bold(v)) = bold(w) &<==> amat(L(bold(v)), , gamma) = amat(bold(w), , gamma) \
                         &<==> amat(L, gamma, beta) dot amat(bold(v), , beta) = amat(bold(w), , gamma)
  $

  Altså skal vi løse:

  $
    mat(1, 1, 1;1, 2, 4) dot vec(a, b, c) = vec(3, 1)
  $

  Ved brug af reduceret trappeform fås:

  $
    amat(L, gamma, beta) vec(a, b, c) = vec(3, 1) &<==> cases(a - 2c = 5, b + 3c = -2) \
                                                  &<==> vec(a, b, c) = vec(3c + 5, -3c - 2, c) = vec(5, -2, 0) + c dot vec(2, -3, 1), c in RR
  $

  Dvs. ligningen $L(p(Z)) = vec(3, 1)$ har løsningerne:

  $
    p(Z) &= a + b Z + c Z^2 \
         &= underbracket(5 - 2Z, "partikulær løsning") + underbracket(c dot (2 - 3Z + Z^2), "løsninger til" L(p(Z)) = vec(0, 0)), c in RR
  $
]

#math-problem(number: "1")[
  Om en linear afbildning $L : RR^4 -> RR^3$ vides at billedrummet $im(L)$ har en ordnet basis $beta$ givet ved

  $
    beta = (vec(1, 3, 2), vec(1, -1, 2))
  $

  === Spørgsmål a

  Tilhører vektorerne

  $
    v = vec(1, 2, 3) "og" w = vec(2, 2, 4)
  $

  Billedrummet $im(L)$?
]

#solution[
  Siden $beta$ er en basis for $im(L)$, gælder:

  $
    im(L) = op("span")_RR (vec(1, 3, 2), vec(1, -1, 2))
  $

  En vektor tilhører $im(L)$ hvis og kun hvis den kan skrives som en linearkombination af basisvektorerne.

  *For $v = vec(1, 2, 3)$:*

  Vi tjekker om der eksisterer $c_1, c_2 in RR$ således at:

  $
    c_1 vec(1, 3, 2) + c_2 vec(1, -1, 2) = vec(1, 2, 3)
  $

  Dette giver:

  $
    cases(c_1 + c_2 &= 1, 3c_1 - c_2 &= 2, 2c_1 + 2c_2 &= 3)
  $

  Fra ligning 1 og 2: $c_1 = 3/4$ og $c_2 = 1/4$

  Tjek ligning 3: $2 dot 3/4 + 2 dot 1/4 = 2 != 3$

  Derfor: $v in.not im(L)$

  *For $w = vec(2, 2, 4)$:*

  $
    cases(d_1 + d_2 &= 2, 3d_1 - d_2 &= 2, 2d_1 + 2d_2 &= 4)
  $

  Fra ligning 1 og 2: $d_1 = 1$ og $d_2 = 1$

  Tjek ligning 3: $2 dot 1 + 2 dot 1 = 4$ ✓

  Derfor: $w in im(L)$
]
