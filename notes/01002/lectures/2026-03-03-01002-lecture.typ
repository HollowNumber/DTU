#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": *

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - March 03, 2026",
  date: datetime(year: 2026, month: 3, day: 3),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)

#definition(title: "Taylor's Formula")[
Lad $f : I -> RR, I subset.eq RR$, være en $K$ gange diff. funktion.

  $
  P_K (x) = sum^K_(k=0) (f^((k)) (x_0) )/(k!) (x - x_0)^k
  $
]

#note-box[
  Husk
  $
  f: I -> RR, I subset.eq RR 
 $

 Differentiabilitet af funktioner i $x_0 in I$:

 $
f(x_0 +h) - f(x_0) - f'(x_0) h - epsilon(h) abs(h) = 0 
 $


Vektor funktioner:

$
va(f): U -> RR^k, U subset.eq RR^k "åben mængde"
$

Differentiabilitet af vektor funktioner i $va(x_0) in U $:


$
va(f )(va(x)_0 + va(h) ) - va(f) (va(x_0)) - L(va(h)) - va(epsilon)(va(h)) norm(va(h))= 0   
$


Hvor 

$
L(h) = vb(J)_va(f)(x_0) dot va(h)
$


]


#example(title: "4.2.1")[
  $
  f(x) = e^X, x in RR = I 
  $
  

  Vi vælger $x_0 = 0$ og $K in NN$: 

  $
  P_(K,exp, 0)  (x) &= P_K (x) = f(0) + (f'(0))/(1!) (x - 0) + (f''(0))/(2!) (x-0)^2 + (f'''(0))/(3!)(x-0)^3 + dots + 
  \ &= 1 + x + 1/2! x^2 + 1/3! x^3 + dots.c + 1/K! x^K = sum^K_(k=0) 1/K! x^K
  $
]


#example(title: "Approximering af Eulers Konstant")[

  $
  e = f(1) approx 2.718
  $

  Vi bruger at $e <= 3$


  $
  P_3 (1) &= 1 + 1 + 1/2! 1^2 + 1/3! 1^3 \  
  &= 2 +  1/2 + 1/6 = 2 + 3/6 + 1/6 = 2 + 4/6 \ 
  &= 2+ 2/3 \
  &= 2.6overline(6)

  $

]


=== Hvor kommer definition 4.2.1 fra?
#proof()[
  $
    (x^k)'    &= k x^(k-1) \
    (x^k)''   &= k (k-1) x^(k-2) \
    (x^k)'''  &= k (k-1) (k-2) x^(k-3) \
              &dots.v \
    (x^k)^(k) &= k (k-1) (k-2) ... 1 x^(k-k) \
              &= k!
  $

  $
    P(x) = a_0 + a_1 (x-x_0) + a_2 (x-x_0)^2 + dots + a_k (x-x_0)^k
  $
  vores krav er at:
  $
    f(x_0)     &= P(x_0) \
    f'(x_0)    &= P'(x_0) \
    f''(x_0)   &= P''(x_0) \
               &dots.v \
    f^(k)(x_0) &= P^(k)(x_0)
  $

  vi ser:
  $
    P(x_0)     &= a_0    &&= f(x_0) \
    P'(x_0)    &= a_1    &&= f'(x_0) \
    P''(x_0)   &= 2 a_2  &&= f''(x_0) \
               &dots.v \
    P^(k)(x_0) &= k! a_k &&= f^(k)(x_0)
  $

  Altså gælder $a_j = frac(f^((j))(x_0), j!)$ for alle $j = 0, dots, k$, og dermed:
  $
    P_k(x) = sum_(j=0)^k frac(f^((j))(x_0), j!) (x - x_0)^j 
  $

]


#theorem(title: "4.3.1")[
Lad $f: I -> RR$ være en $overbracket(C^(k+1), f^((k+1)) "er kont." )$ funktion. Så eksisterer der et 

$
xi &in ]x_0, x[ (x >= x_0)  \ 
xi &in ]x, x_0[ (x <= x_0)
$

Så er resten af et taylor polynomium:

På Peano form: 
$
R_K (x) = epsilon_K (x-x_0)(x-x_0)^K  
$


På Lagrange form:


$
R_K (x) = (f^((k+1)) (xi) )/((k+1)! )
$
]


