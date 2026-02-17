#import "@local/dtu-template:0.6.2":*
#import "@preview/cetz:0.4.2"

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - February 10, 2026",
  date: datetime(year: 2026, month: 2, day: 10),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)

=  Concepts

== Repetition

=== Kontinuitet af vektorfunktioner

#note-box[
  Medmindre andet er skrevet antag: differentiabilitet og kontinuitet.


  Dette gælder ikke for stykkevis funktioner.
]


== Jacobi-matricer & kædereglen

Betragt en funktion af en variable:

$
f: I -> RR^1, "åbent interval"
$

Hvor $I =  ]a,b[ in RR^1$


$
arrow(f): u -> RR^k "åben mængde"
$

Intuitivt vil det sige at $u subset.eq RR^k$

#definition(title: "Diff kvotient")[

  Diff kvotient af skalar funktioner

  $
 f'(x_0)= lim_(h -> 0)  (f(x_0 + h) - f(x_0))/(h), x_0 in I
  $

]


#definition(title: "Jacobi matricen")[

  $
  J_arrow(f) (arrow(x_0)) in RR^(k times n), arrow(x_0) in u
  $


  Hvor $arrow(x_0)$ er altså en matrice
]


$f'(x_0)$ er relevant hvis grænsen ($*$) eksistere. Vi skriver $arrow(f)(x)$ som en søjle vektor:

$

arrow(f)(x) = vec(f_1(arrow(x)), f_2(arrow(x)), dots.v, f_k(arrow(x)))
$


Så:

$
J_arrow(f)(arrow(x_0)) &= mat(
    (partial f_1)/(partial x_1), (partial f_1)/(partial x_2), dots, (partial f_1)/(partial x_n);
    (partial f_2)/(partial x_1), (partial f_2)/(partial x_2), dots, (partial f_2)/(partial x_n);
    dots.v, dots.down, dots.down, dots.v;
    (partial f_k)/(partial x_1), dots, dots, (partial f_k)/(partial x_n)
  ) \ 
&= vec(nabla f_1(x)^T, nabla f_2(x)^T, dots.v, nabla f_k(x)^T) in RR^(k times n)
$

Hvor $k = 1$, $f: u -> RR$, $u subset.eq RR^n$: 


$
J_f(x) = nabla f(x)^T
$

Hvor $f(x)$ bliver til en rækkevektor


$
k=1, n&=1, f: I -> RR, I subset.eq RR \
J_f(x) &= mat(f'(x))
$

#example[
  $
  f: RR -> RR, f(x) = (2x-1)^2 = 4x^2 - 4x + 1
  $

  Udregning af den afledede:

  $
  f'(x) &= 2(2x-1) dot 2 \
  &= 8x - 4
  $
  
  Alternativt, ved at udvide først:
  
  $
  f(x) &= 4x^2 - 4x + 1 \
  f'(x) &= 8x - 4
  $
]

#theorem(title: "3.84 Generaliseret kæderegel")[

  Hvis $arrow(f): u -> RR^k$ er differentiabel i $arrow(x_0)$ og $arrow(g): v -> RR^lambda$ er differentiabel i $arrow(y_0) = arrow(f)(arrow(x_0))$, så er den sammensatte funktion $arrow(h) = arrow(g) circle.small arrow(f)$ differentiabel i $arrow(x_0)$ med Jacobi-matrix:

  $
  J_arrow(h)(arrow(x_0)) = J_arrow(g)(arrow(y_0)) J_arrow(f)(arrow(x_0))
  $

  Hvor $J_g(y_0) in RR^(lambda times k)$, $J_f(x_0) in RR^(k times n)$ og $J_h(x_0) in RR^(lambda times n)$

  Specialtilfælde for skalare funktioner ($k=1, n=1$):

  $
  k&=1, n=1 \
  h'(x_0) &= g'(y_0) f'(x_0) \
  &= g'(f(x_0)) f'(x_0)
  $
]


