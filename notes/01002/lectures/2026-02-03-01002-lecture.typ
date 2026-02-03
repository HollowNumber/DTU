#import "@local/dtu-template:0.6.0":*
#import "@preview/unify:0.7.1"
#import "@preview/physica:0.9.8": *

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - February 03, 2026",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)

#set math.mat(delim: "[")
#set math.vec(delim: "[")

= Funktioner 1
#note-box[
1. Vektorfunktioner af flere variable
2. Kontinuitet

]

== Repetition

$
f(x) = x^2 - 4
$

Er injetiv i domænet fra $[-10,0[$


En graf må ikke have et input som giver to outputs.

== Koncepter


#definition(title: "3")[
  Fumktioner af typen $f : A -> RR^k$

  Har $A = "dom"(f) subset.eq RR^n $ kaldes vektor-funktioner af $n$ variabler


  $
  A &= "dom"(f) "defintionsmængden (domæne)" \
  RR^k &= "codom"(f) "Dispositionsmængden (co-domæne)" \
  Im(f) &= "Vm"(f) "Værdimængdne (billedrummet)"
  $

  Hvor billedrummet 
  $
  {f(x) | x in "dom"(f)|}
  $

  Vi betragter en funktion som en opskrift, den tager et input og giver et output

  $
  f = x mapsto f(x)
  $

  Hvor f er en søjlevektor i $RR^n$, Så vi har altså:

  - Input: $x in RR^n$
  - Output: $f(x) in RR^k$

  #note-box[
    _Et_ input har et vel-defineret output
  ]
]




#example(title: "1.3.1")[
  Lad $A in M_(k times n) (RR) = RR^(k times n)$

  $
  f : RR^n -> RR^k \
  f(x) &= A x (f = x mapsto A x) 
  $

  Hvor $x = n times 1$, $A x =  k times 1$ 


  Lad matricen være defineret ved:

  $
  A= mat(1,2;2,4)
  $


  Dermed lad $f(x)$

  $
  f(x) &= mat(1,2;2,4) vec(x_1,x_2)
  $

  Så $x = vec(x_1, x_2)$


  $
  &= vec(1 x_1 + 2 x_2, 2 x_1 + 4 x_2) = vec(f_1(x), f_2(x) ) \ 
  &= vec(1,2)x_1 + vec(2,4) x_2
  $

  #definition(title: "vektorfunktion")[

    $
    f_1(x) &= 1 x_1 + 2 x_2 \ 
    f_1 &: RR^2 -> RR
    $


    Hvor $f(x)$ er 

    $
    f(x) = vec(f_1(x), f_2(x), dots.v, f_k(x) )
    $

    Hvor 

    $
    f_1: A -> RR, i = 1, dots, k \
    A = "dom"(f)
    $

    Så funktionerne $f_1, f_2, dots, f_k$ kaldes for koordinat funktioner.

  ]

  Er den injektiv? - Nej

  På grund af

  $
  f(vec(-2,1)) &= vec(0,0) \
  f(vec(0,0)) &= vec(0,0)
  $

  Er den surjektiv? - Nej

  På grund af:

  $
  im(f) &= "span"_RR (vec(1,2), vec(2,4)) = "span"_RR (vec(1,2)) \
  &= { t vec(1,2) | t in RR } = "col"(A)
  $

  Hvilket altså ikke er lig med hele output mængden $RR^2$


  Ligning:

  $
    f(x) &= y, y in "codom"(f) = RR^k
  $

  Surjektivitet og injektivitet handler også om funktionen overhovedet har en løsning (surjektiv) eller om det kun har en løsning (injektivitet) 

]


#example(title: "Funktion med mange varialber")[
 Showing off mnist, and flattening 
]


