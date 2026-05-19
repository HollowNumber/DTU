#import "@local/dtu-template:0.6.3":*
#import "@preview/callisto:0.2.4"
#import "@preview/mitex:0.2.6": mitex
#import "@preview/cmarker:0.1.8"
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/physica:0.9.8": *
#import "@preview/quill:0.7.2": *
#import "@preview/unify:0.7.1": qty, unit, num, numrange, qtyrange

#set text(lang: "da")

#show: dtu-physics-note.with(
  course: "10060",
  course-name: "Physics (Polytechnical Foundation)",
  title: "Potentiel Energi og Energibevarelse - Lecture - April 13, 2026",
  date: datetime(year: 2026, month: 4, day: 13),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

= Opsummering fra lektion 8

Fra forrige lektion (arbejde og energi):

- Arbejde af konstant kraft: $W = va(F) dot va(s) = F cos phi dot s$
- Arbejde af positionsafhængig kraft: $W = integral_(x_1)^(x_2) F(x) dd(x)$
- Fjederkraftens arbejde: $W_"fjeder" = 1/2 k x_1^2 - 1/2 k x_2^2$
- Arbejdssætningen: $W_"tot" = Delta K = K_2 - K_1$, hvor $K = 1/2 m v^2$
- Effekt: $P = Delta W \/ Delta t = F v$

= Energiformer

#definition(title: "Energi")[
  Energi er evnen til at udføre arbejde. Energien er bevaret, den kan kun omdannes fra én form til en anden.

  #note-box()[
    Centrale energiformer:
    - Kinetisk energi: $E = 1/2 m v^2$
    - Potentiel energi: $E = m g h$
    - Elektrisk energi: $E = I U Delta t = U^2/R Delta t$
    - Kerneenergi: $E = m c^2$
    - Strålingsenergi: $E = hbar omega$
    - Indre energi (termisk): $E = c_v N T$
  ]
]

= Konservative og ikke-konservative kræfter

#definition(title: "Konservativ kraft")[
  En *konservativ kraft* er enhver kraft, for hvilken arbejdet $W$ langs enhver lukket vej er lig nul:
  $
    integral.cont va(F) dot dd(va(r)) = 0
  $
  Ækvivalent: arbejdet fra $A$ til $B$ er uafhængigt af vejen:
  $
    W_(A B) = integral_A^B va(F) dot dd(va(r))
  $
]

#note-box(
  title: "Eksempler",
)[
  - *Gravitation* er en konservativ kraft, arbejdet kan konverteres til kinetisk energi ($W = Delta K$).
  - *Friktion* er *ikke* en konservativ kraft, arbejdet kan ikke konverteres til kinetisk energi ($W eq.not Delta K$).
]

= Potentiel energi

#definition(title: "Potentiel energi (generelt)")[
  Ændringen i potentiel energi defineres som det negative arbejde udført af den konservative kraft:
  $
    Delta U_(A B) = - integral_A^B va(F) dot dd(va(r))
  $
  Og dermed: $W_(A B) = -Delta U_(A B)$

  #note-box()[
    Fortegnregler:
    - Kraft og vej i *modsat* retning: $va(F) dot Delta va(r) < 0 => Delta U > 0$ (energi lagres)
    - Kraft og vej i *samme* retning: $va(F) dot Delta va(r) > 0 => Delta U < 0$ (energi frigives)
  ]
]

== Tyngdefeltets potentielle energi

I 1D med $va(F)_g = (0, -m g)$:
$
  Delta U = -F(x_2 - x_1) = m g Delta y
$

Absolut (med $U = 0$ ved $y = 0$):
$
  U = m g h
$

== Elastisk potentiel energi (fjeder)

Med Hookes lov $F(x) = -k x$:
$
  Delta U = -integral_(x_1)^(x_2) (-k x) dd(x) = 1/2 k x_2^2 - 1/2 k x_1^2
$

#definition(title: "Elastisk potentiel energi")[
  $
    U = 1/2 k x^2
  $
  Minimumsenergi ved ligevægtspunktet $x = 0$. Symmetrisk parabolsk potential.
]

= Bevarelse af mekanisk energi

#definition(title: "Mekanisk energibevarelse")[
  Når *kun konservative kræfter* udfører arbejde:
  $
    Delta K + Delta U = 0 quad => quad K + U = "konst"
  $
  Eller ækvivalent:
  $
    K_1 + U_1 = K_2 + U_2
  $
]

