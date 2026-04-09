#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": *

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - March 17, 2026",
  date: datetime(year: 2026, month: 3, day: 17),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)





= Riemann Integralet 

Af en og to variable 


#definition[
  Riemann-integralet er altid af funktioner i intervalet fra $[a,b]$, $f: [a,b] -> RR $


  $

integral_a^b f(x) = "område under grafen"
  $

  // billede af område under graf 
  

  Hvor 

  $
  integral f(x) dd(x) = "Stamfunktion til" f(x) 
  $

  $F(x)$ er en differentiabel funktion for hvilket gælder $F'(x)= f(x) $
]


#example[
  $ f: [0, t] -> RR, f(x) = x^2 $

  // Plot med venstre summe

  
  Vi kan indele grafen ind i kasser af samme størrelse, og lave en venstre sum af kasserne.

  $
    V_J &= Delta x dot f(0) + Delta x dot f(t/J) + Delta x dot f(2/J) + dots.c + Delta x dot f((J-1)/J) 
    \  &= t/J 0^2 + t/J (t/J)^2  + t/J (2/J)^2 + dots.c + t/J ((J-1)/J)^2 \ 
    &= t/J^3 (1+2^2 + 3^2 + dots.c + (J-1)^2) <==> t/J^3 dot frac(n (n+1) (2n +1), 6 ) \ &= t/J^3 frac((J-1) J (2J-1),6 ) "hvor" n = J-1 \ 
  2n+1 &= 2(J-1)+1 = 2J - 1 \ 
  &= t/J^3 dot 1/6 (2 J^3 - 3J^2 + j) \ 
  &= t^3/3 - 1/2 dot  t^3/J + 1/6 dot  1/J^2 quad "lad" J -> oo  \ 
  &= t^3/3 
  $


  Præcis på samme måde kan vi lave en højre sum af vores kasser. Uafhængig af om det er højre sum eller venstre sum, så burde arealet blive det samme. 

  $
  H_J &= 1/6 (2 + 3/J - 1/J^2) \ 
  &-> 1/6 (2 + 0 -0) = 1/3 "for" J-> oo
  $


]


#let ee = math.epsilon
  
  Vi har riemann-summer $f: [a,b] -> RR$

  // Talrække fra  a til b


  Vi definere $Delta x_j &= x_j - x_(j-1) $, hvor $a = x_0 < x_1 < x_2 < dots < x_(J-1) < x_j = b $


  Lad $Q_j = [x_(j-1), x_j]$ Vi vælger en tilfældig $xi_j in Q_j$ 

  $
  S_j &= sum_(j=1)^J Delta x_j f(xi_j) \
  &= Delta x_1 f(xi_1) + Delta x_2 f(xi_2) + dots.c + Delta x_J f(xi_J)
  $

#definition(title: "6.1.1")[
  En funktion $f: [a,b] -> RR$ er Riemann-integrabel hvis der findes et tal $M in RR$ således at 

  $
  forall epsilon > 0 exists delta > 0 
  $

  så hvis $Delta x_j < delta$ (for alle $j$) og $xi_j in Q_J $  

  $
  abs(M - s_J) < ee
  $

  Hvis $f$ er Riemann-integrabel så:

  $
  integral_a^b f(x) dd(x) := M
  $

  Vi har reglen om linearitet  


  $
  integral_a^b alpha f(x) + g(x) dd(x) = alpha integral_a^b f(x) dd(x) + integral_a^b g(x) dd(x)
  $
]


#theorem(title: "6.1.1")[
  Lad $f: [a,b] -> RR$. 

  #set enum(numbering: "(i)") 

  1. Hvis $f$ er Riemann-integrabel, så er funktionen $f$ begrænset. $exists c > 0 : abs(f(x)) < c, forall x in [a,b]$
  2.  Hvis $f$ er kontinuert, så gælder det at $f$ er Riemann-integrabel.
]

#theorem(title: "6.2.1 Fundamental Sætningen")[
  #set enum(numbering: "(i)")
  Hvis $f$ er kontinuert på et interval $I subset.eq RR$ så har $f$ en stamfunktion $F(x)$ givet ved 

  $
  F(x) &= integral_(x_0)^x f(t) dd(t) "hvor" x_0 in I
  $
  For $x < x_0$


  // Insert plot
  
  Hvis $x_0 < x$ gælder det at

  $
  integral_(x_0)^x f(x) dd(x) &= - integral_x^x_0 f(x) dd(x)
  $

]


#example(title: "Fortsat")[
  Husk at $f: [0,1] -> RR "og" f(x) = x^2$

  $
  x_0 = 0
  $

  $
  F(x) &= integral_0^x f(t) dd(t) \ 
  &= integral_0^x t^2 dd(t) = [1/3 t^3]_0^x \ 
  &= 1/3 x^3 - 1/3 0^3 = 1/3 x^3
  $

  Hvis vi vælger $x_0 = 1$


  $
  tilde(F)(x) &= integral_1^x t^2 dd(t) \ 
  &= - integral_x^1 t^2 dd(t) \ 
  &= - [1/3 t^3]_x^1 = - (1/3 1^3 - 1/3 x^3) \ 
  &= 1/3 x^3 - 1/3 != F(x)
  $
]