#example(title: "1.2.2")[
  Funktioner med to variabler 


  vi har 

  $
  f: A -> RR, f(x_1, x_2) = sqrt(16-x_1^2 -x_2^2)
  $

  Hvor $A = "dom"(f) subset.eq RR^2$


  Hvad er $A, "codom"(f), "im"(f)$?

  
  Størst muligt $A$?

  Så har vi at:

  $
    16 - x_1^2 &- x_2^2 >= 0  \
    4^2 = 16 &>= x_1^2 + x_2^2 \
  $


  Hvilket er en cirkel med radius fire, hvor $x_2$ er y-aksen og $x_1$ er x-aksen

  #note-box[
    Dette kunne også skrives som 

    $
    A = {(x_1, x_2) in RR^2 | x_1^2 + x_2^2 <= 4^2}
    $
  ]

  // Add image


  Dispositionsmængden (codomænet) er:

  $
  "codom"(f) = RR
  $


  Og billedrummet er 

  $
  f(0,0) &= sqrt(16 - 0^2 - 0^2) = 4
  \ f(4,0 ) &= sqrt(16 - 4^2-0^2) = 0
  $

  Så vi kan altså få alle værdier fra nul til fire, så dermed må billedrummet være 

  $
  im(f) = [0,4]
  $

  // Pictured is a number line where 0 and 4 are scribbeld where the image domain is scribed under


   
$
c = 0, c= 1, c=2, c=3, c=4 
$

// Pictured niveau kurve

$
N_1 &= {(x_1,x_2) | f(x_1, x_2) = 1} = {(x_1, x_2) | sqrt(16 - x_1^2 - x_2^2) = 1}
\ &<=> 15 = x_1^2 + x_2^2  
$
]



#example(title: [13.2 (Relu)])[

  $
  "ReLu": RR &-> RR \
  "ReLu"(x) = max(0, x) = cases(&x quad x>= 0, &0 quad x < 0)
  $


  $
  "ReLu": RR^n -> RR^n \
  "ReLu"(x) = vec("ReLu"(x_1), "ReLu"(x_2), dots.v, "ReLu"(x_n) )
  $

  // Graph showing relu 

]

#definition(title: "1.4 Visualisering af funktion")[
  $
  "Graf"(f) = {(x, f(x)) in RR^(n+k) | x in "dom"(f) }
  $

  (Se eks 1.2.2)

  $
  n + k <= 3
  $

Input-output view


Niveaukurver for $c in "codom"(f) $

$
 {x in "dom"(f) |  f(x) - c }
$



]


#definition(title: "1.3.2 Neuralt netværk")[

  $
  f_1 = arrow(x) &mapsto sigma_1(A_1 arrow(x) + arrow(b_1)) = arrow(z)_1
\

  f_1: RR^784  &->  RR^50
  $


  $
  sigma_1 dot RR^50 &-> RR^50
  \ sigma_1 &= "ReLu"
  $


  Så nu har vi lag 2:

  $
  arrow(z_1) mapsto sigma_2 (A_2 z_1 + arrow(b_2)) = arrow(z_2) in RR^10 
  $
  

  Hvor $A_2 = 10 times 50$, $arrow(b_2) = 10 times 1$


  $
    Phi = f_2 compose f_1, RR^784 -> RR^10 
  $


  $
  Phi(arrow(x)) = sigma_2 (A_2 sigma_1 (A_1 arrow(x) + b_1) + b_2 )
  $
]



= Kontinuitet


#definition(title: "3.2.1")[
  En funktion $f "dom"(f) -> RR, "dom"(f) subset.eq RR $  er kontinuert i $x_0 in A = "dom"(f)$ hvis

  $
x -> x_0 => f(x) -> f(x_0)
  $



]

// Delta epsilon

Ligning 3.1 betyder For ethvert $epsilon >0$ findes et $delta >0$ såldes at $abs(x-x_0) < delta => abs(f(x) - f(x_0)) < epsilon $ Eller mere kompakt:

$
forall epsilon > 0 exists delta > 0 : abs(x-x_0 ) < delta => abs(f(x)-f(x_0)) < epsilon
$

Funktionen $f$ er kontinuert hvis den er kontinuert i alle punkter i $"dom"(f)$


#example[
  Lad $a,b in RR$

  $
  f(x) = a x + b, f: RR-> RR
  $

  Påstand: $f$ er kontinuiert 


  Bevis:

  $
  abs(f(x) - f(x_0)) &= abs( a x + b - (a x_0 + b))
  \ &= abs(a x - a x_0) = abs(a) abs(x-x_0) \ 
  $

  Lad $epsilon > 0$ være givet, vi vælger: 

  $
  delta = epsilon/abs(a)
  $


  $
  abs(x-x_0) < delta &= epsilon/abs(a) \
  &=> abs(f(x) - f(x_0)) < epsilon 
  $

  Hvilket vil sige at 


  $
  abs(f(x) - f(x_0)) = abs(a) abs(x-x_0) < abs(a) epsilon/abs(a) = epsilon
  $

]