#example[
 Lad  $f: RR^3 -> RR^3, f(x_1, x_2, x_3) = sin(2 x_1 - x_2) + x_2 e^x$. $K = 2, va(x)_0 = vecrow(1,2,0, delim: "[")$

 $
 P_(2,va(f),va(x)_0) (va(x)) &= f(va(x)_0) + grad va(f)(va(x)_0)^TT (va(x)- va(x)_0 ) + 1/2! (va(x) - va(x)_0)^TT vb(H)_va(f) (va(x)_0) (va(x)-va(x)_0) \ 
 &= f(va(x)_0) + iprod(va(x) - va(x)_0, grad f (va(x)_0) ) + 1/2! iprod(va(x)-va(x)_0, vb(H)_va(f) (va(x)) (va(x)-va(x)_0) )
 $



 $
 grad f (va(x)) &= vec(2 cos (2 x_1 - x_2), - cos(2x_1 - x_2) + e^(x_3), x_2 e^(x_3))
 \ grad f (1,2,0) &= vec(2 cos(2 dot 1 - 2), - cos(2 dot 1 - 2), 2 dot e^0 ) = vec(2,0,2)
 $

 $
 vb(H)_va(f) (va(x)) = mat(-4 sin(2 x_1 - x_2), 2 sin(2 x_1 - x_2), 0; 
  2 sin (2 x_1 - x_2), - sin(2 x_1 - x_2), e^(x_3); 
  0, e^(x_3), x_2 e^(x_3)
 )
 $


 Vi finder $vb(H)_va(f) (1,2,0) $

 $
 = mat(0, 0, 0; 0, 0, 1; 0,1, 2)
 $

 Vi kan nu finde $P_2 (va(x))$

 $
 P_2 (va(x)) &= sin(0) + 2 e^0 + vecrow(2 , 0, 2, delim:"[")vec(x_1- 1,x_2-2,x_3-0) + 1/2 vecrow(x_1 - 1, x_2 -2, x_3, delim: "[")  mat(0,0,0;0,0,1;0,1,2) vec(x_1 - 1, x_2 -2, x_3) 

 $
]


// Code block styling
#show raw: it => block(
  fill: luma(240),
  inset: 8pt,
  radius: 4pt,
  width: 100%,
  text(font: "New Computer Modern Mono", size: 9pt, it)
)


Opgaverne er håndregningsopgaver med mindre andet er angivet (fx at du bliver bedt om at plotte en graf eller udregne en eksponentialfunktion). Der er en del opgaver hvor du skal udregne en kvadratrod eller en eksponentialfunktion -- her må du selvfølgelig bruge Python eller en lommeregner.

#block(
  fill: luma(235),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Note:*
  - Betegnelserne _grad_ og _orden_ (eng: _degree_ and _order_) af polynomier bruges synonymt. Vi bruger oftest "grad".
  - Betegnelserne _Taylorpolynomium_ og _approksimerende polynomium_ bruges også synonymt. Vi bruger begge betegnelser.
]

#v(1em)

= Opgaver -- Store Dag

== 1: Approksimerende polynomier

=== Spørgsmål a

Find for hver af de følgende funktioner deres første og andengrads Taylorpolynomier med udviklingspunkt $x_0 = 0$.

+ $f(x) = e^x, quad x in RR$
+ $f(x) = cos(x), quad x in RR$
+ $f(x) = e^(sin(x)), quad x in RR$


#solution[
  1. 

  $
  P_1 (x) &= e^0 + e^0/2! (x-0) \ 
  &= 1 + 1/1 x \
  &= 1+  x <==> sum^K_(k=0) 1/k! x^k 
  $


  $
  P_2 (x) &= 1/0! x^0 + 1/1!x^1 + 1/2! x^2 \ 
  &= 1 + x + 1/2 x^2 
  $


  2. 

  $
  P_1 (x) &= cos(0) +- sin(0)/1 x \ 
  &= 1
  $

  2. 

  $
  P_2 (x) &= cos(0) - sin(0)/1 x - cos(0)/2 x^2  \ 
  &= 1 - 0 - 1/2 x^2 \ 
  &= 1 - 1/2 x^2
  $


  3. 

  Via kædereglen: 

  $
  h (x) = f(g(x)) 
  $

  Hvor 

  $
  f(x) &= e^x 
  \ g(x) &= sin(x)
  $

  $
  h'(x) &= f'(g(x))g'(x)  