#example[
  $
  h(x) &= (2x-1)^2 \
  f(x) &= 2x-1 \
  g(y) &= y^2, quad g'(y) = 2y
  $
  
  Ved kædereglen:
  
  $
  h'(x) &= g'(f(x)) dot f'(x) \
  &= 2(2x-1) dot 2 \
  &= 8x - 4
  $
]


#example(title: "3.7.1")[
  $
  f: RR -> RR^2, f(x) = vec(sin(x), cos(x))
  $

  $
  g: RR^2 -> RR, g(y_1, y_2) = y_1^2 + y_2
  $

  Her er $n = 1, k = 2, lambda = 1$

  Den sammensatte funktion:

  $
  h(x) &= g(f(x)), quad h: RR -> RR \
  &= (sin(x))^2 + cos(x)
  $

  Ved brug af den generaliserede kæderegel:

  Jacobi-matricen for $f$:

  $
  J_f(x) &= vec(f_1'(x), f_2'(x)) \
  &= vec(cos(x), -sin(x)) in RR^(2 times 1)
  $

  Jacobi-matricen for $g$:

  $
  J_g(arrow(y)) &= nabla g(arrow(y))^T \
  &= mat(2y_1, 1) in RR^(1 times 2)
  $

  Jacobi-matricen for den sammensatte funktion:

  $
  J_h(x) &= J_g(f(x)) J_f(x) \
  &= mat(2y_1, 1) vec(cos(x), -sin(x)) \
  &= 2 y_1 cos(x) + 1 dot (-sin(x)) \
  &= 2 sin(x) cos(x) - sin(x)
  $
]


#note-box[
  Alternativ komposition hvor outputdimensionen ændres:
  
  $
  arrow(k): RR -> RR^2, quad k(x) = f(g(x))
  $
  
  Hvor $g: RR -> RR$ og $f: RR -> RR^2$
  
  $
  J_k(x) &= J_f(g(x)) J_g(x) \
  &= vec(cos(g(x)), -sin(g(x))) mat(g'(x)) \
  &= vec(cos(g(x)) dot g'(x), -sin(g(x)) dot g'(x)) in RR^(2 times 1)
  $
]


== Lineære afbildninger

 $
 L : RR^n -> RR^k 
 $


 $

 L(c x + d y ) &= 
 c L(x) + d L(y) 
 $


Hvor: $x,y in RR^n, c, d in RR$ (hvor $x$ og $y$ er vektorer)



Omskrevet som:
$
A in RR^(k times n) \ 
L(x) &= A x \
A &= amat(L, e, e)
$

$k = 1, n= 2, L(x) = L(x_1, x_2) = a_1 x_1 + a_2 x_2  = mat(a_1, a_2) vec(x_1, x_2) = a^T x $ (hvor $x$ og $a$ er vektorer) 

== Differentiabilitet


#example[
  $n = 1, k = 1$

  $
  f: I -> RR \
  I subset.eq RR
  $

  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      
      // Draw axes
      line((-1, 0), (6, 0), mark: (end: "stealth"), name: "x-axis")
      content((6.3, 0), text(size: 10pt, $x$))
      line((0, -0.5), (0, 4), mark: (end: "stealth"), name: "y-axis")
      content((0, 4.3), text(size: 10pt, $f(x)$))
      
      // Draw a curve (smooth function)
      bezier((0.5, 0.5), (5, 3.5), (2, 1.2), (4, 2.8), stroke: (paint: blue, thickness: 1.2pt))
      
      // Mark x_0
      let x0 = 2.5
      let fx0 = 1.5
      line((x0, 0), (x0, fx0), stroke: (dash: "dotted"))
      content((x0, -0.3), text(size: 9pt, $x_0$))
      circle((x0, fx0), radius: 0.08, fill: red)
      line((0, fx0), (x0, fx0), stroke: (dash: "dotted"))
      content((-0.4, fx0), text(size: 9pt, $f(x_0)$))
      
      // Mark x_0 + h
      let x0h = 4
      let fx0h = 2.5
      line((x0h, 0), (x0h, fx0h), stroke: (dash: "dotted"))
      content((x0h, -0.3), text(size: 9pt, $x_0 + h$))
      circle((x0h, fx0h), radius: 0.08, fill: red)
      line((0, fx0h), (x0h, fx0h), stroke: (dash: "dotted"))
      content((-0.5, fx0h), text(size: 9pt, $f(x_0+h)$))
      
      // Draw secant line
      line((x0, fx0), (x0h, fx0h), stroke: (paint: green, thickness: 1pt, dash: "dashed"))
    })
  ]

  Hvis:
  $
  lim_(h->0) (f(x_0 + h) - f(x_0) )/h 
  $

  Eksistere så siges det at $f$ er differentiabel i punktet $x_0$ med diff kvotient $f'(x_0)$
]


