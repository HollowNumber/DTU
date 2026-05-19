#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": *

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - April 10, 2026",
  date: datetime(year: 2026, month: 4, day: 10),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)

= Stamfunktionsproblemet

Lad $U$ være en åben delmængde af $RR^n$. $V: U -> RR^n$ (kontinuert) vektorfelt.

Lad $f: U -> RR$ Som $CC^1$-funktion (kontinuerbart differentiabelt) med 

$

grad f(va(x)) = va(V)(va(x)) quad forall va(x) in U
$

Kaldes en stamfunktion (hvis den findes), og $va(V)$ så er et gradientfelt.

#example[

  $
  va(V): RR^2 -> RR^2, quad va(V)(x,y) = vec(0, - m g)
  $

  // drawing, hvor længde = m g

  $
  f(x,y) &= - m g y \ 
  grad f(x,y) = vec(0, -m g)
  $
]

#example[

  $
va(V): RR^2 -> RR^2, quad va(V)(x_1, x_2) &= vec(1/3 x_2, - 1/3 x_1) \ 
&<==> mat(0, 1/3; -1/3, 0) vec(x_1, x_2)
  $
]

Kan vi differentiere eksemplet overfor?


#solution[
  $
    r(u) &= vecrow(cos(u), cos(u) ), quad u in [0, 2pi] \
    r(0) &= vecrow(1,0), r(2pi) = vecrow(1,0) \ 
    r'(u) &= (-sin(u), cos(u))
  $

  $
  iprod(V(r(u)), r'(u) ) &= iprod(vec(1/3 sin(u), - 1/3 cos(u)), vec(- sin(u), cos(u)) ) \ 
  &= 1/3 sin^2 (u) - 1/3 cos^2(u) \ 
  &= - 1/3 (sin^2(u) + cos^2(u)) = - 1/3 
  $


  Vi integrere over vektorfeltet 

  $
  integral_C V dd(s) &= integral_a^b iprod(V(r(u)), r'(u) ) dd(u) \ 
  &= integral_0^(2pi) - 1/3 dd(u) = - (2pi)/3
  $

  Her kan vi allerede se, at det tyder på at funktionen ikke er differentiabelt. Dette bringer os til Lemma 7.3.2 og 7.3.3
]


#lemma(name:  "7.3.2 & 7.3.3")[
  Hvis $V$ er $C^1$ og et gradient-felt, så er $J_V(x)$ symmetrisk. Hvis $U$ er stjerneformet gælder der også at hvis $J_v(x)$ er symmetrisk så er $V$ et gradientfelt.
]

#proof()[
    Hvis $va(grad)f = va(V) = vec(V_1, V_2, V_3)$, så er $J_(va(V))(va(x))$ givet ved:
    $
      J_(va(V))(va(x)) = mat(
        pdv(V_1,x_1), pdv(V_1,x_2), dots.c;
        pdv(V_2,x_1),dots.down;
        dots.v,,pdv(V_n,x_n)
      )
    $


    $
      grad f &= V \ 
      pdv(f, x_i) &= V_i quad i = 1,dots,n \ 
      "Så" \
      pdv(f, x_i, x_j) &= pdv(V_i, x_j) \ 
      pdv(V_1, x_2) &= pdv(f, x_1, x_2) = pdv(f, x_2, x_1) = pdv(V_2, x_1)

    $

    Dermed er $J_v(x)$ symmetrisk.
  ]


  Så vi går tilbage til eksempel 2. 

  #example[
    $
    J_v (x) &= mat(0, 1/3; -1/3, 0)
    $

    Vi kan allerede se, at jacobi-matricen ikke er symmetrisk så dermed er $V$ ikke et gradientfelt.
  ]


  #lemma(name: "7.4.1")[
    Hvis $V: U -> RR^n$ er et gradientfelt (dvs $grad f (x) = V(x)  $) gælder: 

    $
    f(r(b)) - f(r(a)) = integral_C V dot dd(s)
    $

    Hvor $r: [a,b] -> RR^n$ er et parametisering af kurven $C$.
  ]


Vi prøver at finde en kurve fra $(0,0,0,dots,0) = va(0)$ til $va(x) &= (x_1, x_2, x_3, dots, x_n)$ (valgt vilkårligt)

$
r(a) &= va(0) \ 
r(b) &= va(x) \ 
f(va(x) ) - f(va(0)) &= integral_a^b  V(r(u)) dot r'(u) dd(u) \ 
f(va(x) ) &= integral_a^b V(r(u) ) dot r'(u) dd(u) + f(va(0)) 
$


#example[
  $
  V: RR^2 -> RR^2, V(x,y) = vec(y +y^2, x+ 2x y) 
  $


  $
  r: [0,1] -> RR^2, quad r(u) = u dot vec(x,y), r'(u) = vec(x,y)
  $

$
f(x) &= integral_0^1 V(r(u)) dot r'(u) dd(u) + c \ 
&= integral_0^1 iprod(vec(u y + (u y)^2, u x + 2u x u y ), vec(x,y) )  dd(u) + C \ 
&= integral_0^1  2x y u + 3 x y^2 u ^2  dd(u) + C \ 
&= 2 x y integral_0^1 u dd(u) + 3 x y^2 integral_0^1 u^2 dd(u) \ 
&= 2 x y [1/2 u^2]_0^1 + 3 x y^2 [1/3 u^3]_0^1 \ 
&= 2 x y dot 1/2 + 3 x y ^2 dot 1/3 + C \ 
&= x y + x y^2 + C
$

Vi udregner gradienten for at verificere 

$
grad f(x,y) = vec(y + y^2 + 0, x + 2 x y)
$

Hvilket stemmer overens, den anden måde at verificere er at verificere om jacobi-matricen er symmetrisk.


$
J_v (x) &= mat(0, 1+2 y; 1+2 y, 2 x)
$
]



= Opgaver