\ &= e^sin(x) dot cos(x)
  $




  $
  P_1 (x) &= e^sin(0) + (e^sin(0) dot cos(0))/1 x \ 
  &= 1 + (1 dot 1)/1 x   \ 
  &= 1 +  x
  $

  #note-box[
    Produkt reglen: 

    $
    (u dot v)' = u' dot v + u dot v'
    $
  ]

  $
  P_2 (x) &=  e^sin(0) + (e^sin(0) dot cos(0) )/1! x^1 +  ((e^sin(0) dot cos(0))'   )/2! x^2
  \ &= 1 + x +  ((e^sin(0))' dot cos(0) + e^sin(0) dot (cos(0))'  )/2 x^2  \ 
  &=  1 + x + (e^sin(0) dot cos(0) dot cos(0) +  e^sin(0) dot (-sin(0))  )/2 x^2 \ 
  &= 1+ x + (e^sin(0) dot cos^2(0) + e^sin(0) dot -sin(0)  )/2 x^2 \ 
  &= 1+ x + (e^sin(0) (cos^2(0) - sin(0)  ) )/2 x^2  \ 
  &= 1 + x + (1 (1^2 - 0)  )/2 x^2 \ 
  &=  1+ x + 1/2 x^2
  $
]

=== Spørgsmål b

Betragt funktionen $f: ]0, infinity[ -> RR$ givet ved:

$ f(x) = 1/x $

Kan funktionen Taylor-udvikles fra udviklingspunktet $x_0 = 0$? Bestem det approksimerende polynomium af første og anden grad for $f$ med udviklingspunktet $x_0 = 1$.

#solution[
  1. 
  Man kan ikke dividere med nul og dermed, kan man ikke finde en approksimation ved $x_0 = 0$



  2.1 


  $
  P_1 (x) &= f(x_0)/0! (x-1)^0  + (f'(x_0))/1! (x-x_0)^1     \
  &= 1/1 + 
  $


    Beregning af $f'(x)$ 


    Kvotient reglen 
    $
      h'(x) = frac(f'(x)g(x) - f(x)g'(x)  , g(x)^2 )
    $


    Hvor 

    $
    h(x) = f(x)/g(x)
    $

    og 

    $
    f(x) &= 1 
    \ g(x) &= x
    $


    $
    h'(x) &= frac(0 dot x - 1 dot 1   , x^2 ) \ 
    &= - 1/x^2
    $

    $
    P_1 (x) &= 1/1 + frac(- 1/1 , 1 ) (x-1)^1 \ 
    &= 1 + -1/1 (x-1)  <==>  1 - 1(x-1)  \ 
    &= 2 - x
    $

    2.2 

    $
    P_2 (x) &= 1 - 1(x-1) + frac(f''(0), 2!  ) (x-1)^2
    $

    Beregning af $f''$, igen bruges kvotient reglen 


    $
    f(x) &= -1 \ 
    h(x) &= x^2
    $

    $
    h'(x) &= frac(f'(x) dot g(x) - f(x) dot g'(x), g(x)^2 ) \ 
    &= frac(0 dot  x^2 - (-1) dot 2x   , x^4) \ 
    &= frac(1 dot 2x ,x^4) \
    &= (2x)/x^4 slash x \ 
    &= 2/x^3
    $

    $
    P_2(x) &= 1-1(x-1) + frac(2/1^3 ,2)(x-1)^2 \ 
    &= 1 -1 (x-1) + 2/2 (x-1)^2 \ 
    &= 1-1 (x-1) + 1(x-1)(x-1) \ 
    &= 1-1 (x-1) + 1 (x^2 -x  -x +1) \  \ 
    &= 1-1(x-1) + 1(x^2 -2x + 1) \ 
    &= 1 - x + 1 + x^2 - 2x + 1 \ 
    &= 3 - 3x + x^2 
    $
]


=== Spørgsmål c

Plot i Python/SymPy de fire funktioner sammen med deres respektive approksimerende polynomier af første og anden grad.

#v(0.5em)

== 2: Undersøgelse af Taylorpolynomier (Python)

Brug Python/SymPy til at finde det approksimerende polynomium af grad 9, $P_9(x)$, med udviklingspunkt $x_0 = 0$ for funktionen $sin(x)$. Tegn i samme koordinatsystem $sin(x)$ og $P_9(x)$. Hvor langt ud til siden kan man få det approksimerende polynomium til at følge funktionen? (Eksperimentér med polynomiets grad).

#v(0.5em)

== 3: Vurdering af fejl ved approksimation

En funktion $f: op("dom")(f) -> RR$, $op("dom")(f) subset.eq RR$, er givet ved

$ f(x) = sqrt(2x - 1). $

=== Spørgsmål a

Bestem definitionsmængden $op("dom")(f)$ for $f$.

=== Spørgsmål b

Bestem det approksimerende polynomium $P_3(x)$ af grad $3$ for $f$ med udviklingspunktet $x_0 = 1$.

=== Spørgsmål c

Gør rede for at den til $P_3(x)$ hørende restfunktion $R_3(x)$ kan udtrykkes ved

$ R_3(x) = -5/8 dot 1/(2xi - 1)^(7/2) dot (x-1)^4 $

for et $xi$ mellem $1$ og $x$. Vis ved vurdering af restfunktionen at den numeriske værdi af den fejl man begår ved at benytte $P_3(3\/2)$ i stedet for $f(3\/2)$ er mindre end eller lig med $display(5/2^7)$.

#block(
  fill: luma(235),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Note:* Pointen i opgaver som denne er at man kan finde en approksimation til en funktionsværdi for en vanskelig funktion alene ved at bruge et polynomium hvor værdien er nem at udregne. Og at man samtidigt, ved ren håndregning, kan fastsætte en øvre grænse for den fejl man begår ved at bruge approksimationen. Vi går altså ikke efter fejlens præcise størrelse, for den er nemlig ligeså vanskelig at udregne som funktionsværdien!
]