#lemma(name: "3.6.1")[
For $f: I -> RR$ er flg ækvivalent: 

1. $f$ er diff $x_0$ med $f'(x_0) = c$
2. $f(x_0 + h) - f(x_0) - c h - epsilon (h) abs(h) = 0 $ 


Der findes en $epsilon: RR -> RR$ med $epsilon(0) = 0, epsilon(h) -> 0 "når" h -> 0 $ 
]


#proof[
  Vi antager at $h > 0$, vi antager at punkt 2 gælder

  $

  epsilon(h) h &= f (x_0 + h) - f(x_0) -c h  \ 
  epsilon(h) &= (f(x_0 + h) - f(x_0) )/h - c, epsilon -> 0\
  "derfor" &= (f(x_0 + h) - f(x_0) )/h -> c "for" h -> 0
  $

  Hvor $c = f'(x_0)$


  $
  h mapsto c h, RR -> RR
  $

  Er en lineærfunktion.


  Hvis vi ignorer epsilon får vi altså:

  $
  f(x_0 +h) - f(x_0) &approx c h \ 
&= L(h)
  $
]


=== Differentiabilitet af vektorfunktioner 


#definition(title: "3.8.1")[
  $
  f: u -> RR^k, u subset.eq RR^n "er diff"
  $

  i $x_0 in u$ hvis der eksistere en lineær afb. $L : RR^n -> RR^k$ og $epsilon: RR^n -> RR^k$ så $epsilon(h) -> 0 "for" h->0$

  $
  epsilon(0) &= 0 \ 
  f(x_0 + h) - f(x_0) - L(h) - epsilon(h) norm(h) = 0 
  $


  For alle $h in RR^n$ den lineær afbild. $L : RR^n -> RR^k$  

  $
  L(h) &= J_f (x_0) h \
  $


  #example(title: "3.8.1")[
    $ f: RR^n -> RR^k $ er givet ved 

    $
    f(x) &= A x,  "hvor" A in RR^(k times n)
    $


    $
    J_f (x) = A, forall x in RR^n 
    $



    $
    f(x_0 + h) - f(x_0) &= \
    A(x_0 + h) - A x_0 &= A h 
    $

    Vælg $L(h) = A h$ og $epsilon(h) = 0 $


    $

    f(x_0 +h) - f(x_0) - L(h) - 0 norm(h) &= A dot arrow(h) - A dot h - arrow(0) \
    &= arrow(0)  \  
    $

  ]
]