Alle stamfunktioner $F(x) + c, c in RR$ når $F(x)$ er en stamfunktion 

$
c&=integral_a^b f(t) dd(t) &= integral_(x_0)^b f(t) dd(t) + integral_a^x_0 f(t) dd(t)
$

Når $a < x_0 < b$


$
&= integral_(x_0)^b f(t) dd(t) - integral_(x_0)^a f(t) dd(t) \ 
&= F(b) - F(a)
$

#example[
  Lad os udregne integralet $f(x) = x^2$

  $
  integral_0^1 f(x) dd(x) &= F(1) - F(0) &= 1/3 1^3 - 1/3 0^3 = 1/3 
  $

  Eller den omvendte

  $
  integral_0^1 f(x) dd(x) &= tilde(F)(1) - tilde(F)(0) = 1/3 1^3 - 1/3 \ 
  &= - (1/3 0^3 - 1/3) \ 
  &= 1/3 - 1/3 - 0 1/3 + 1/3 = 1/3
  $
]


#example[
  $
  f(x) = 1/x^2, x in [1, oo[, f: [1,oo[ -> RR 
  $


  // Plot


  Giver 

  $
  integral_1^oo f(x) dd(x)
  $

  Mening?


  vi definere 

  $
  integral^oo_1 f(x) dd(x) &= lim_(b->oo) integral_1^b f(x) dd(x)
  $

  Hvor $f$ er kontinuert på $[1, b], b in RR$ og derfor er riemann-int på $[1,b]$


  $
  integral_1^b 1/x^2 dd(x) &= F(6) - F(1) \ 
  $


  #note-box[
    $
    f(x) &= x^(-2) => F(x) &= - x^(-1)
    $
  ]

  $
  &= - (b^(-1) - 1^(-1)) &= - 1/b + 1 -> 1 
  $

  Så 

  $
  integral^oo_1 1/x^2 dd(x) = 1
  $
]


= Riemann-int af flere variable


#let dom(f) = $op("dom")(#f) $


#theorem(title: "6.3.1")[
  Lad $Q &= [a,b] times [c,d] -> RR $

  // Plot
  

  Lad $f: Q -> r, dom(f) = Q $


  $
  integral_Q f(x,y) dd(x,y) = integral_c^d (integral_c^d f(x,y) dd(x))dd(y) = integral_a^b (integral^d_c f(x,y) dd(y)) dd(x)
  $
]



#example[
  $
  f(x,y) &= x^2 cos(y) 
  $

  Hvor $Q &= [0,2] times [0, 1]$


  $
  integral_Q x^2  cos(y) dd(x,y) &= integral_0^1 (integral_0^2 x^2 cos(y) dd(x)  ) dd(y) \ 
  &= integral_0^1 [1/3 x^3 cos(y)]_0^2 dd(y) \
  &= integral_0^1 (1/3 2^3 cos(y) cancel(- 1/3 0^3 cos(y)) )dd(y) \ 
  &=  8/3  integral_0^1 cos(y) dd(y) = 8/3 [sin(y) ]_0^1 \ 
  &= 8/3 (sin(1) - sin(0) ) \ 
  &= 8/3 sin(1)
  $
]


#definition[
  $
  f: B -> RR, B subset.eq RR^2 
  $

// Plot
  #[
  #let dd = dd.with(d: math.Delta)

  $
  dd(x_j), dd(y_j) "som før"
  $

  $
  dd(x_j) &= x_j - x_(j-1)
  $
]
  Så $Q_(i,j) = [x_(i-1), x_i] times [y_(j-1), y_j]   $

  Vi definere vores integral som 

  $
  integral_B f(x,y) dd(x,y)
  $

  Volumen (med fortegn) af området over $B$ "under" grafen. Arealet af $Q_(i,j)$: 

  #[
    #let dd = dd.with(d: math.Delta)
  $
    dd(x_i) dd(y_j) &= (x_i - x_(i-1) )(y_j - y_(j-1))
  $

  Så har vi en funktion $f(xi_(i,j) ) $
]

Så vores integral bliver 

$
integral f(x,y) dd(x,y) &approx sum^J_(i=1) sum^J_(j= 1) f(xi_(i,j)) Delta x_i Delta y_j
$

Vi medtager kun  $Q_(i,j)$ hvis $Q_(i,j) subset.eq B$
]


#example[
  // Plot 
  

  $
  B = { (x,y)  in RR^2 | 0 <= y <= x^2 and x >= 0 }
  $

  $
  f(x,y) &= x y^2 
  $

  $
  integral_B  f(x,y) dd(x,y) &= integral_0^1 integral_0^x^2 x y^2 dd(y,x) \ 
  &= integral_0^1 [1/3 y^3 x]_(y=0)^(y=x^2) dd(x) \  
  &= integral_0^1 1/3 (x^2)^3 x cancel(- 1/3 (0)^3)  dd(x)  \ 
  &= integral_0^1 1/3 x^7 <==> 1/3 integral_0^1 x^7 dd(x) \ 
  &= 1/3 [1/8 x^8]^(x=1)_(x=0) \ 
  &= 1/3 (1/8 1^8 - 1/8 0^8) = 1/3 (1/8 - 0 ) \ 
  &= 1/24
  $


  Vi bruger nu sætning 6.3.2. 

]


#let