#v(0.5em)

== 4: Approksimation af kompleks funktion

Approksimerende polynomier for komplekse funktioner af en reel variabel opstilles ved samme formel som reelle funktioner af en reel variabel. I det følgende betragter vi funktionen $f: RR -> CC$ givet ved:

$ f(x) = 2cos(x) + i sin(2x), quad x in RR. $

=== Spørgsmål a

Bestem det approksimerende polynomium $P_3$ af grad tre for $f$ med udviklingspunktet $x_0 = 0$.

=== Spørgsmål b

Bestem det approksimerende polynomium $Q_3$ af grad højst tre for $f$ med udviklingspunktet $x_1 = pi/2$.

=== Spørgsmål c

Udregn $f(1)$, $P_3(1)$ og $Q_3(1)$. Tallet 1 ligger tættere på $x_1 = pi/2$ end på $x_0 = 0$. Hvorfor er det alligevel en bedre idé at bruge $P_3$ end $Q_3$ hvis man skal bruge en approksimeret værdi til $f(1)$?

=== Spørgsmål d

Bestem den mindste grad $n$ for et Taylorpolynomium med udviklingspunkt $x_0 = 0$, således at afstanden mellem $f(1)$ og polynomiets værdi i $x = 1$ er mindre end en hundrededel.

#v(0.5em)

== 5: Approksimation af funktion med 3 variable

Givet funktionen

$ f(x, y, z) = e^((x+1)y z) $

=== Spørgsmål a

Bestem det approksimerende polynomium af anden grad $P_2(x, y, z)$ for funktionen $f(x, y, z)$ i $(x_0, y_0, z_0) = (0, 0, 0)$.

=== Spørgsmål b

Bestem ved hjælp af $P_2(x, y, z)$ en approksimation til $f(0.1, 0.2, 0.3)$.

=== Spørgsmål c

Bestem den absolutte fejl for din approksimation i Spørgsmål b. (Du bør selvfølgelig bruge en lommeregner eller Python til at udregne en tilnærmet værdi til $f(0.1, 0.2, 0.3)$.)

#v(0.5em)

== 6: Et andengrads Taylor-polynomium er en kvadratisk form

