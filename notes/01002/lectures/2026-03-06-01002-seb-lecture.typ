#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/plotsy-3d:0.2.1"

#show: dtu-note.with(
  course: "01002",
  course-name: "Mathematics 1b (Polytechnical foundation)",
  title: "Lecture - March 06, 2026",
  date: datetime(year: 2026, month: 3, day: 6),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

#let vecrow = vecrow.with(delim: "[")
#let dmat = dmat.with(delim: "[")

= Grænseovergange via Taylor

#definition(title: "Taylor Polynomial")[
  For en funktion $f: RR -> RR$ er Taylor polynomiet af grad $k$ omkring punktet $x_0$ givet ved:

  $
    P_(k,f,x_0) (x) = sum_(n=0)^k frac(f^((n))(x_0), n!) (x-x_0)^n
  $

  Dette kan også skrives eksplicit som:

  $
    P_k (x) = f(x_0) + f'(x_0) (x-x_0) + frac(f''(x_0), 2!) (x-x_0)^2 + dots + frac(f^((k))(x_0), k!) (x-x_0)^k
  $
]

#definition(title: "Restleddet (Remainder Term)")[
  Restleddet $R_k (x)$ beskriver forskellen mellem den sande funktionsværdi og Taylor approksimationen:

  $
    R_k (x) = f(x) - P_k (x)
  $

  Der findes to hovedformer:

  $
    R_k (x) = cases(
      display(frac(f^((k+1))(xi), (k+1)!) (x-x_0)^(k+1)) quad &"Lagrange form",
      epsilon_(k,f,x_0)(x) dot abs(x-x_0)^k quad &"Peano form",

    )
  $

  hvor:
  - *Lagrange form*: Eksakt for et $xi in (x_0, x)$
  - *Peano form*: $epsilon_(k,f,x_0)(x) -> 0$ når $x -> x_0$
]

#note-box(title: "Anvendelse af Peano form")[
  I dag bruger vi primært Peano formen, da den er mere praktisk til grænseværdiberegninger. Her gælder:

  $
    f(x) = P_k (x) + epsilon_(k,f,x_0)(x) dot abs(x-x_0)^k
  $

  hvor $epsilon_(k,f,x_0)(x) -> 0$ når $x -> x_0$.
]

== Taylor række for $sin(x)$

#example(title: "Taylor udvikling af sinus")[
  Lad $f(x) = sin(x)$ omkring $x_0 = 0$.

  Vi beregner de første afledte:

  #dtu-table(
    columns: 4,
    caption: "Afledte af sin(x) i x=0",
    [*n*],
    [*$f^((n))(x)$*],
    [*$f^((n))(0)$*],
    [*Led i Taylor*],
    [0],
    [$sin(x)$],
    [0],
    [0],
    [1],
    [$cos(x)$],
    [1],
    [$x$],
    [2],
    [$-sin(x)$],
    [0],
    [0],
    [3],
    [$-cos(x)$],
    [-1],
    [$display(-frac(x^3, 3!))$],
  )

  Taylor polynomiet af grad 3 bliver:

  $
    P_3 (x) = x - frac(x^3, 6)
  $

  Med Peano restled:

  $
    sin(x) = x - frac(x^3, 6) + epsilon_3 (x) dot abs(x)^3
  $
]

== Grænseovergange for $x -> 0$

#note-box(title: "Eksempler på grænseovergange")[
  Vi undersøger adfærden af forskellige udtryk når $x -> 0$:

  + $sin(x) -> sin(0) = 0$

  + $1-x^3 -> 1-0=1$

  + $display(frac(1+x^3, 1/2 + x^2) -> frac(1+0, 1/2 + 0) = 2)$

  + $display(x^3/x^2 = x -> 0)$

  + $display(frac(4x, x^2) = frac(4, x) -> infinity)$ (divergerer)

  + $display(frac(1/2 x^2, x^2) -> frac(1, 2))$

  + $display(frac(sin(x), x) -> 1)$ (klassisk grænseværdi)

  + $display(frac(sin(4x), x) -> 4)$ (skal vises nedenfor)
]

