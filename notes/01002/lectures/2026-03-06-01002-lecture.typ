#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": *

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - March 06, 2026",
  date: datetime(year: 2026, month: 3, day: 6),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)


== Grænseovergange via Taylor


$
f in C^(k+1) = cases( frac(f^(k+1) (xi), (k+1)!), epsilon_(k,f,x_0) (x-x_0)(x-x_0)^k   ) 
$


#example[
$
h(x) = sin(x)/x
$

$
P_3 (x) &= x  + - 1/3! x^3 = x - 1/6 x^3
$

Ved brug af Peano's form

$
f(x) = sin(x) = x - 1/6 x^3 + epsilon_3 (x) dot x^3
$

$
sin(x)/x &= frac(x - 1/6 x^3 + epsilon_3 (x) x^3, x )
\ &= frac(1 - 1/6 x^2 + epsilon_3 (x) x^2, 1 ) \ 
&= 1 - 1/6 x^2 + epsilon_3 (x) x^2 \ 
&-> 1 - 0 -0 = 1 "for" x->0
$

]

#example[
  $k = 1$
  $
  sin(x) = x + epsilon_1 (x) x
  $


  $
  sin(x)/x &= (x + epsilon_1 (x) x)/x \ 
  &= 1 + epsilon_1 (x) -> 1 + 0 = 1 
  $

  For $x -> 0$


  Vi finder $epsilon_1$ ved isolering 

  $
  epsilon_1 (x) = frac(sin(x)- x, x), x != 0 
  $
]


#example[
  $
 frac( sin(x) - x, x^3) &=_(k=1) frac(x + epsilon_1 (x) dot x - x, x^3) \ 
 &= frac(epsilon_1 (x) x, x^3) = (epsilon_1(x))/x^2 -> ? \ 
 $

 Da vi har ingen ide hvad dette udvikler sig imod, kan vi lave en højere ordens taylor Approksimation

 $
 (sin(x) -x )/x^3 &=_(k =3)  frac(x - 1/6 x^3 + epsilon_3 (x) x^3 - x, x^3) \ 
 &= (- 1/6 x^3 + epsilon_3 (x) x^3)/x^3  \ 
 &= frac(- 1/6 + epsilon_3 (x) , 1 ) = - 1/6 + epsilon_3 (x) \ 
 &->  -1/6 + 0 = -1/6 "for" x-> 0 
 $
]

#example[
  $
  frac(sin x - x, e^x - 1 - x - 1/2 x^2)
  $


  $
  e^x &= underbrace(1 + x + 1/2 x^2 + 1/6 x^3, = P_(3,e^x, 0) (x) ) + epsilon_1 (x) x^3 
  \ sin x &= x - 1/6 x^3 + epsilon_2(x) x^3 
  $

  Vi beregner 

  $
  frac(sin x - x, e^x - 1 - x - 1/2 x^2) &= frac(- 1/6 x^3 + epsilon_2 (x) x^3, 1/6 x^3 + epsilon_1 (x) x^3) \ 
  &= frac(- 1/6 + epsilon_2 (x), 1/6 + epsilon_1 (x)) -> frac(- 1/6 + 0, 1/6 + 0) = -1
  $

]







== Minima og Maxima via 2. Grads Taylor Approksimation  

#example[

  $
  f: RR^2 -> RR 
  $

 $
  f(x, y) = x^3 + y^3 + x^2 + y^2 + 1 
  $


  $
  grad f(x,y) &= vec( 3x^2 + 2x, 3 y^2 + 2y ) \ 

  vb(H)_(p) (x,y) &= mat(6 x +2 , 0; 0, 6y + 2 )
  $

  
Vi vælger at $(x_0, y_0) = (0,0) $


$
grad f (0,0) &= vec(0,0)
vb(H)_f (0,0) = dmat(2,2 ,fill: 0, delim: "[" )
$

Så vores andengrads taylor polynomium bliver: 

$
P_2 (x,y) &= f(0,0) + grad f(0,0) vec(x-0, y-0) + 1/2 vecrow(x-0, y-0, delim: "[") vb(H)_f (0,0) vec(y-0, y-0)
\ &= 1+  1/2 (2 x^2 + 2 y^2) = 1 + x^2 + y^2 
$


$
f(x, y) &= P_2 (x,y) + epsilon_2(x,y) norm(vec(x,y))^2 
$

Hvor normen er 

$
norm(vec(x,y))^2 &= (sqrt(x^2 + y^2) )^2 = x^2 + y^2
$

$
f(x,y) &= 1+  x^2 + y^2 + epsilon_2 (x,y) (x^2 + y^2 ) 
\ &= 1 + overbrace(1 + epsilon_2 (x,y), > 0)  (x^2 + y^2 )
\ &>= f(0,0) "for" (x,y) "tæt på"  (0,0)
$

Så $(0,0)$ er altså et minima for funktionen $f(x,y)$

En betingelse som er nødvendig for minima og maxima er 

$
grad f(va(x)) = va(0)
$

]

#proof[
Antag $va(grad)f(va(x)) eq.not va(0)$ Lad $va(e) = 1/(norm(va(grad) f(va(x))) va(grad)f (va(x)))$

$va(h) = t va(e), quad t in RR$ Af diff følger:
$
f(va(x)_0 + va(h)) &= f(va(x)_0) + va(grad) f(va(x))^T va(h) + epsilon(va(h)) norm(va(h))\
&= f(va(x)_0) + t norm(va(grad)f (va(x))) + epsilon(t va(e)) |t|\
&= f(va(x)_0) + t (norm(va(grad)f (va(x))) plus.minus epsilon(t va(e)))
$
]



= Important Points



= Questions & Follow-up