Vi betragter en funktion $f: RR^n -> RR$ hvis første og anden ordens partielle afledte eksisterer i punktet $bold(x)_0$. Vis, at andengrads Taylor-polynomiet $P_(2,f,bold(x)_0)(bold(x))$ er en kvadratisk form $q$.

I den kvadratiske form skal du udtrykke matricen $A$, søjlevektoren $bold(b)$ og konstanten $c$ i form af vektoren $bold(x)_0$ og $f$ og dens (partielle) afledte af første og anden orden (på matrixform som gradientvektor og hessematrix) evalueret i punktet $bold(x)_0$.

#v(0.5em)

== 7: En implementation af Taylor-approksimation (Python)

Vi skal nu se på en implementation af Taylor-polynomier i SymPy/Python.

=== Spørgsmål a

Implementér Taylor-polynomier for arbitrært $K > 0$ med udgangspunkt i følgende opstilling.

```python
def taylor(f, K, x0):
    Pk = 0
    for k in range(K+1):
        # Udregn den k'te afledte af f i x0
        fk = # ???
        # Læg det k'te led til approksimationen
        Pk += # ???
    return Pk
```

=== Spørgsmål b

Benyt din Python funktion fra forrige spørgsmål til at udregne det approksimerende polynomium af 4. grad $P_4(x)$ for funktionen $f(x) = sin(x)$ i $x_0 = 2pi\/3$.

=== Spørgsmål c

Plot $f(x)$ og $P_4(x)$ fra Spørgsmål b sammen i SymPy/Python.

=== Spørgsmål d

Nu vil vi gerne implementere Taylor-approksimation af anden grad for funktioner af flere variable. Til evaluering af matricer og funktioner i SymPy/Python kan man for eksempel bruge følgende simple implementering. Overvej hvorfor det virker.

```python
def evaluateFunction(f, x, x0):
    for i in range(len(x)):
        f = f.subs({x[i]: x0[i]})
    return f
```

Benyt derefter følgende opstilling til at implementere approksimationen.

```python
def taylorN(f, x, x0):
    N = len(x)
    # Konstant-led
    const = # Benyt evaluateFunction til at opnå f evalueret i x0
    # Førstegrads-led
    J  = # Find Jacobi-matricen
    J0 = # Benyt evaluateFunction til at opnå J evalueret i x0
    first = # Udregn hele det andet led
    # Andengrads-led
    H  = # Find hessematricen
    H0 = # Benyt evaluateFunction til at opnå H evalueret i x0
    second = # Udregn hele det sidste led
    # Resultat
    Pk = simplify(Matrix([const]) + first + second)[0]
    return Pk
```

#block(
  fill: luma(235),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Note:* Implementeringen af `evaluateFunction` er ikke speciel Python-elegant. I større projekter bør man bruge `return f.subs(list(zip(vars, args)))` i stedet for et `for`-loop over index.
]

=== Spørgsmål e

Givet funktionen

$ f(bold(x)) = exp(x_1 x_2) + x_2 sin(x_3) $

Bestem det approksimerende polynomium af anden grad ved hjælp af din implementering i forrige spørgsmål i udviklingspunktet $bold(x)_0 = (3, 0, -pi\/2)$.

=== Spørgsmål f

Bestem nu både den absolutte og den relative fejl ved approksimationen fra Spørgsmål e i punkterne

$ bold(y)_1 = (3.1, 0.2, -pi/2), quad bold(y)_2 = (2.9, -0.2, -pi/2). $

#line(length: 100%, stroke: 0.5pt)
#v(0.5em)

= Opgaver -- Lille Dag

#block(
  fill: luma(235),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  Navnet _Taylors grænseformel_ bruges om "Taylor's formula" hvor man har isoleret $f(x)$ på venstresiden og samlet det approksimerende polynomium og rest-leddet udtrykt ved en *epsilon-funktion* på højresiden.
]

#v(0.5em)

== 1: Funktion af én variabel

=== Spørgsmål a

Bestem med udviklingspunktet $x_0 = 0$ Taylors grænseformel af anden grad for funktionen

$ f(x) = 2cos(x) - 2sin(2x), quad x in RR. $

=== Spørgsmål b

