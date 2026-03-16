#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": *

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - March 10, 2026",
  date: datetime(year: 2026, month: 3, day: 10),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)


= Extremum og Optimering

Optimering er et fag som kun er afbildet i de reelle tal. 

$
f: A-> RR "where" A = "dom"(f) subset.eq RR^n 
$

#theorem(title: "5.1.1")[
  Lad $f: [a,b] -> RR$ være kontinært

  Så antager $f$ en minimumsværdi $m$ og en maksimumsværdi $M$. Hvor $m,M in RR$


  $
  exists x_0 in im(f) : f(x_0) &= m \
  exists x_1 in im(f) : f(x_1) &= M 
  $

  og 

  $
  im(f) = f([a,b]) = [m,M]
  $
]


#example[

  1. 
  Lad 
  $
  f : ]0,1[ -> RR 
  $

  $
  f(x) &= 1/x
  $

  f er kont. på $]0,1[$ da $]0,1[$ er et åbent interval. Så billedet af $f$ er $im(f) =  ]1, oo[$. Så $f$ har ingen min og maks værdi

  2. 

  $
  f : [-2,-1] union [1,2] -> RR 
  $

  $f$ antager minværdi i $x = 2$ med værdien $y_1$ og en maksværdi i $x=-1.5$ med $y_4$. Billedmængden af $f$ bliver 

  $
  im(f) = [y_1, y_2] union [y_3, y_4]
  $
]

Så det lukkede interval er en sammenhængende mængde, det andet vigtige er at det er lukket og begrænset. 


#theorem(title: [5.1.2])[
  #set enum(numbering: "(i)")
Betragt $f: [a,b] -> RR$ hvis $f$ antager et ekstremum i $x_0 in [a,b]$, så findes $x_0$ bland:

1. $x_0 = a$ 
2. $x_0 = b$ 
3. $x_0 in ]a, b[$ hvor $f$ ikke er diff. 
4. $x_0 in ]a,b[$ hvor $f$ er diff. med $f'(x) = 0$
]

#let oint(a,b) = $$


