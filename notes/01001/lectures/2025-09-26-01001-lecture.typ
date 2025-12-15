#import "@local/dtu-template:0.4.3":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - September 26, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Key Concepts


== Sidste gang:

$
  z=  abs(z) dot e^(i arg(z))
$

Hvor modulus har en værdi, men $arg(z)$ har uendelig mange muligheder

$
  op("Arg")(z) + p dot 2 pi (p in ZZ)
$

Da

$
  e^(i 2 pi) &= 1 \
  e^(p 2 pi i) &= (e^(2 pi i) )^p = 1^p = 1
$


=== Polynomier

$ a z^2 + b z + c quad a,b,c in RR a != 0 $

Har rødder

$
  cases(reverse: #true, z_1, z_2) = (-b plus.minus sqrt(D))/(2a)
$

Hvor $sqrt(D) = i sqrt(abs(D))$ hvis $D < 0$

#example[
  Hvis $D < 0$ $z_2 = (-b - sqrt(abs(D)) )/(2a) = - b/(2a) - i dot sqrt(abs(D))/(2a)$
]

#lemma(name: "5.3.1")[
  1. $overline(overline(z)) = z $
  2, $overline(z_1 + z_2) = overline(z_1) + overline(z_2)$
  3. $overline(z_1 dot z_2) = overline(z_1) dot overline(z_2) $
  4. $overline(1/z) = 1/overline(z), z != 0$
  5. $overline(z^n) = (overline(z))^n quad n in ZZ$
]


#lemma[
  Lad $p(z)$ være et reelt polynomiet og lad $lambda in CC$ være en rod i $p(z)$, da er $overline(lambda)$ også rod i $p(z)$
]

#proof[

  $p(z) = a_0 + a_1 Z + dots + a_n Z^n quad a_0, a_1, dots a_n in RR$

  $lambda$ er en rod i $p(z)$

  Det er det samme som at sige

  $
    p(lambda) &= 0 \
    a_0 + a_1 lambda + dots + a_n lambda^n &= 0 \
  $

  Vi kan simplificere dette

  $
    a_0 + a_1 lambda + dots + a_n lambda^n &= 0 <==> \
    overline(a_0)+ overline(a_1 lambda) + dots + overline(a_n lambda^n) = 0 <==> \
    overline(a_0) + overline(a_1) dot overline(lambda) + dots + overline(a_n) overline(lambda) &= 0  <==> \
    overline(a_0) + overline(a_1) dot overline(lambda) + dots + overline(a_n) dot overline(lambda)^n &= 0 <==> \
    (a_0, a_1, dots a_n in RR)  \
    a_0 + a_1 overline(lambda) + a_2 overline(lambda)^2 + dots + a_n overline(lambda)^n &= 0 <==> \
    p(overline(lambda)) &= 0 <==> \

    overline(lambda) "er rod i" p(z)
  $
]

#example[
  Betragt polynomiet $z^2 - 4$, hvor $2$ er en rod i $z^2 - 4$. Derfor er $-2$ også en rod i $z^2 - 4$.

  $
    p(2) &= 2^2 - 4 = 0 \
    p(-2) &= (-2)^2 - 4 = 0 \
  $

  Et andet eksempel $1 + i$ er rod i $z^4 + 4$

  $
    (1 + i)^2 &= i^2 + i^2 + 2i = 2i \
    (1 + i)^4 &= (2i)^2 = 4 i^2 = -4
  $

  Dette medføre at $-1 - i$ også er rod i $z^4 + 4$

  Lemma 5.3.1 er nyttig, hvis vi arbejder med polynomier med reelle koefficienter.


]

Vi betrager kvadratiske polynomier generelt.

$
  a Z^2 + b Z + c quad a,b,c in CC (a != 0)
$

Vi kan finde rødderne

$
  D &= b^2 - 4 a c \
$

Men hvad er $sqrt(D)$ generelt?

Vi skal finde løsninger til ligningen $s^2 = D$ hvor $D in CC$

Har vi en løsning $s$ til $s^2 = D$. Så er $z = (- b + s)/(2a)$ en løsning til

$
  a Z^2 + b Z + c = 0
$

Polær formen af et komplekst tal er nyttig at løse kvadratiske polynomier.

Vi løser $s^2 = D$. Vi skriver $s$ og $D$ på polær form