=== Beregning af $lim_(x->0) sin(x)/x$

#example(title: "Standardgrænseværdi for sinus")[
  Vi bruger Taylor udviklingen $sin(x) = x + epsilon_1 (x) dot x$ med $k=1$:

  $
    frac(sin(x), x) &= frac(x + epsilon_1 (x) dot x, x) \
                    &= frac(x(1 + epsilon_1 (x)), x) \
                    &= 1 + epsilon_1 (x) \
                    &-> 1 + 0 = 1 quad "for" x -> 0
  $
]

#note-box(title: "Bemærkning om epsilon")[
  Epsilon funktionen kan isoleres, men det er ikke nødvendigt for grænseværdiberegninger:

  $
    epsilon_1 (x) = frac(sin(x) - x, x), quad x!=0
  $
]

=== Beregning af $lim_(x->0) (sin(x) - x)/x^3$

#example(title: "Højere ordens grænseværdi")[
  Vi skal bruge $k=3$ Taylor approksimation da tælleren er $O(x^3)$:

  *Forkert tilgang (k=1):*
  $
    frac(sin(x) - x, x^3) underbrace(=, k=1) frac(x + epsilon_1 (x) dot x -x, x^3) \
    = frac(epsilon_1 (x) dot x, x^3) = frac(epsilon_1 (x), x^2) -> "ubestemt"
  $

  *Korrekt tilgang (k=3):*

  Vi bruger $sin(x) = x - display(frac(x^3, 6)) + epsilon_3 (x) dot abs(x)^3$:

  $
    frac(sin(x) - x, x^3) &= frac(x - frac(x^3, 6) + epsilon_3 (x) dot x^3 - x, x^3) \
                          &= frac(-frac(1, 6) x^3 + epsilon_3 (x) dot x^3, x^3) \
                          &= -frac(1, 6) + epsilon_3 (x) \
                          &-> -frac(1, 6) quad "for" x -> 0
  $
]

#important(
  title: "Vigtig pointe",
)[
  Vælg altid Taylor approksimationens grad $k$ så den matcher ordenen af udtrykket i tælleren/nævneren. Hvis $k$ er for lavt, får man en ubestemt form.
]

=== Beregning af $lim_(x->0) (sin x - x)/(e^x - 1 - x - x^2\/2)$

#example(
  title: "Kombination af Taylor rækker",
)[
  Vi skal bruge Taylor udvikling af både $sin x$ og $e^x$.

  *Taylor udvikling af $e^x$ omkring 0:*

  $
    e^x = 1 + x + frac(x^2, 2) + frac(x^3, 6) + epsilon_1 (x) dot abs(x)^3
  $

  Altså: $display(P_(3,e^x, 0) (x) = 1 + x + frac(x^2, 2) + frac(x^3, 6))$

  *Taylor udvikling af $sin x$ omkring 0:*

  $
    sin x = x - frac(x^3, 6) + epsilon_2(x) dot abs(x)^3
  $

  *Beregning af grænseværdien:*

  $
    frac(sin x - x, e^x - 1 - x - x^2/2) &= frac(x - x^3/6 + epsilon_2 (x) dot x^3 - x, 1 + x + x^2/2 + x^3/6 + epsilon_1 (x) dot x^3 - 1 - x - x^2/2) \
                                         &= frac(- x^3/6 + epsilon_2 (x) dot x^3, x^3/6 + epsilon_1 (x) dot x^3) \
                                         &= frac(x^3 (- 1/6 + epsilon_2 (x)), x^3 (1/6 + epsilon_1 (x))) \
                                         &= frac(- 1/6 + epsilon_2 (x), 1/6 + epsilon_1 (x)) \
                                         &-> frac(- 1/6 + 0, 1/6 + 0) = -1 quad "for" x -> 0
  $
]

= Minimum / Maximum via Taylor Polynomium