#example[
  $f: [-2, 3] -> RR$

  $
  f(x) = cases((x+1)^2 &quad x in \[-2\,1 \[, 1- x/3 &quad x in [0,3]  )
  $

  $f$ er kont. 


  1. Randpunkte 


  $
  f(-2) &= (-1)^2 = 0  \ 
  f(3) &= 1 -1 = 0 
  $

  2. $f$ er ikke diff i $x_0 = 0$


  $
  f'(x) = cases(2x + 2 &quad x < -2, "undefined" &quad x = 0 , -1/3 &quad x > 0)
  $

  $
  f(0) &= 1-0/3 = 1 
  $


  3. Stationære punkter $f'(x_0) = 0$


  $
  f'(x) &= 0 = 2x + 2 <==> x = -1  \ 

  f(-1) &= 0 
  $


  Så vi finder altså $m = 0$ som antages i $x = 3 and x = -1$, tilsvarende $M = 1$ som antages i $x = -2 and x = 0$. Endvidere, $im(f) = [0,1] $

]


#proof[
  Hvorfor est. $f'(x_0) = 0$. Antages at $f'(x_0) = c < 0$ 

  Vi finder førsteordens taylor polynomium 

  $
  f(x) &= f(x_0) + f'(x_0) (x-x_0) + epsilon(x-x_0)abs(x-x_0)
  $

  Vi antager at $x > x_0$

  $
  &= f(x_0) + underbrace([underbrace(f'(x), = c < 0) + underbrace(epsilon(x-x_0), -> 0)], < 0 "for" x approx x_0)underbrace((x-x_0), > 0 )
  $


  Så har vi altså at 

  $
  f(x) &- f(x_0) < 0 \ 
  f(x) &< f(x_0)
  $


  Modsat hvis vi antager at $x < x_0$
  

  $
  &= f(x_0) + underbrace([underbrace(f'(x), = c < 0) + underbrace(epsilon(x-x_0), -> 0)], < 0 "for" x approx x_0)underbrace((x-x_0), < 0 )
  $


  og vi kan gentage argumentet for $c > 0$.

]


#definition(title: "5.2.3")[
  #set enum(numbering: "i)")

  Betragt $f : A -> RR, A subset.eq RR^n$

  $f$ har et lokalt min i $x_0 in A$ hvis 

  $
  exists epsilon > 0 forall va(x) in A without {x_0}: norm(va(x) -  va(x_0)) < epsilon => f(va(x)) >= f(va(x_0))
  $

  // Vectors 
]


#theorem(title: "5.2.1")[

  Betragt $f : B -> RR, B subset.eq RR^b$, hvor $B = "dom"(f)$ og er afsluttet/lukket og begrænset i $exists delta > 0 B subset.eq B(0,delta)$

  $
  B(va(0), delta) = {va(x) in RR^n : norm(va(x)) < delta}
  $

  Vi antager at $f$ er kont. på $B$ så antager $f$ både minværdi $m$ og maksxærdi $M$. Endvidere, hvis $B$ er sammenhængende så gælder $im(f) = [m,M]$
]

#theorem(title: "5.2.2")[
  #set enum(numbering: "(i)")
  Hvis $f: A -> RR, "dom"(f) = A subset.eq RR^n $ antager ekstremum i $va(x_0) in A$, så skal $va(x_0)$ findes blandt 

  1. $va(x_0) in A inter par A$ (randpunkter i definitionsmængden) 
  2. $va(x_0) in A^0$ (indrepunkt af $A$) og $f$ er ikke diff. 
  3. $va(x_0) in A^0$, $f$ er diff i $va(x_0)$ og $grad f(va(x_0)) = va(0)$ (stationære punkter)
]



#example[
  $
  f: B -> RR, B subset.eq RR^2 
  $

  $
  f(x,y) &= x^4 + y^4 - x^2 + 2 x y - y^2
  $


  Hvor vores $"dom"(f) = B = {(x,y) in RR^2 | x^2 + y^2 <=2^2 and x <= 0 and y >=  0 }$

  // Cirkel skive
  //


  $
  par B = {"I","II", "III", dot, dot, dot}
  $


  $
  "I"&: x = 0, 0 < y  < 2  
  $

  $
  f(x,y) &= f(0,y) = y^4 - y^2, y in ]0,2[  \ 
  g_"I"(y) &= y^4 - y^2  \ 
  g_"I"'(y) &= 4 y^3 - 2y = 2y(2y^2 - 1) = 0 \ 
  &<==> 2y^2 - 1 = 0 <==> y^2 = 1/2 <==> y = plus.minus 1/sqrt(2)
  $

  Men kun $y = 1/sqrt(2)$ tilhører $]0,2[$

  $
  g_"I" (1/sqrt(2) ) = (frac(1, sqrt(2)))^4 - (frac(1, sqrt(2)))^2 = 1/4 - 1/2 = 1/4 
  $

  #let oint(a,b) = $lr(\]#a, #b\[)$
  #let cint(a, b) = $[#a, #b]$

  For rand nummer to: 

  $
  "II": y = 0, 0 < x < 2 
  $

  Vi kan parametisere rand 2 ved $r_"II" (t) = (t,0), t in oint(-2, 0) $


  $
  g_"II" (t) &= f compose r_"II" (t) = f(r_"II" (t)) \ 
  f(t,0) &= t^4 - t^2  \
  g_"II" '(y) = 0 => t = 1/sqrt(2)
  $


  $
  f(1/sqrt(2), 0) = g_"II" (1/sqrt(2)) =- 1/4
  $


  Rand 3. 


  $
  "III": 
  $


  $
  r_"III" (t) &= (2 cos (t), 2 sin (t)), t in oint(pi/2, pi) \ 
  g_"III" (t) &= f compose r_"III" (t)  = f(r_"III" (t) ) \ 
  &= f(2 cos(t), 2 sin(t) ) \ 
  &= 16 (cos(t))^4 + 16 (sin(t))^4 - 4(cos(t))^2 + 8 cos(t) sin(t)-4(sin(t))^2 \ 
  &=  16 cos^4 (t) + 16 sin^4 (t) + 8 cos(t) sin(t) - 4, t in oint(pi/2, pi) \ 

  g_"III" ' (t) &= (cos(t) sin(t) )' \ 
  &= (-sin(t))sin(t) + cos(t) cos(t) \ 
  &= - sin^2 (t) + cos^2(t) \
  &= dots = 32 (1/4 - overbrace( 2 cos(t) sin(t), sin(2t)) ) dot (underbrace(cos^2 (t) - sin^2 (t), cos(2t) ) ) = 0 \ 
f(-sqrt(2), sqrt(2)) &=  g_"III" (3/4 pi) = dots = 0 
  $

  #definition(title: "Idiotformlen")[
    $
    (cos(t))^2 + (sin(t))^2 = 1
    $
  ]

  Vi kan nu finde vores tre hjørner


  $
  f(0,0) &= 0 \ 
  f(0,2) &= 2^4 - 2^2 = 16-4 = 12\ 
  f(-2,0) &= 2^4 - 2^2 = 16 - 4 = 12 
  $


  Der er ingen undtagelses punkter, da funktionen er differentiabel over alt. 


  Vi kan nu beregne de statinære punkter. 


  $
  grad f(x, y) &= vec(4 x^3-2x+2y, 4y^3 +2x-2y) = vec(0,0) \ 
  &=> 4 x^3 + 4y^3 = 0 \ 
  &=> x^3 = -y^3  \ 
  &=> x = -y
  $

  Vi smider tilbage ind i gradienten 

  $
  &4x^3 - 2x + 2(-x) = 4x^3 -4x \
  &= 4 x(x^2 - 1) = 0 <==> x = 0 or x = plus.minus 1 
  $


  Så har vi følgende stationære punkter: 


  $
  (0,0), (1,-1),(-1,1)
  $

  Før vi kan sætte dem ind i vores funktion skal vi se om punkterne tilhører $B$ 

  $
  (0,0) in B, (1,-1) in.not B, (-1,1) in B
  $

  $
  f(-1,1) &= dots = -2  \ 
  f(0,0) &= 0 
  $

  Så vi har at vores minimumsværdi $m = - 1/4$ som antages i punkterne $(0, 1/sqrt(2)), (1/sqrt(2), 0)$, tilsvarende har $f$ maksværdi $M = 12$ som antages i punkterne $(0,2), (-2,0)$

]
