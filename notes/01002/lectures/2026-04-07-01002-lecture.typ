#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": *

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - April 07, 2026",
  date: datetime(year: 2026, month: 4, day: 7),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)

#show math.phi: math.phi.alt


= Key Concepts

#definition(title: "Spheriske Koordinater")[
  Hos spheriske koordinater er det ligesom polære koordinater, undtagen at vi tilføjer en tredje variabel $phi.alt$

  $
  r sin theta dd(phi)
  $

  Så i stedet for $x,y,z$ har vi $r,theta,phi$
]


== Integration over "tynde" områder


#example[
  Vi tager en helix som eksempel.

  $
  va(r): [0, 2pi] -> RR^3
  $


  En helix funktion er defineret ved
  $
  va(r)(u) = vecrow(cos(u), sin(u) , u), u in [0, 2pi]
  $

  Vi bruger Jacobi-matricen til at finde ... 


  $
  J_va(r)(u) = va(r)'(u) = vecrow(- sin(u), cos(u), 1)
  $

  Hvilket egentlig er vores hastighedsvektor. 
]

#definition(title: [7.2.1, $m=1$])[

  $
  integral_C f(va(x)) dd(va(s)) &= integral_a^b f(va(r) (u) ) dot norm(va(r)'(u)) dd(u) \ 
  cal(l)(C)  &= integral_C 1 dd(va(s) ) \ 
  &= integral_a^b norm(r'(u)) dd(u) \ 

  norm(va(r)'(u)) &= sqrt(underbrace((sin(u))^2 + (cos(u))^2 , 1 ) + 1^2 )   = sqrt(2) \ 

  cal(l)(C) &= integral_0^(2pi) sqrt(2) dd(u) = [sqrt(2) dot u ]^(u = 2 pi)_(u=0) = sqrt(2) dot (2pi - 0) = sqrt(2) 2pi
  $


  Vi kunne derimod også vælge en anden parametisering, vi vælger 
  $
  tilde(r)(u) = vecrow(cos(u^2), sin(u^2), u^2 ), u in [0, sqrt(2pi)]
  $


  Vi finder $tilde(r)'$

  $
  tilde(r)'(u) &= vecrow(-2u sin(u^2), 2 u cos(u^2), 2u ) \ 
  $
  Vi antager at dette er korrekt, men vi kan verificere ved at se om 

  $
  integral_C 1 dd(s) = sqrt(2) dot  2pi
  $


  Lad $va(r): Gamma -> RR^n, Gamma = [a,b]$ være kontin uert og stykkevis $C^1$-afb. Vi antager at $norm(r'(u)  ) != 0 $ for alle $u in ]a, b[ = Gamma^circle$, hvis $norm(r'(u) ) != 0 $ siges det at kurven er regulær. 
]

Hvor kommer $norm(r'(u) )$ fra?

Den kommer fra taylor udvikling.



#example[
  Vi vil gerne finde længden af en kurve. 

  Men først kan vi finde massefylden af kurven ved:

  $
  f(x,y) = cases(y &quad (x,y) in C, 0 &quad (x,y) in.not C )
  $

  Så 

  $
  M &= integral_C f(x,y) dd(va(s)) \ 
  C &= Set((x,y), x^2 + y^2 = 2^2 and y >= 0 )
  $

  $
  va(r)(u) &= vecrow(2 cos (u), 2 sin(u)), u in [0,pi] \ 
  va(r)'(u) &= vecrow(- 2 sin(u), 2 cos(u) ) \ 
  norm(r'(u) ) &= sqrt(2^2 sin^2(u) + 2^2 cos^2(u)  ) = 2 sqrt(sin^2(u) + cos^2(u)  ) = 2 sqrt(1) = 2
  $

  Vi regner vores kurve integrale 


  $
  M &= integral_C y dd(va(s)) = integral_0^pi 2 dot sin(u) dot 2 dd(u) \ 
  &=  4 [- cos(u) ]_(u=0)^(u=pi) = 4 (-cos(pi) + cos(0)) \ 
  &= 4 dot 2 = 8 
  $

]


== Vektorfelt 

$n = k$

$
va(V) : U -> RR^n, U subset.eq RR^n "åbent delmængde"
$


kurven


$
C &= Set(va(r)(u), u in [a,b] )   \ 
va(r)(u) &= vecrow(1,u,u^2) , u in [0,2] \ 
va(r)'(u) &= vecrow(0,1,2u)
$

Vi finder nu projektionen af vektorfeltet $va(V)$ på tangentvektoren:

$
iprod(va(V)(va(r)(u) ), frac(va(r)'(u),norm(r' (u)) ))
$


$
integral  iprod(va(V)(va(r)(u) ), frac(va(r)'(u),norm(r' (u))   )) underbrace(norm(r'(u)), "jacobi-faktoren") dd(u) &= integral iprod(va(V)(va(r)(u) ), va(r)'(u) ) dd(u) = integral_C va(V) dot dd(va(s)) 

$



#example[
  $va(V): RR^2 -> RR^2$


  $
  va(V) (x,y) = vec(y/3, - x/3)
  $


  hvor $y = x^2, x in [0,2]$, vi parametisere ved $x = u$ 

  $
  va(r)(u) &= vec(u,u^2), u in [0,2]
  $

  Vi beregner hastighedsvektoren 

  $
  va(r)'(u) &= vec(1, 2u)
  $

  Vi finder så længden af hastighedsvektoren

  $
 cancel( norm(va(r)'(u) ) = sqrt(1 + (2u)^2) = sqrt(1 + 4u^2) != 0)
  $

  Dette er egentlig spildt arbejde, og vi har slet ikke brug for at beregne normen i vektorfelter. Vi kan altså bare finde integranden efter vi har fundet vores hastighedsvektoren

  $
  iprod(va(V)(va(r) (u) ), r'(u)  ) = iprod(vec(u^2/3, - u/3), vec(1,2u) ) = u^2/3 + (-u/3) dot 2u = - 1/3 u^2 
  $

  Vi kan nu integrere $- 1/3 u^2$


  $
  integral_C va(V) dot dd(va(s) ) &= integral_0^2 - 1/3 u^2 dd(u) \ 
  &=  [- 1/9 u^3]_(u=0)^(u=2) \ 
  &= - 1/9 2^3 - (- 1/9 0^3) \ 
  &= - 8/9
  $
]