#definition(
  title: "Taylor Polynomium for Funktioner af Flere Variable",
)[
  For en funktion $f: RR^n -> RR$ er andenordens Taylor polynomiet omkring punktet $va(x)_0$ givet ved:

  $
    P_2 (va(x)) = f(va(x)_0) + va(grad) f(va(x)_0)^TT (va(x)-va(x)_0) + frac(1, 2) (va(x)-va(x)_0)^TT vb(H)_f (va(x)_0) (va(x)-va(x)_0)
  $

  hvor $vb(H)_f$ er Hessematricen (matricen af andenordens partielle afledte).
]

== Eksempel: Lokalt Minimum

#example(title: "Analyse af kritisk punkt")[
  Betragt funktionen:

  $
    f: RR^2 -> RR, quad f(x,y) = x^3 + y^3 + x^2 + y^2 + 1
  $

  *Trin 1: Beregn gradienten*

  $
    va(grad) f(x,y) = vec(pdv(f, x), pdv(f, y)) = vec(3x^2 + 2x, 3y^2 + 2y)
  $

  *Trin 2: Beregn Hessematricen*

  $
    vb(H)_f (x,y) = mat(pdv(f, x, x), pdv(f, x, y);pdv(f, y, x), pdv(f, y, y)) = mat(6x+2, 0;0, 6y+2)
  $

  *Trin 3: Find kritiske punkter*

  Sæt $va(grad) f(x,y) = va(0)$:

  $
    3x^2 + 2x &= 0 quad &<==> quad x(3x + 2) = 0 quad &<==> quad x = 0 "eller" x = -frac(2, 3) \
    3y^2 + 2y &= 0 quad &<==> quad y(3y + 2) = 0 quad &<==> quad y = 0 "eller" y = -frac(2, 3)
  $

  Dette giver 4 kritiske punkter:
  $(0,0)$, $(0,-2/3)$, $(-2/3,0)$, $(-2/3,-2/3)$

  *Trin 4: Analyser punktet $(0,0)$*

  I punktet $(x_0, y_0) = (0,0)$:

  $
    va(grad)f(0,0) &= vec(0, 0) \
    vb(H)_f (0,0)  &= mat(2, 0;0, 2) = 2 vb(I)
  $

  *Trin 5: Taylor approksimation omkring $(0,0)$*

  $
    P_2 (x,y) &= f(0,0) + va(grad) f(0,0) dot vec(x, y) + frac(1, 2) vec(x, y)^TT vb(H)_f (0,0) vec(x, y) \
              &= 1 + vec(0, 0)^TT vec(x, y) + frac(1, 2) vec(x, y)^TT mat(2, 0;0, 2) vec(x, y) \
              &= 1 + 0 + frac(1, 2) (2x^2 + 2y^2) \
              &= 1 + x^2 + y^2
  $

  *Trin 6: Analysér med Peano restled*

  Med Peano formen får vi:

  $
    f(x,y) = P_2(x,y) + epsilon_2 (x,y) dot norm(vec(x, y))^2
  $

  hvor normen er:

  $
    norm(vec(x, y)) = sqrt(x^2 + y^2)
  $

  Derfor:

  $
    f(x,y) &= 1 + x^2 + y^2 + epsilon_2 (x,y) dot (x^2 + y^2) \
           &= 1 + (1 + epsilon_2 (x,y)) dot (x^2 + y^2)
  $

  For $(x,y)$ tæt på $(0,0)$ gælder $epsilon_2 (x,y) -> 0$, så $(1 + epsilon_2 (x,y)) > 0$.

  Derfor:

  $
    f(x,y) >= f(0,0) = 1 quad "for alle" (x,y) "tæt på" (0,0)
  $

  #dtu-highlight[
    *Konklusion:* $(0,0)$ er et #dtu-emphasis[lokalt minimum] med minimumsværdi $f(0,0) = 1$.
  ]
]