#example[
  $f: RR^2 -> RR, f(x_1, x_2) = sqrt(abs(x_1 x_2) )  $


  $
  (par f)/(par x_1) (0,0)
  $


  $"dom"(f) = RR^2$

  

  $
  (par f)/(par x_1) (0,0) = 0, (par f)/(par x_2) (0,0) = 0
  $


  Er $f$ diff i $(0,0)$?



  Betragt $x_2 = x_1$


  $
  f(x_1, x_1) = sqrt(abs(x_1 x_1)) = abs(x_1)
  $


  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Draw axes
      line((-3, 0), (3, 0), mark: (end: "stealth"))
      content((3.3, 0), text(size: 10pt, $x_1$))
      line((0, -0.5), (0, 3), mark: (end: "stealth"))
      content((0, 3.3), text(size: 10pt, $abs(x_1)$))
      
      // Draw abs(x) function - V shape
      line((-2.5, 2.5), (0, 0), stroke: (paint: blue, thickness: 1.5pt))
      line((0, 0), (2.5, 2.5), stroke: (paint: blue, thickness: 1.5pt))
      
      // Mark the origin
      circle((0, 0), radius: 0.1, fill: red)
      content((0.4, -0.3), text(size: 9pt, $(0,0)$))
      
      // Add note about non-differentiability
      content((0, -1), text(size: 8pt, [Ikke differentiabel i $x_1 = 0$]))
    })
  ]

  Der findes ikke en lineær funktion $L(h)$ der beskriver $f$ "godt" i punktet $(0,0)$



  $
  J_f (0,0) &= mat( (par f)/(par x_1) (0,0), (par f)/(par  x_2) (0,0)) \ 
&= mat(0, 0) \ 
&= L(h) = mat(0, 0) vec(x_1, x_2) = 0 dot x_1 + 0 dot x_2 = 0 
  $
]



= Opgaver

== Jacboi-matricer for forskellige funktioner

=== A 

1. Lad $f(x_1,x_2,x_3) = x_1^2 x_2 + 2x_3$. Beregn Jacobi-matricen $J_f(x)$ og evaluer den i punktet $x = (1,-1,3)$. Bekræft at jacobi-matricen for en skalar funktion af flere variable kun har en række.

#solution[

  Fra vores input får vi at $f:  RR^3 -> RR$, så dermed bliver vores jacobi matrice $1 times 3$

  Vi skriver jacobi matricen op:

  $
  J_f (x) = mat( (par f)/(par x_1), (par f)/(par x_2), (par f)/(par x_3))
  $


  Vi finder den partialle afledte af alle tre:

  $
   (par f)/(par x_1) &= 2x_1 dot x_2 + 0 \
   (par f)/(par x_2) &= x_1^2 \ 
   (par f)/(par x_3) &= 2 
  $


  Vi har altså så at:

  $
  J_f (x) &= mat(2 x_1 dot x_2, x_1^2, 2)
  $


  Vi kan nu evaluere i $(1,-1,3)$

  $
  J_f (1,-1,3) &= mat(2 (1) dot (-1), 1^2, 2) \ 
  &= mat(-2, 1, 2)
  $


  Da resultatet er en rækkevektor og ikke ændre sig i dimensioner har vi altså en skalar funktion. 
]


2. Lad $f(x) = (3x, x^2, sin(2x))$. Beregn Jacobi-matricen $J_f (x)$ og evaluer den i punktet $x = 2$. Bekræft at Jacobi-matricen for en vektor-funktion af en variabel kun har en søjle. 

#solution[

  Vi har at vores input $x$ bliver til $(3x, x^2, sin(2x))$.

  Så derfor bliver vores afbildning: 

  $
  f: RR -> RR^3
  $

  Dette bliver altså til en $3 times 1$ matrice, også kaldt en søjle matrice

  $
  J_f (x) = vec( (par f_1)/(par x), (par f_2)/(par x), (par f_3)/(par x))
  $


  Vi afleder disse tre funktioner: 

  $

  (par f_1)/(par x) &= 3x = 3  \ 
  (par f_2)/(par x) &= x^2 = 2x \ 
  (par f_3)/(par x) &= sin(2x) = cos(2x) dot d/(d x) (2x) = 2cos(2x) 
  $
  
  Vi inputter dette i vores søjlematrice:

  $

  J_f (x) &= vec(3, 2x, 2cos(2x))
  $


  Vi evaluere nu $x = 2$


  $
  J_f (2) = vec(3, 4, 2 cos(4)) <==> mat(3, 4, 2 cos(4))^T 
  $
]