#example[
  *Elefantbedøvelse (fjeder → kinetisk energi):*

  Initial tilstand: $K_0 = 0$, $U_0 = 1/2 k x^2$.
  Final tilstand: $U = 0$ (fjeder afspændt), $K = 1/2 m v^2$.

  Energibevarelse giver:
  $
    1/2 m v^2 = 1/2 k x^2 quad => quad v = sqrt(k/m) dot x
  $
]

#example[
  *Fjeder og tyngdekraft:*

  En komprimeret fjeder ($U_s = 1/2 k x_0^2$, $K_0 = 0$) sender en klods op til højde $h$ ($K = 0$, $U_g = m g h$):
  $
    1/2 k x_0^2 = m g h quad => quad h = (k x_0^2)/(2 m g)
  $
]

= Den udvidede energisætning

Når ikke-konservative kræfter (f.eks. friktion) også er til stede:

#definition(title: "Udvidet energibevarelse")[
  $
    K_1 + U_1 + E_"int" = K_2 + U_2
  $
  hvor $E_"int"$ er den indre energi (varme) genereret af ikke-konservative kræfter.

  Mekanisk energi kan omdannes til varme ved gnidning/friktion.
]

#example[
  *Klods på ru overflade (fjeder + friktion):*

  Fjederpotentiale $U_0 = 1/2 k x_0^2$ omsættes til kinetisk energi, som derefter dissiperes af kinetisk friktion $f_k = mu m g$:
  $
    1/2 k x_0^2 = mu m g Delta x quad => quad Delta x = (k x_0^2)/(2 mu m g)
  $
]

= Kræfter og potentiel energi

#definition(title: "Kraft fra potentiel energi")[
  I én dimension er kraften den negative afledte af den potentielle energi:
  $
    F(x) = -(dv(U(x), x))
  $
  Generelt (3D): $va(F) = -grad U$
]

#note-box(title: "Fortolkning")[
  - $dv(U, x) = 0$ svarer til $F = 0$: *ligevægtspunkt*
  - Lokalt minimum i $U$ → stabil ligevægt (partikel skubbes tilbage)
  - Lokalt maksimum i $U$ → ustabil ligevægt
  - Nær et minimum ligner enhver potentialbrønd en fjeder (harmonisk approksimation)
]

== Eksempler

*Tyngdefelt* ($U = m g y$):
$
  F_y = -(dv(U, y)) = -m g
$

*Fjeder* ($U = 1/2 k x^2$):
$
  F_x = -(dv(U, x)) = -k x quad checkmark
$

== Lennard-Jones potential

Beskriver vekselvirkning mellem to neutrale atomer:
$
  U(x) = 4 U_0 lr([(x_0/x)^12 - (x_0/x)^6])
$

- $(x_0/x)^6$-leddet: tiltrækkende (van der Waals)
- $(x_0/x)^12$-leddet: frastødende (Pauli-princippet)
- Nær minimumsposition: $F_x(x) approx -k(x - x_"min")$ → fjeder-approksimation

= Quiz-gennemgang

*Partikel bevæger sig fra $x = d$ i negativ $x$-retning langs en U(x)-kurve.*

- *Størst hastighed ved?* → $x = b$ (minimum i $U$, maks $K$ ved energibevarelse)
- *Decelererer ved?* → $x = a$ (kurven stiger, $F$ modvirker bevægelsen)
- *Nulkraft ved?* → $x = b$ og $x = d$ (lokale ekstrema, $dv(U, x) = 0$)

= Opsummering

#note-box(title: "Centrale resultater")[
  - Konservativ kraft: $integral.cont va(F) dot dd(va(r)) = 0$
  - Potentiel energi: $Delta U_(A B) = -integral_A^B va(F) dot dd(va(r))$
  - Tyngdepotential: $U = m g h$
  - Fjederpotential: $U = 1/2 k x^2$
  - Mekanisk energibevarelse (kun konservative kræfter): $Delta K + Delta U = 0$
  - Udvidet energibevarelse: $K_1 + U_1 + E_"int" = K_2 + U_2$
  - Kraft fra potential: $F(x) = -dv(U(x), x)$
]