#example(title: "Heavyside")[

  $
    h: RR -> RR, h(x) = cases(1 quad x &>= 0, 0 quad x &< 0)
  $

  Denne funktion er ikke kontinuiert i nul,  vi viser det med ligning 3.1


  $h$ er diskontinuert i $x_0= 0$. Lad $epsilon = 1/2$ 


  Der findes entet $delta > 0$. Således at 

  $
  abs(x) < delta => abs(f(x) - f(x_0)) < 1/2
  $

  Hvilket svarer til 

  $
  x in ] - delta, delta]
  $


  $
  f(- delta/2) &= 0 \
  f(delta/2) &= 1
  $


  Dette er dog problematisk date
  $
  h &= abs(f(- delta/2) - f(0)) \ 
  &= abs(0-1) - 1
  $
]



#example(title: "Se afrunding for uge 1" )[

  $
  f : RR^2 -> RR, f(x, y) = cases((x^2 y)/(x^4 + y^2) &(x,y) != (0,0), 0 &(x,y) = (0,0) )
  $


  Er $f$ kont. for alle $(x,y) in RR^2$?


  // Insert Graph
  

  $
  f(x, a x) &= (cancel(x^2) a x)/(cancel(x^4) x^2 + a^2 cancel(x^2))
  \ &= (a x)/(x^2 + a^2) -> 0/(0 + a^2) = 0 x -> 0 
  $

Hvis $y = a x^2, a in RR$

  $
  f(x,a x^2) &= (x^2 a x^2)/(x^4 + a^2 x^4)
  \ &= a/(1 + a^2)
  $

  Så funktions værdien er en konstant værdi.


  $f$ er diskontinuiert i $(x,y) = (0,0)$

]


= Exercises
=== 1: Funktion eller ej?

Betragt følger korrespondance mellem $a$ og $b$ værdier:

#align(center)[
  #table(
    columns: 2,
    align: center,
    [$a$], [$b$],
    [1], [0],
    [2], [1],
    [0], [3],
    [1], [2],
  )
]

Vi betragter funktioner hvis definitionsmængde (domain) er en delmængde af ${0, 1, 2, 3}$ og hvis dispositionsmængde (co-domain) er ${0, 1, 2, 3}$.

Vi skal bestemme om $f$ og $g$ definerer funktioner, hvis vi lader $f$ følge reglen at første søjle ($a$-værdierne) er input og anden søjle ($b$-værdierne) skal være output af funktionen $f$ og definitionsmængden er ${0, 1, 2}$; og vi lader $g$ følge reglen om at anden søjle er input og første søjle skal være output af funktionen $g$ med definitionsmængde ${0, 1, 2, 3}$.

Definerer $f$ en funktion? Gør $g$? I bekræftende fald: bestem værdimængden/billedmængden (engelsk: range/image) for funktionen, og afgør om funktionen er injektiv og surjektiv.

#solution[
$
f(1) &= 0 \
f(2) &= 1 \
f(0 ) &= 3 \
f(1) &= 2
$  

$f$ er ikke en funktion

$
g(0) &= 1 \
g(1) &= 2 \
g(3) &= 0 \
g(2) &= 1
$

funktionen $g$ er ikke injektiv i definitionsmængden, og funktionen er ikke surjektiv da ikke alle værdier i definitionsmængden ${0,1,2,3}$ er afbildet 

]

=== 2: Ens funktionsforskrifter?

Vi betragter funktioner $f_i: RR -> RR$ givet ved:

$
  f_1(x) &= abs(x) \
  f_2(x) &= cases(x quad & x > 0, -x quad & x <= 0) \
  f_3(x) &= max(x, 0) \
  f_4(x) &= "ReLU"(x) + "ReLU"(-x)
$

hvor $x in RR$.

Nogle af funktionerne er samme funktion. Find dem alle!

#solution[

  $
    f_1, f_2 "og" f_4 "er ens"
  $


  Da:

  $
    f_1(1) &= abs(1) = 1 \
    f_2(1) &= 1 \
    f_4(1) &= "ReLU"(1) + "ReLU"(-1) = 1 
  $
]