3. Lad $f(x_1, x_2) = (x_1^2, -3x_2, 12 x_1)$. Beregn Jacobi-matricen $J_f (x)$ og evaluer den i punktet $x = (2,0)$


#let jacobi(n, m, f: $f$, x: $x$) = {
  let rows = ()
  for i in range(1, n + 1) {
    let cols = ()
    for j in range(1, m + 1) {
      cols.push($(par #f _(#i))/(par #x _(#j))$)
    }
    rows.push(cols)
  }
  
  math.mat(..rows)
}

// Brug:
// #jacobi(3, 2)  // Giver 3×2 Jacobi-matrix med f og x
// #jacobi(2, 3, f: "g", x: "y")  // Giver 2×3 matrix med g og y

#solution[
  Vi har at vores input $x_1, x_2$ bliver til $(x_1^2, -3x_2, 12x_1)$.

  Så derfor bliver vores afbildning:

  $
  f: RR^2 -> RR^3 
  $

  Hvilket giver os en $3 times 2$ matrice.


  Vi skriver Jacobi-matricen op:

  $
  J_f (x) = mat((par f_1)/(par x_1), (par f_1)/(par x_2); 
           (par f_2)/(par x_1), (par f_2)/(par x_2); 
            (par f_3)/(par x_1), (par f_3)/(par x_2)
)
  $



  Vi differ:

  $
  J_f (x) = mat(2x, 0; 0, -3; 12, 0 )
  $


  Vi evaluere for $(2, 0)$

  $
  J_f (2,0) = mat(4, 0; 0 , -3; 12, 0)
  $
]

4. Lad $f(x_1,x_2,x_3) = (2x_1 sin(x_3), 3x_1 x_2 ln(x_3))$. Beregn Jacobi-matricen $J_f (x)$ og evaluer den i punktet $x = (-1,3,2)$


#solution[

  Vi har at funktionen går fra $(x_1, x_2, x_3) = (f_1, f_2)$ så funktionen afbilder altså:

  $
  f: RR^3 -> RR^2 
  $

  Så vi har altså en $2 times 3$ matrice. Vi skriver Jacobi-matricen op: 

  $

  J_f (x) = #jacobi(2,3)
  $


  vi differ:

  $
  J_f (x) &= mat(    2 sin(x_3), 0, 2x_1 cos(x_3); 
  3x_2 ln(x_3), 3x_1 ln(x_3), 3x_1 x_2 1/x_3 
  )
  $



  Videre:

  $
  J_f (-1,3,2) = mat( 2sin(2), 0, -2 cos(2); 9 ln(2), -3 ln(2), -9/2 )
  $
]


5. Lad $f(x_1, x_2, x_3) =  (x_1 e^(x_2), 3 x_2 sin(x_2), -x^2_1 ln(x_2 + x_3)) $ Beregn jacobi-matricen $J_f (x) $ og evaluer i punktet $x = (1,0,1) $



#solution[
  Vi har at $x_1, x_2, x_3 = f_1, f_2 ,f_3 $ 

  $
  f: RR^3 -> RR^3
  $


  Vi opstiller jacobi matricen:



  $
  J_f (x)=  #jacobi(3,3)
  $


  vi differ:

  $
  J_f (x) &= mat(e^(x_2), x_1 e^(x_2), 0; 0, 3 sin(x_2) + 3x_2 cos(x_2), 0; -2x_1 ln(x_2 + x_3), -x^2_1 1/(x_2 + x_3), -x_1^2 1/(x_2 + x_3) )
  $


  Vi indsætter:

  $
    J_f(1, 0, 1) = mat(1, 1, 0; 0, 0, 0; 0, -1, -1)
  $
]