#theorem(title: "Nødvendig Betingelse for Lokalt Ekstremum")[
  Hvis $va(x)_0$ er et lokalt minimum eller maksimum for en differentierbar funktion $f$, så gælder:

  $
    va(grad) f(va(x)_0) = va(0)
  $

  Punkter hvor dette er opfyldt kaldes *kritiske punkter* eller *stationære punkter*.
]

#note-box(title: "Tilstrækkelig betingelse")[
  For at afgøre om et kritisk punkt er et minimum, maksimum eller saddelpunkt, skal man analysere Hessematricen:

  - *Positivt definit* ($vb(H) > 0$): Lokalt minimum
  - *Negativt definit* ($vb(H) < 0$): Lokalt maksimum
  - *Indefinit*: Saddelpunkt
  - *Semi-definit*: Test inkonklusiv
]

== Retningsafledt og Gradient

#proposition(
  name: "Gradient som Retning af Maksimal Vækst",
)[
  Antag $va(grad) f(va(x)_0) != va(0)$. Definer enhedsvektoren:

  $
    va(e) = frac(1, norm(va(grad) f(va(x)_0))) va(grad) f(va(x)_0)
  $

  Betragt en lille forskydning $va(h) = t dot va(e)$ hvor $t in RR$.

  Ved differentiation følger:

  $
    f(va(x)_0 + va(h)) &= f(va(x)_0) + va(grad) f(va(x)_0)^TT va(h) + epsilon(va(h)) dot norm(va(h)) \
                       &= f(va(x)_0) + va(grad) f(va(x)_0)^TT (t va(e)) + epsilon(t va(e)) dot abs(t) \
                       &= f(va(x)_0) + t dot norm(va(grad) f(va(x)_0)) + epsilon(t va(e)) dot abs(t)
  $

  For små $abs(t)$ dominerer leddet $t dot norm(va(grad) f(va(x)_0))$, som er størst når vi bevæger os i retning af gradienten.
]

#intuition[
  Gradienten $va(grad) f(va(x))$ peger i retningen af den maksimale vækst af funktionen. Jo større $norm(va(grad) f(va(x)))$ er, desto stejlere er funktionen i det punkt.
]

= Exercises - Lilledag

#note-box[Øvelsestime til selvstudium]



#note-box(title: "Om Taylors grænseformel")[
  Navnet *Taylors grænseformel* bruges om "Taylor's formula" (se bogen) hvor man har isoleret $f(x)$ på venstresiden og samlet det approksimerende polynomium og rest-leddet udtrykt ved en *epsilon-funktion* på højresiden.
]

== Opgave 1: Funktion af én variabel

#math-problem(number: "1a", points: "")[
  Bestem med udviklingspunktet $x_0=0$ Taylors grænseformel af anden grad for funktionen
  
  $
    f(x)=2cos(x)-2sin(2x), quad x in RR.
  $
  
  #solution()[

    $
    2-4x-x^2 + x^2 dot epsilon_2 (x)
    $
    
  ]
]

#math-problem(number: "1b", points: "")[
  En to gange differentiabel funktion $f$ af én variabel opfylder, at $f(2)=1$, $f'(2)=1$ og $P_2(1)=1$. Bestem det approksimerende polynomium af anden grad $P_2(x)$ for $f$ med udviklingspunkt $x_0=2$.
  

  #solution()[
    $f(2) = 1, f'(2) = 1, P_2 (1) = 1$.

    Opskrevet som taylor polynomium:
    $
      P_2 (x) = f(2) + f'(2) (x-2) + frac(f''(2), 2) (x-2)^2
    $

    Vi ved at $P_2(1) = 1$, så:
    $
      1 &= P_2(1) = 1 + 1 (1-2) + frac(f''(2), 2) (1-2)^2 \
        &= 1 - 1 + frac(f''(2), 2) \
        &=> f''(2) = 2
    $

    derved er $f''(2) = 2$ og det approksimerende polynomium:
    $
      P_2 (x) &= 1 + 1 (x-2) + 1 (x-2)^2 \
              &= -1 + x + (x-2)^2
    $
    
    // TODO: plot

  ]
]

