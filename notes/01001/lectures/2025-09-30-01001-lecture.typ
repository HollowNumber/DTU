#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - September 30, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Polynomiet

Et udtryk på formen

$
  p(z) &= a_0 Z^0 + a_1 Z^1 + dots + a_n Z^n
$

hvor

$
  a_0, a_1, dots, a_n in CC
$

Hvis $a_n != 0$ siges $deg(p(z)) = n $

Mængden af såddane betegnes med $CC [Z]$

Er alle koefficienterne reelle tal, så siger vi at polynomiet $p(z)$ er et reelt polynomium.

Mængden af alle reelle polynomier betegnes med $RR[Z]$

#definition("Rødder")[
  Vi har $p(z) in CC [Z]$ givet
  $lambda in CC$ er rod i $p(z)$ hvis $p(lambda) = 0$
]

#example[
  Opgave find 3 pol i $CC[Z]$ som har det komplekse tal $i$ som rod.


  Svar
  $
    p(z) &= Z - i
  $
  Har $i$ som rod da $i - i = 0$

  Et andet polynomiet kunne være

  $
    p(z) &= 1 + Z^2 \
    p(i) &= 1 + i^2 = 1 - 1 = 0
  $

  og
  $
    (1+ Z^2) (Z - i) = 0 dot 0 = 0
  $
]

#lemma[
Lad $p(z)$ være et polynomium  og $lambda in CC$

så er det komplekse tal en rod i $p(z)$ hvis og kun hvis

$
  p(z) = (Z - lambda) dot q(z)
$
For et hvist $q(z) in CC [Z]$
]


#example[
  $p(z) = z^3 - 3 z - 2$

  Givet: $2$ er en rod i $p(z)$

  $
    p(2) = z³ - 3 dot 2 - 2 = 0
  $

  Ifølge lemma, gælder

  $
    p(z) = (z - 2) dot q(z)
  $

  for et $q(z)$, hvor
  $
    q(z) = z^2 + 2z + 1
  $

  $
    z^3 - 3z -2 plus.minus (z-2)dot(z^2 + 2z + 1)
  $

  Kan vi nu finde samtlgige rødder i $p(z)$?


  Bemærk:

  $ p(lambda) = 0 &<==> (lambda -2) dot (lambda^2 + 2 lambda + 1) = 0 \
    &<==> lambda -2 = 0 or lambda^2 + 2 lambda + 1 = 0 \
    &<==> lambda "er rod i" z-2 or (lambda "er rod i" z^2 + 2z + 1) \
    &<==> lambda = 2 or lambda = (-2 plus.minus 0)/2 = -1
  $

  Men hvordan finder vi $q(z)$?

  Ved brug af divisions algoritmen
]

#definition("Division Algoritmen")[

  Et eksempel

  $
    68/3 = 22 2/3
  $
  Men hvorfor?

  I essencen bruger vi long division

  $
    3 div 68 \
    3 dot 20 = 60 \
    3 dot 2 = 6
    "rest" 2
  $

  Så

  $
    68 = 3 dot 22 2
  $

  Hvor

  $
    D = d dot q + r
  $

  Lad os betragte

  $
    z^3 + 2z^2 + 3z + 4
  $

  Hvor divisor $z^2 + 1$


  $
    z^2 + 1 div floor.r z^3 + 2 z^2 + 3z + 4 floor.l z  \
    (z^2 + 1) dot z -> z^3 + z \
    (z^2 + 1) dot 2 -> 2 \
  $
]


#theorem()[
  == Det fundamentale algebraiske sætning

  Lad $p(z) in CC [Z]$ være et polynomium af grad $n >= 1$, da har $p(z)$ en rod i $CC$
]



= Examples



= Important Points



= Questions & Follow-up