=== 3: Funktion med ukendt forskrift

Betragt en funktion $f: RR -> RR$ hvorom der gælder $lim_(x -> 2) f(x) = 5$ og $f(2) = 3$. Hvad kan vi sige om $f$ i punktet $x = 2$? Vælg det korrekte svar:

+ Funktionen er kontinuert i punktet $x = 2$.
+ Funktionen er differentiabel i punktet $x = 2$.
+ Funktionen er diskontinuert i punktet $x = 2$.
+ Funktionen er ikke veldefineret i punktet $x = 2$.
+ Man kan ikke afgøre ovenstående, da funktionsforskriften ikke er angivet!

#solution[

  Funktionen ville være diskontinuert i punktet $x = 2$ fordi basis funktionen nævnet at $f(x) = 5$, men $f(2) = 3$, hvilket betyder at grænseværdien for funktionen ikke er ens, og derfor er funktionen diskontinuert

]

=== 4: Ikke-linearitet af ReLU

Betragt ReLU-funktionen, $"ReLU": RR^n -> RR^n$. Forklar hvorfor funktionen ikke er lineær.

#solution[

]

=== 5: Mulige visualiseringer

Diskuter om man kan visualisere nedenstående funktioner -- i givet fald plot dem med SymPy/dtumathtools:

+ En skalarfunktion af to variable $f: RR^2 -> RR, quad f(x_1, x_2) = sqrt(abs(x_1 x_2))$
+ En skalarfunktion af fire variable $f: RR^4 -> RR, quad f(x_1, x_2, x_3, x_4) = sqrt(abs(x_1 x_2 x_3 x_4))$
+ En kompleks skalarfunktion af to variable $f: RR^2 -> CC, quad f(x_1, x_2) = sqrt(abs(x_1 x_2)) + i cos(x_1 + x_2)$
+ Et vektorfelt i 2D $bold(f): RR^2 -> RR^2, quad bold(f)(x_1, x_2) = (-x_2 / 3, x_1 / 3)$
+ Et vektorfelt i 3D $bold(f): RR^3 -> RR^3, quad bold(f)(x, y, z) = (x^3 + y z^2, y^3 - x z^2, z^3)$
+ En funktion af formen $bold(r): [0, 10] -> RR^3, quad bold(r)(t) = (cos(t), sin(t), t)$

#note-box(title: "Python kommandoer")[
  Følgende kan være nyttige: `dtuplot.plot3d`, `dtuplot.plot_vector`, `dtuplot.plot3d_parametric_line`.
]

#solution[

]

=== 6: Evaluering af et Neuralt Netværk

Betragt et simpelt "shallow" neuralt netværk $bold(Phi): RR^2 -> RR$ med ét skjult lag ($L = 2$). Netværket er defineret ved parametrene:

$
  A_1 = mat(2, 0; -1, 1), quad bold(b)_1 = vec(-1, 0), quad A_2 = mat(-1, 2), quad b_2 = 0
$

hvor aktiveringsfunktionen i det *skjulte lag* er ReLU-funktionen, $bold(sigma)(bold(z)) = "ReLU"(bold(z))$, men aktiveringsfunktionen i det *sidste lag* er identitetsafbildningen $bold(sigma)(bold(z)) = bold(z)$. Netværksfunktionen er altså givet ved:

$
  bold(Phi)(bold(x)) = A_2 "ReLU"(A_1 bold(x) + bold(b)_1) + b_2
$

==== Spørgsmål a

Beregn værdien af netværket i punktet $bold(x) = vec(0.5, 1)$.

#solution[

]

==== Spørgsmål b

Find et punkt $bold(x)$, hvor netværkets output $bold(Phi)(bold(x))$ er negativt. Begrund dit svar.

#solution[

]

==== Spørgsmål c

Hvor mange justerbare parametre (vægte og bias-værdier) har dette netværk totalt?

#solution[

]

==== Spørgsmål d

Vi erstatter nu aktiveringsfunktionen (ReLU) med en "hard limiter" funktion (en variant af signum-funktionen), som vi kalder $sigma_("step")$.

Som *skalar*-funktion $sigma_("step"): RR -> RR$ er den defineret ved:

$
  sigma_("step")(x) = cases(1 quad & "hvis" x >= 0, -1 quad & "hvis" x < 0)
$

Som *vektorfunktion* $bold(sigma)_("step"): RR^n -> RR^n$ defineres den ved at anvende skalarfunktionen på hver koordinat:

$
  bold(sigma)_("step")(bold(z)) = vec(sigma_("step")(z_1), dots.v, sigma_("step")(z_n))
$

Betragt nu netværket med denne nye aktiveringsfunktion: $bold(Phi)(bold(x)) = A_2 bold(sigma)_("step")(A_1 bold(x) + bold(b)_1) + b_2$.

Angiv den delmængde af definitionsmængden, hvor netværksfunktionen $bold(Phi)(bold(x))$ er *diskontinuert*.

#solution[

]

=== 7: Visualisering af Netværket

I denne opgave skal du bruge Python til at visualisere funktionen $bold(Phi)(bold(x))$ fra forrige opgave (med ReLU som aktiveringsfunktion).

Du skal plotte grafen for netværket over området $x_1, x_2 in [-2, 2]$.

#note-box[
  Læg mærke til, at grafen består af plane flader, der er "knækket" og sat sammen. Dette skyldes ReLU-funktionen, som er stykkevis lineær. I store netværk der anvendes i praksis sættes millioner af sådanne lineære underrum sammen.
]

Kan du plotte grafen af det samme neurale netværk hvor $bold(sigma)_("step")$ bruges i stedet for ReLU? Planerne i den nye graf bør ikke "hænge sammen" (hvorfor?).

#solution[

]

=== 8: Lineær vektorfunktion

Lad $A in bold(M)_(3 times 5)(RR)$ være givet ved

$
  A = mat(
    1, 0, 2, 3, 4;
    0, -1, 5, 6, 7;
    0, 0, -3, 8, 9
  )
$

Betragt vektorfunktionen $bold(f): RR^5 -> RR^3$ givet ved $bold(f) = bold(x) |-> A bold(x)$, hvor $bold(x)$ er en søjlevektor i $RR^5$.

==== Spørgsmål a

Angiv de 3 koordinatfunktioner for $bold(f)$.

#solution[

]

==== Spørgsmål b

Angiv billedmængden $"im"(bold(f))$ for $bold(f)$.

#solution[

]

==== Spørgsmål c

Er vektorfunktionen $bold(f)$ surjektiv og/eller injektiv?

#solution[

]

=== 9: Næste primtal-funktion (frivillig)

#note-box[Dette er en valgfri ekstraopgave.]

Lad $f: NN -> NN$ være en funktion, der returnerer det næste primtal (strengt) større end et givet naturligt tal $n$. I denne opgave skal du først vurdere værdien af funktionen for to specifikke input og derefter vise, at funktionen er veldefineret, før du implementerer den i Python.

==== Spørgsmål a

Find ved simple overvejelser $f(10)$ og $f(13)$.

#solution[

]

==== Spørgsmål b

Argumenter for, at funktionen $f(n)$ er veldefineret.

#solution[

]

==== Spørgsmål c

Kan man finde et funktionsudtryk for $f(n)$? Argumenter for, hvorfor det er eller ikke er muligt.

#solution[

]

==== Spørgsmål d

Implementer funktionen $f(n)$ i Python, som tager et heltal $n$ som input og returnerer det næste primtal større end $n$. Definer en hjælpefunktion `er_primtal(x)` til at afgøre, om et tal er primtal.

#solution[

]

==== Spørgsmål e

Kan du opdatere din Python-funktion fra forrige opgave, så $f$'s definitionsmængde udvides fra $NN$ til $RR$?

#solution[

]

#pagebreak()

== Opgaver -- Lille Dag

=== 1: Størrelse af vektorer

Betragt følgende tre vektorer i $RR^3$:

$
  bold(v)_1 = vec(-10, -10, -10), quad
  bold(v)_2 = vec(-10, -4, 14), quad
  bold(v)_3 = vec(-10, -8, -12)
$

Hvilken vektor er længst? Hvilke vektorer er ortogonale på hinanden? Hvilke to vektorer er tættest på hinanden?