$
  s &= abs(s) dot e^(i arg (s)) "og" D = abs(D) dot e^(i arg (D)) \
  s^2 = D &<==> abs(s)^2 (e^(i dot arg(s) )^2 = abs(D) dot e^(i dot arg(D) ) \
    &<==> abs(s)^2 e^(i 2 dot arg(s)) = abs(D) dot e^(i arg(D) ) \
    &<==> abs(s)^2 = abs(D) and 2 dot arg(s) = arg(D) + p dot 2 pi quad (p in ZZ) \
    &<==> abs(s) = sqrt(abs(D)) and arg(s) = arg(D)/2 + p pi quad (p in ZZ) \
$

Vi bestemmer løsningerne til $s^2 = D$

$
  p &= 0, s = sqrt(abs(D)) dot e^(i dot arg(D)/2^0  ) \
  p &= 1, s = sqrt(abs(D)) dot e^(i (arg(D)/2 + pi)) = sqrt(abs(D)) dot e^(i arg(D)/2) dot underbracket(e^(i pi), -1) \
  p &= 2, s = sqrt(abs(D)) dot e^(i (arg(D)/2 + 2 pi)) = sqrt(abs(D)) dot e^(i arg(D)/2) dot underbracket(e^(i 2 pi), 1) "Samme løsning som for" p = 0 \
$

Konklusion: $s^2 = D$ har to løsninger ($D != 0$)

$
  s_0 &= sqrt(abs(D)) dot e^(i dot arg(D)/2^0) \
  s_1 &= sqrt(abs(D)) dot e^(i dot arg(D)/2 + pi) = - s_0  \
$

Dermed kan man løse kvadratiske polynomier med komplekse koefficienter ved at bruge polære koordinater.

#example[
  $
    p(z) = z^2 + (1 + i) z + i
  $

  Find rødderne i $p(z)$. Først finder vi diskriminanten

  $
    D &= (1 + i)^2 -4 dot i = 2i -4i = -2i
  $

  Vi kan derefter løse $s^2 = -2 i$. Vi skriver diskriminanten på polære form

  $
    -2i = 2 dot e^(i dot -pi/2)
  $

  $
    s_0 &= sqrt(2) dot e^(i dot - pi/4) \
    s_1 &= - s_0
  $

  $
    s_0 &= sqrt(2) dot (cos(- pi/4) ) + sin(- pi/4 ) i ) \
    &= sqrt(2) dot (1/2 sqrt(2) - 1/2 sqrt(2) dot i) = 1 - i \

    s_1 &= -s_0 = -1 + i
  $

  Dermed har $p(z)$ rødder

  $
    (- (1 + i) + (i-1)  )/2 = - (2i)/2 = - i "og" (- (1 + i) + (-1 + i) )/2 = - 1
  $
]


Den binome ligning:

$
  z^2 = w "hvor" n in NN, w in CC
$

Løs ligningen $z^n = w$. Først skriver vi på polære form for $z$ og $w$

$
  (abs(z) dot e^(i arg(z) ))^n = abs(w) dot e^(i dot arg(w) )
$

Vi kan simplificere

$
  abs(z)^n dot e^(i n dot arg(z)) = abs(w) dot e^(i dot arg(w) )
$

Hvilket er det samme som at sige

$
  abs(z)^n &= abs(w) "og" n dot arg(z) = arg(w) + p dot 2 pi (p in ZZ) \
  abs(z) &= root(n, abs(w)) "og" arg(z) = arg(w)/n + (p 2 pi)/n (p in ZZ) \
$

Løsningerne til $z^n = w$

$
  z_0 &= root(n, abs(w)) dot e^(i arg(w)/n ) \
  z_1 &= root(n, abs(w)) dot e^(i (arg(w)/n + (2pi)/n)) \
  z_(n - 1) &= root(n, abs(w)) dot e^(i (arg(w)/n + (n -1) (2pi)/n)) \
$

Således kan man løse generelle binome ligninger ved at bruge polære koordinater.

#example[
  $z^4 = -4$

  $
    -4 = 4 dot (-1) = 4 dot e^(i pi)
  $

  Vi kan bruge løsningsformlen for binomer.

  $
    z_0 &= root(4, 4) dot e^(i pi/4) = sqrt(2) dot (cos(pi/4) + i sin(pi/4)) = sqrt(2) dot (1/2 sqrt(2) + 1/2 sqrt(2) dot i) = 1 + i \
    z_1 &= root(4, 4) dot e^(i (pi/4 + pi/2)) = sqrt(2) dot (cos(3pi/4) + i sin(3pi/4)) = sqrt(2) dot (-1/2 sqrt(2) + 1/2 sqrt(2) dot i) = -1 + i \
    z_2 &= root(4, 4) dot e^(i (pi/4 + 3pi/2)) = sqrt(2) dot (cos(5pi/4) + i sin(5pi/4)) = sqrt(2) dot (-1/2 sqrt(2) - 1/2 sqrt(2) dot i) = -1 - i \
    z_3 &= root(4, 4) dot e^(i (pi/4 + 5pi/2)) = sqrt(2) dot (cos(7pi/4) + i sin(7pi/4)) = sqrt(2) dot (1/2 sqrt(2) - 1/2 sqrt(2) dot i) = 1 - i \
  $

]


#note-box[
  Man kan huske decimaler af pi ved:

  #dtu-quote[How I need a drink, alcoholic in nature after all these lectures involving complex solutions.]

  Mængden af karaktere i hvert ord er et cifre af pi.
]



= Examples



= Important Points



= Questions & Follow-up