En to gange differentiabel funktion $f$ af én variabel opfylder, at $f(2) = 1$, $f'(2) = 1$ og $P_2(1) = 1$. Bestem det approksimerende polynomium af anden grad $P_2(x)$ for $f$ med udviklingspunkt $x_0 = 2$.

#v(0.5em)

== 2: Taylors grænseformel

Denne opgave giver en metode til at beregne en grænseværdi af en brøk, hvori både tæller og nævner går mod nul.

=== Spørgsmål a

Opskriv Taylors grænseformel for funktionen $ln(1+x)$ med udviklingspunkt $x_0 = 0$ for grad 1 såvel som 2 og 3.

=== Spørgsmål b

Hvilket af de tre resultater i Spørgsmål a kan ikke bruges til at finde grænseværdien:

$ lim_(x -> 0) frac(ln(1+x) - x, x^2) $

=== Spørgsmål c

Udregn nu ved hjælp af Taylors grænseformel følgende grænseværdi:

$ lim_(x -> 0) frac(x(e^x + 1) - 2(e^x - 1), x^3). $

#v(0.5em)

== 3: Drilleopgave

En funktion $f in C^infinity (RR^2)$ opfylder ligningerne

$ f(x, 0) = e^x quad "og" quad f'_y(x, y) = 2y dot f(x, y). $

Find det approksimerende polynomium af anden grad for funktionen $f$ med $(x_0, y_0) = (0, 0)$ som udviklingspunkt.

#v(0.5em)

== 4: Taylors formler og approksimation

Der er givet funktionen $f: RR^2 -> RR$:

$ f(x, y) = e^(x + x y - 2y) quad "for" quad (x, y) in RR^2. $

=== Spørgsmål a

Opskriv 2. grads Taylor-polynomiet for $f$ med udviklingspunktet $(x_0, y_0) = (0, 0)$ på almindelig form (uden vektorer og matricer).

=== Spørgsmål b

Bestem gradienten $nabla f(0, 0)$ og Hessematricen $bold(H)_f(0, 0)$ og opskriv på matrixform 2. grads Taylor-polynomiet for $f$ med udviklingspunktet $(x_0, y_0) = (0, 0)$.

=== Spørgsmål c

Vi ønsker nu en approksimeret værdi for $f(3\/4, 1\/2)$ ud fra et approksimerende andengradspolynomium for $f$. Det er selvfølgelig nemt bare at bruge det approksimerende andengradspolynomium med udviklingspunktet $(0, 0)$ som vi umiddelbart har fra første spørgsmål. På den anden side ligger $(3\/4, 1\/2)$ lidt tættere på $(1, 1)$ hvori det også er relativt bekvemt at udvikle fra. Så måske burde man hellere bruge $(1, 1)$ som udviklingspunkt? Hvilken forskel gør det?

Bestem de approksimerende polynomier af anden grad, $P_2(x, y)$ og $Q_2(x, y)$ for $f$ med udviklingspunkterne hhv. $(0, 0)$ og $(1, 1)$.

Bestem værdierne af dem i punktet $(3\/4, 1\/2)$ og sammenlign med værdien af $f(3\/4, 1\/2)$ (brug gerne Python/SymPy i disse udregninger).

#v(0.5em)

== 5: Anvendelse af approksimerende polynomium

En funktion $f: RR^2 -> RR$ er givet ved

$ f(x, y) = sqrt(x^2 + y^2) quad "for" quad (x, y) in RR^2. $

=== Spørgsmål a

Bestem det approksimerende polynomium $P_2(x, y)$ af anden grad for $f$ i udviklingspunktet $(x_0, y_0) = (3, 4)$.

=== Spørgsmål b

I dette spørgsmål skal vi illustrere den fejl, vi får hvis vi anvender det approksimerende 2. gradspolynomium i stedet for den eksakte værdi.

Bestem ved hjælp af resultatet i forrige spørgsmål længden af diagonalen i et rektangel med sidelængerne 2.9 og 4.2 (man kan godt klare det i hånden, men vi anbefaler at I bruger Python/SymPy til udregningen).

=== Spørgsmål c

Sammenlign med en Python/SymPy-værdi af diagonallængden.

=== Spørgsmål d

Diskuter om forskellen er signifikant.