== Opgave 2: Taylors grænseformel

#note-box[
  Denne opgave giver en metode til at beregne en grænseværdi af en brøk, hvori både tæller og nævner går mod nul.
]

#math-problem(number: "2a", points: "")[
  Opskriv Taylors grænseformel for funktionen $ln(1+x)$ med udviklingspunkt $x_0=0$ for grad 1 såvel som 2 og 3.

  #solution()[
    Taylors grænseformlen er givet generalt som:
    $
      f(x) = P_k (x) + epsilon_k (x) dot abs(x-x_0)^k
    $

    så for $k=1$:

    $
      f(x)    &= ln(1+x) \
      f'(x)   &= frac(1, 1+x) \
      P_1 (x) &= f(0) + f'(0) (x-0) = 0 + 1 dot x \
              &= ln(1+0) + frac(1, 1+0) dot (x-0)^1 \
              &= ln(1) + frac(1, 1) dot x \
              &= x
    $

    så for $k=2$:

    $
      f''(x)  &= - 1/(x + 1)^2 \
      P_2 (x) &= P_1 (x) + frac(f''(0), 2) (x-0)^2 = x - 1/2 x^2 \
              &= ln(1+0) + frac(1, 1+0) dot (x-0)^1 + frac(-1, 2) dot (x-0)^2 \
              &= ln(1) + frac(1, 1) dot x + frac(-1, 2) dot x^2 \
              &= x - 1/2 x^2
    $

    så for $k=3$:
    $
      f'''(x) &= 2/((x+1)^3) \
      P_3 (x) &= P_2 (x) + frac(f'''(0), 3!) (x-0)^3 \
      &= x - 1/2 x^2 + frac(1,3) x^3 \ 
      &= ln(1+0) + frac(1, 1+0) dot (x-0)^1 + frac(-1, 2) dot (x-0)^2 + frac(2, 6) dot (x-0)^3 \
      &= ln(1) + frac(1, 1) dot x + frac(-1, 2) dot x^2 + frac(1, 3) dot x^3 \
      &= x - 1/2 x^2 + 1/3 x^3 
    $
    
    Restleddet i Peano form er:
    $
      epsilon_3 (x) = ln(1+x) - x + 1/2 x^2 - 1/3 x^3 / x^3
    $
    
    
  ]
]

#math-problem(number: "2b", points: "")[
  Hvilket af de tre resultater i Spørgsmål a kan ikke bruges til at finde grænseværdien:
  
  $
    lim_(x->0) frac(ln(1+x)-x, x^2)
  $
  
#solution()[
    Vi prøver os frem en efter en:
    så for $k=1$:
    $
      frac(ln(1+x)-x, x^2) &underbrace(=, k=1) frac(x + epsilon_1 (x) dot x - x, x^2) \
      &= frac(epsilon_1(x) dot x, x^2  ) \ 
      &= frac(epsilon_1(x), x) \ 
      &= frac(0, x) \ 
      &= 0/0
    $

    Ubestemt 


    for $k = 2$

    $
    frac(ln(+1x)-x , x^2) &= frac(x - 1/2 x^2 + epsilon_2(x) x^2  - x, x^2)  \ 
    &= frac(- 1/2 x^2 + epsilon_2 (x) x^2, x^2 ) \ 
    &= frac( x^2(epsilon_2(x) - 1/2  ) , x^2   ) \ 
    &= frac(epsilon_2 (x) - 1/2, 1)  \ 
    &= frac(0 - 1/2, 1) \
    &= frac( - 1/2, 1) \ 
    &<==> - frac(1,2)


    $
  ]
]