#note-box[
  Vi kan forestille os vektorerne som (geometriske) stedvektorer med begyndelsespunkt i $bold(0) = [0, 0, 0]^T$ og slutpunkt $bold(v)_i$ for hhv $i = 1, 2, 3$. Under tiden skriver man dette som $arrow(bold(0) bold(v)_i)$.
]

#solution[

]

=== 2: Partielle afledede af simpel skalar-funktion

Find de partielle afledte $pdv(f, x_1)$ og $pdv(f, x_2)$ for $f(x_1, x_2) = x_1^3 + 3 x_1 x_2 + x_2^3$. Bestem værdien af de partielle afledte i punktet $(x_1, x_2) = (1, 2)$.

#solution[

]

=== 3: Forskellige(?) kvadratiske former

Lad $bold(x) = [x_1, x_2]^T$ være en søjlevektor i $RR^2$. Definer:

$
  A_1 = mat(11, -12; -12, 4), quad
  A_2 = mat(11, 0; -24, 4), quad
  A_3 = mat(73/5, -36/5; -36/5, 52/5)
$

og

$
  bold(b)_1 = vec(-20, 40), quad
  bold(b)_2 = bold(b)_1, quad
  bold(b)_3 = vec(-44, 8), quad
  c = -60
$

Lad $q_i: RR^2 -> RR$ være givet ved:

$
  q_i (bold(x)) = bold(x)^T A_i bold(x) + bold(b)_i^T bold(x) + c
$

for $i = 1, 2, 3$. Sådanne funktioner kaldes kvadratiske former.

==== Spørgsmål a

Gang udtrykket for $q_1(x_1, x_2)$ ud. Først i hånden, så ved hjælp af Python. Gang også udtrykkene for $q_2(x_1, x_2)$ og $q_3(x_1, x_2)$ (i hånden eller Python) ud.

#solution[

]

==== Spørgsmål b

Er den kvadratiske matrix $A$ i en kvadratisk form (som fx $bold(x)^T A bold(x)$) entydig givet?

#solution[

]

==== Spørgsmål c

Plot grafen af funktionen $q_1$. Plot så nogle niveaukurver. Hvilken geometrisk form har niveaukurverne? Gør det samme for $q_3$.

#solution[

]

==== Spørgsmål d

En af funktionerne har et minimum. Hvilken? Hvor ligger det cirka? Hvad kaldes det samme punkt for de funktioner der ikke har et minimum?

#solution[

]

=== 4: Softmax-funktionen

I denne opgave ser vi på *softmax*-funktionen.

==== Spørgsmål a

Beregn *softmax* af følgende tre vektorer i $RR^3$. Du kan gøre det ved håndkraft (brug lommeregner til eksponentialfunktionen) eller ved hjælp af Python. Angiv svarene med ca. 3 decimaler.

+ $bold(x)_1 = [1, 2, -5]^T$
+ $bold(x)_2 = [10, 2, -5]^T$
+ $bold(x)_3 = [100, 2, -5]^T$

#solution[

]

==== Spørgsmål b

Hvad observerer du, når forskellen mellem den største værdi i inputtet og de andre værdier øges (som i skiftet fra $bold(x)_1$ til $bold(x)_2$ og $bold(x)_3$)? Hvorfor kaldes funktionen mon "soft"-max?

#solution[

]

==== Spørgsmål c

Er *softmax*-funktionen kontinuert?

#solution[

]

==== Spørgsmål d

Betragt *softmax* som en afbildning fra $RR^n$ til $RR^n$. Er funktionen *injektiv* (en-til-en)?

Er funktionen *surjektiv* (på) i forhold til dispositionsmængde $RR^n$?

#solution[

]

=== 5: Kvadratiske former med symmetriske matricer

Lad $A$ være en vilkårlig $n times n$ matrix, og lad $bold(x)$ være en søjlevektor i $RR^n$. Definer $B$ ved $B = (A + A^T) / 2$.

==== Spørgsmål a

Vis at matricen $B$ er symmetrisk.

#solution[

]

==== Spørgsmål b

Vis at $bold(x)^T A bold(x) = bold(x)^T B bold(x)$.

#solution[

]

==== Spørgsmål c

Konkludér at man altid kan antage at kvadratiske former af formen $q(bold(x)) = bold(x)^T A bold(x) + bold(b)^T bold(x) + c$ er givet ved en *symmetrisk* matrix $A$.

#solution[

]