#math-problem(number: "2c", points: "")[
  Udregn nu ved hjælp af Taylors grænseformel følgende grænseværdi:
  
  $
    lim_(x->0) frac(x(e^x+1)-2(e^x-1), x^3)
  $
  
  #solution()[

    $
    sum_(k=0)^K 1/k! x^k  
    $

    $
    P_3 (x) &=  1/0! x^0 + 1/1! x^1 + 1/2! x^2 + 1/3! x^3  \  
    &= 1 + x + 1/2 x^2 + 1/6 x^3
    $


    $
   &= frac(x (1 + x + 1/2 x^2 + 1/6 x^3 + 1 + epsilon_3(x) x^3 ) -  2(1 + x + 1/2 x^2 + 1/6 x^3 - 1 + epsilon_3(x) x^3 )  , x^3) \ 
   &= frac(x (2 + x + 1/2 x^2 + 1/6 x^3 + epsilon_3(x) x^3 ) - 2 (x + 1/2 x^2 + 1/6 x^3 + epsilon_3(x) x^3) , x^3  ) \ 
   &= frac(x^4, 6) 
    $
    
  ]
]

== Opgave 3: Drilleopgave

#math-problem(number: "3", points: "")[
  En funktion $f in C^infinity (RR^2)$ opfylder ligningerne
  
  $
    f(x,0) = e^x quad "og" quad pdv(f, y)(x,y) = 2y dot f(x,y)
  $
  
  Find det approksimerende polynomium af anden grad for funktionen $f$ med $(x_0,y_0)=(0,0)$ som udviklingspunkt.
  
  #solution()[
    
  ]
]

== Opgave 4: Taylors formler og approksimation

#note-box[
  Der er givet funktionen $f: RR^2 -> RR$:
  
  $
    f(x,y) = e^(x+x y - 2y) quad "for" (x,y) in RR^2
  $
]

#math-problem(number: "4a", points: "")[
  Opskriv 2. grads Taylor-polynomiet for $f$ med udviklingspunktet $(x_0,y_0)=(0,0)$ på almindelig form (uden vektorer og matricer).
  
  #solution()[
    
  ]
]

#math-problem(number: "4b", points: "")[
  Bestem gradienten $va(grad) f(0,0)$ og Hessematricen $vb(H)_f(0,0)$ og opskriv på matrixform 2. grads Taylor-polynomiet for $f$ med udviklingspunktet $(x_0,y_0)=(0,0)$.
  
  #solution()[
    
  ]
]

#math-problem(number: "4c", points: "")[
  Vi ønsker nu en approksimeret værdi for $f(3/4, 1/2)$ ud fra et approksimerende andengradspolynomium for $f$. 
  
  På den anden side ligger $(3/4, 1/2)$ lidt tættere på $(1,1)$ hvori det også er relativt bekvemt at udvikle fra. Så måske burde man hellere bruge $(1,1)$ som udviklingspunkt?
  
  Bestem de approksimerende polynomier af anden grad, $P_2(x,y)$ og $Q_2(x,y)$ for $f$ med udviklingspunkterne hhv. $(0,0)$ og $(1,1)$. Bestem værdierne af dem i punktet $(3/4, 1/2)$ og sammenlign med værdien af $f(3/4, 1/2)$.
  
  #solution()[
    
  ]
]

== Opgave 5: Anvendelse af approksimerende polynomium

#note-box[
  En funktion $f: RR^2 -> RR$ er givet ved
  
  $
    f(x,y) = sqrt(x^2 + y^2) quad "for" (x,y) in RR^2
  $
]

#math-problem(number: "5a", points: "")[
  Bestem det approksimerende polynomium $P_2(x,y)$ af anden grad for $f$ i udviklingspunktet $(x_0, y_0) = (3,4)$.
  
  #solution()[
    
  ]
]

#math-problem(number: "5b", points: "")[
  Bestem ved hjælp af resultatet i forrige spørgsmål længden af diagonalen i et rektangel med sidelængerne 2.9 og 4.2.
  
  #solution()[
    
  ]
]

#math-problem(number: "5c", points: "")[
  Sammenlign med en Python/SymPy-værdi af diagonallængden.
  
  #solution()[
    
  ]
]

#math-problem(number: "5d", points: "")[
  Diskuter om forskellen er signifikant.
  
  #solution()[
    
  ]
]
