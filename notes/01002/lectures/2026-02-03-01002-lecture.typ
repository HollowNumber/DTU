#import "@local/dtu-template:0.6.0":*
#import "@preview/unify:0.7.1"
#import "@preview/cetz:0.4.2"
#import "@preview/plotsy-3d:0.2.1": plot-3d-surface, plot-3d-vector-field
#import "@preview/physica:0.9.8": *
#import "@preview/cetz-plot:0.1.3"

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

= Funktioner 1 <sec:functions>
#note-box[
1. Vektorfunktioner af flere variable
2. Kontinuitet
]

== Repetition: Grundlæggende funktionsbegreber <sec:repetition>

En funktion må ikke have et input som giver to outputs (en graf må ikke have en vertikal linje der skærer den mere end én gang).

#example[
  $
  f(x) = x^2 - 4
  $

  Er injektiv i domænet $[-10,0[$ men ikke injektiv på hele $RR$ (da $f(-2) = f(2) = 0$).
]

== Vektorfunktioner af flere variable <sec:vector-functions>

#definition(title: "Definition 3 - Vektorfunktioner")[
  Funktioner af typen $f : A -> RR^k$

  Har $A = "dom"(f) subset.eq RR^n$ kaldes vektorfunktioner af $n$ variabler.

  $
  A &= "dom"(f) "definitionsmængden (domæne)" \
  RR^k &= "codom"(f) "dispositionsmængden (co-domæne)" \
  "Im"(f) &= "Vm"(f) "værdimængden (billedrummet)"
  $

  Hvor billedrummet er
  $
  {f(x) | x in "dom"(f)}
  $

  Vi betragter en funktion som en opskrift: den tager et input og giver et output

  $
  f = x mapsto f(x)
  $

  Hvor $x$ er en søjlevektor i $RR^n$. Så vi har altså:

  - Input: $x in RR^n$
  - Output: $f(x) in RR^k$

  #note-box[
    _Ét_ input har et veldefineret output
  ]
]

== Eksempler på vektorfunktioner <sec:examples>

#example(title: "Eksempel 1.3.1 - Lineær vektorfunktion")[
  Lad $A in M_(k times n) (RR) = RR^(k times n)$

  $
  f : RR^n -> RR^k \
  f(x) &= A x quad (f = x mapsto A x) 
  $

  Hvor $x = n times 1$, $A x = k times 1$ 

  Lad matricen være defineret ved:

  $
  A = mat(1,2;2,4)
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

  #definition(title: "Koordinatfunktioner")[

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
    f_i: A -> RR, i = 1, dots, k \
    A = "dom"(f)
    $

    Så funktionerne $f_1, f_2, dots, f_k$ kaldes koordinatfunktioner.

  ] <def:vector-function>

  Er den injektiv? - Nej

  På grund af

  $
  f(vec(-2,1)) &= vec(0,0) \
  f(vec(0,0)) &= vec(0,0)
  $

  Er den surjektiv? - Nej

  På grund af:

  $
  "im"(f) &= "span"_RR (vec(1,2), vec(2,4)) = "span"_RR (vec(1,2)) \
  &= { t vec(1,2) | t in RR } = "col"(A)
  $

  Hvilket altså ikke er lig med hele output mængden $RR^2$

  Ligning:

  $
    f(x) &= y, y in "codom"(f) = RR^k
  $

  Surjektivitet og injektivitet handler også om hvorvidt funktionen overhovedet har en løsning (surjektiv) eller om den kun har én løsning (injektivitet).

]

#example(title: "Eksempel 1.2.2 - Funktion med to variabler")[
  Funktioner med to variabler: $f: A -> RR, f(x_1, x_2) = sqrt(16-x_1^2 -x_2^2)$

  Hvad er $A$, $"codom"(f)$, $"im"(f)$?
  
  *Størst muligt domæne $A$:*

  Vi kræver at argumentet til kvadratroden er ikke-negativt:

  $
    16 - x_1^2 &- x_2^2 >= 0  \
    4^2 = 16 &>= x_1^2 + x_2^2 \
  $

  Hvilket beskriver en cirkel med radius 4, hvor $x_2$ er y-aksen og $x_1$ er x-aksen.

  #note-box[
    Dette kan skrives kompakt som 

    $
    A = {(x_1, x_2) in RR^2 | x_1^2 + x_2^2 <= 4^2}
    $
  ]

  #figure(
    cetz.canvas({
      import cetz.draw: *

      let scale = 1.0

      // Axes
      set-style(mark: (fill: black))
      line((-5 * scale, 0), (5 * scale, 0), mark: (end: ">"), stroke: 0.8pt)
      line((0, -5 * scale), (0, 5 * scale), mark: (end: ">"), stroke: 0.8pt)
      content((5 * scale + 0.3, 0), $x_1$, anchor: "west")
      content((0, 5 * scale + 0.3), $x_2$, anchor: "south")

      // Domain circle (filled)
      circle((0, 0), radius: 4 * scale, fill: blue.transparentize(80%), stroke: blue + 1.5pt)
      
      // Label
      content((2.8, 2.8), text(size: 10pt, fill: blue, $A$))
      
      // Grid marks
      for i in (-4, -2, 2, 4) {
        line((i * scale, -0.1), (i * scale, 0.1), stroke: 0.5pt)
        content((i * scale, -0.4), text(size: 8pt, $#i$))
      }
      for i in (-4, -2, 2, 4) {
        line((-0.1, i * scale), (0.1, i * scale), stroke: 0.5pt)
        content((-0.4, i * scale), text(size: 8pt, $#i$))
      }
    }),
    caption: [Domænet $A$ for $f(x_1, x_2) = sqrt(16 - x_1^2 - x_2^2)$ er en cirkel med radius 4]
  ) <fig:domain-circle>

  *Dispositionsmængden (codomænet):*

  $
  "codom"(f) = RR
  $

  *Billedrummet $"im"(f)$:*

  Vi finder minimum og maksimum:

  $
  f(0,0) &= sqrt(16 - 0^2 - 0^2) = 4
  \ f(4,0 ) &= sqrt(16 - 4^2-0^2) = 0
  $

  Så vi kan få alle værdier fra 0 til 4, dermed er billedrummet 

  $
  "im"(f) = [0,4]
  $

  #figure(
    cetz.canvas({
      import cetz.draw: *

      // Number line
      line((-0.5, 0), (5, 0), mark: (end: ">"), stroke: 1pt)
      
      // Mark points
      for (i, label) in ((0, $0$), (4, $4$)) {
        circle((i, 0), radius: 0.08, fill: black)
        content((i, -0.4), label)
      }
      
      // Thick line for range
      line((0, 0), (4, 0), stroke: blue + 3pt)
      
      content((2, 0.6), text(fill: blue, $"im"(f) = [0,4]$))
    }),
    caption: [Billedrummet for $f$ er intervallet $[0, 4]$]
  ) <fig:image-interval>

  *Niveaukurver:*

  For forskellige konstanter $c in "im"(f)$ kan vi tegne niveaukurver:

  $
  N_c &= {(x_1,x_2) | f(x_1, x_2) = c}
  $

  For eksempel:

  $
  N_1 &= {(x_1,x_2) | f(x_1, x_2) = 1} = {(x_1, x_2) | sqrt(16 - x_1^2 - x_2^2) = 1}
  \ &<=> x_1^2 + x_2^2 = 15
  $

  Dette er koncentriske cirkler med radius $sqrt(16 - c^2)$ for $c in [0,4]$.

  #figure(
    cetz.canvas({
      import cetz.draw: *

      let scale = 0.8

      // Axes
      set-style(mark: (fill: black))
      line((-5 * scale, 0), (5 * scale, 0), mark: (end: ">"), stroke: 0.8pt)
      line((0, -5 * scale), (0, 5 * scale), mark: (end: ">"), stroke: 0.8pt)
      content((5 * scale + 0.3, 0), $x_1$, anchor: "west")
      content((0, 5 * scale + 0.3), $x_2$, anchor: "south")

      // Level curves for c = 0, 1, 2, 3, 4
      let colors = (red, orange, yellow, green, blue)
      let c-values = (4, 3, 2, 1, 0)
      
      for (idx, c) in c-values.enumerate() {
        let r = calc.sqrt(16 - c * c) * scale
        if r > 0 {
          circle((0, 0), radius: r, stroke: colors.at(idx) + 1.5pt)
          content((r * 0.7, r * 0.7), text(size: 9pt, fill: colors.at(idx), $c = #c$))
        } else {
          circle((0, 0), radius: 0.1, fill: colors.at(idx))
          content((0.8, 0.3), text(size: 9pt, fill: colors.at(idx), $c = 4$))
        }
      }
    }),
    caption: [Niveaukurver $N_c$ for $c = 0, 1, 2, 3, 4$. Hver kurve viser hvor $f(x_1, x_2) = c$]
  ) <fig:level-curves>
]

#example(title: "Eksempel 13.2 - ReLU (Rectified Linear Unit)")[

  *Skalar version:*
  $
  "ReLU": RR &-> RR \
  "ReLU"(x) = max(0, x) = cases(&x quad x>= 0, &0 quad x < 0)
  $

  *Vektor version:*
  $
  "ReLU": RR^n -> RR^n \
  "ReLU"(x) = vec("ReLU"(x_1), "ReLU"(x_2), dots.v, "ReLU"(x_n) )
  $

  ReLU anvendes ofte som aktiveringsfunktion i neurale netværk, da den introducerer ikke-linearitet og er billig at beregne.

  #figure(
    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      plot.plot(
        size: (6, 4),
        axis-style: "school-book",
        x-label: $x$,
        y-label: $"ReLU"(x)$,
        x-min: -3,
        x-max: 3,
        y-min: -0.5,
        y-max: 3,
        x-tick-step: 1,
        y-tick-step: 1,
        {
          // ReLU function: max(0, x)
          plot.add(
            domain: (-3, 0),
            x => (x, 0),
            style: (stroke: blue + 2pt),
          )
          plot.add(
            domain: (0, 3),
            x => (x, x),
            style: (stroke: blue + 2pt),
          )
          
          // Mark the kink at origin
          plot.add(
            ((0, 0),),
            style: (stroke: none),
            mark: "o",
            mark-style: (fill: blue, stroke: blue + 1pt),
            mark-size: 0.15,
          )
        },
      )
    }),
    caption: [ReLU-funktionen: $"ReLU"(x) = max(0, x)$. Funktionen er ikke-lineær og ikke differentiabel i $x = 0$]
  ) <fig:relu>
]

== Visualisering af funktioner <sec:visualization>

#definition(title: "Definition 1.4 - Visualisering af funktion")[
  *Grafen* for en funktion $f: A -> RR^k$ (hvor $A subset.eq RR^n$) er:
  
  $
  "Graf"(f) = {(x, f(x)) in RR^(n+k) | x in "dom"(f) }
  $

  Vi kan kun visualisere grafer direkte når $n + k <= 3$ (se Eksempel 1.2.2).

  *Input-output view:* Tegning af vektorer fra input til output.

  *Niveaukurver* for $c in "codom"(f)$: Mængden af input der giver output $c$:

  $
   {x in "dom"(f) | f(x) = c }
  $
]

== Neurale netværk som sammensatte funktioner <sec:neural-networks>

#definition(title: "Eksempel 1.3.2 - Neuralt netværk")[

  *Lag 1:* Lineær transformation efterfulgt af aktiveringsfunktion
  $
  f_1: RR^784 &-> RR^50 \
  f_1(arrow(x)) &= sigma_1(A_1 arrow(x) + arrow(b)_1) = arrow(z)_1
  $

  Hvor $sigma_1: RR^50 -> RR^50$ er en aktiveringsfunktion (f.eks. $sigma_1 = "ReLU"$).

  *Lag 2:* Endnu en lineær transformation med aktiveringsfunktion
  $
  f_2: RR^50 &-> RR^10 \
  f_2(arrow(z)_1) &= sigma_2 (A_2 arrow(z)_1 + arrow(b)_2) = arrow(z)_2
  $
  
  Hvor $A_2 in RR^(10 times 50)$, $arrow(b)_2 in RR^10$.

  *Det samlede netværk:* Komposition af lag
  $
  Phi = f_2 compose f_1: RR^784 -> RR^10 
  $

  $
  Phi(arrow(x)) = sigma_2 (A_2 sigma_1 (A_1 arrow(x) + arrow(b)_1) + arrow(b)_2 )
  $

  Dette eksempel viser hvordan komplekse funktioner kan bygges ved at sammensætte simple transformationer.
]

= Kontinuitet <sec:continuity>

== Definition af kontinuitet <sec:continuity-definition>

#definition(title: "Definition 3.2.1 - Kontinuitet")[
  En funktion $f: "dom"(f) -> RR$, hvor $"dom"(f) subset.eq RR$, er *kontinuert* i $x_0 in "dom"(f)$ hvis

  $
  x -> x_0 => f(x) -> f(x_0)
  $

  *Epsilon-delta definition:* For ethvert $epsilon >0$ findes et $delta >0$ således at 
  
  $
  abs(x-x_0) < delta => abs(f(x) - f(x_0)) < epsilon
  $ 
  
  Eller mere kompakt:
  
  $
  forall epsilon > 0 exists delta > 0 : abs(x-x_0 ) < delta => abs(f(x)-f(x_0)) < epsilon
  $

  Funktionen $f$ er kontinuert hvis den er kontinuert i alle punkter i $"dom"(f)$.
]

== Eksempler på kontinuitet <sec:continuity-examples>

#example(title: "Lineær funktion er kontinuert")[
  Lad $a,b in RR$

  $
  f(x) = a x + b, f: RR-> RR
  $

  Påstand: $f$ er kontinuert.

  *Bevis:*

  $
  abs(f(x) - f(x_0)) &= abs( a x + b - (a x_0 + b))
  \ &= abs(a x - a x_0) = abs(a) abs(x-x_0)
  $

  Lad $epsilon > 0$ være givet. Hvis $a = 0$, så er $f$ konstant og dermed kontinuert. Ellers vælger vi:

  $
  delta = epsilon/abs(a)
  $

  Da $abs(x-x_0) < delta$ medfører:

  $
  abs(f(x) - f(x_0)) = abs(a) abs(x-x_0) < abs(a) epsilon/abs(a) = epsilon
  $

  Altså er $f$ kontinuert i ethvert punkt $x_0 in RR$.
]

#example(title: "Heaviside-funktionen - diskontinuert")[

  $
  h: RR -> RR, h(x) = cases(1 quad & x >= 0, 0 quad & x < 0)
  $

  Denne funktion er ikke kontinuert i nul. Vi viser det med epsilon-delta definitionen.

  #figure(
    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      plot.plot(
        size: (6, 3),
        axis-style: "school-book",
        x-label: $x$,
        y-label: $h(x)$,
        x-min: -2,
        x-max: 2,
        y-min: -0.3,
        y-max: 1.5,
        x-tick-step: 1,
        y-tick-step: 1,
        {
          // Left part (h(x) = 0 for x < 0)
          plot.add(
            domain: (-2, 0),
            x => (x, 0),
            style: (stroke: red + 2pt),
          )
          
          // Right part (h(x) = 1 for x >= 0)
          plot.add(
            domain: (0, 2),
            x => (x, 1),
            style: (stroke: red + 2pt),
          )
          
          // Open circle at (0, 0)
          plot.add(
            ((0, 0),),
            style: (stroke: none),
            mark: "o",
            mark-style: (fill: white, stroke: red + 1.5pt),
            mark-size: 0.15,
          )
          
          // Filled circle at (0, 1)
          plot.add(
            ((0, 1),),
            style: (stroke: none),
            mark: "o",
            mark-style: (fill: red, stroke: red + 1pt),
            mark-size: 0.15,
          )
        },
      )
    }),
    caption: [Heaviside-funktionen $h(x)$ har et diskontinuitetsspring ved $x = 0$]
  ) <fig:heaviside>

  $h$ er diskontinuert i $x_0 = 0$. Lad $epsilon = 1/2$.

  Der findes *ikke* et $delta > 0$ således at 

  $
  abs(x) < delta => abs(h(x) - h(0)) < 1/2
  $

  Uanset valg af $delta > 0$ vil der være punkter $x in ]-delta, 0[$ hvor:

  $
  abs(h(x) - h(0)) = abs(0 - 1) = 1 > 1/2
  $

  Derfor er $h$ diskontinuert i $x_0 = 0$.
]

#example(title: "Funktion af to variabler - diskontinuitet i (0,0)")[
  (Se afrunding for uge 1)

  $
  f : RR^2 -> RR, f(x, y) = cases((x^2 y)/(x^4 + y^2) &(x,y) != (0,0), 0 &(x,y) = (0,0) )
  $

  Er $f$ kontinuert for alle $(x,y) in RR^2$?

  *Undersøgelse langs linjer $y = a x$:*
  
  $
  f(x, a x) &= (cancel(x^2) a x)/(cancel(x^4) x^2 + a^2 cancel(x^2))
  \ &= (a x)/(x^2 + a^2) -> 0/(0 + a^2) = 0 "når" x -> 0 
  $

  Langs alle linjer går funktionen mod 0.

  *Undersøgelse langs parabler $y = a x^2$:*

  Hvis $y = a x^2, a in RR$:

  $
  f(x,a x^2) &= (x^2 a x^2)/(x^4 + a^2 x^4)
  \ &= a/(1 + a^2)
  $

  Så funktionsværdien er en konstant værdi (afhænger ikke af $x$).

  #figure(
    cetz.canvas({
      import cetz.draw: *

      let scale = 0.8

      // Axes
      set-style(mark: (fill: black))
      line((-3 * scale, 0), (3 * scale, 0), mark: (end: ">"), stroke: 0.8pt)
      line((0, -3 * scale), (0, 3 * scale), mark: (end: ">"), stroke: 0.8pt)
      content((3 * scale + 0.3, 0), $x$, anchor: "west")
      content((0, 3 * scale + 0.3), $y$, anchor: "south")

      // Draw linear approaches (y = ax)
      for a in (-2, -1, 0, 1, 2) {
        line(
          (-2.5 * scale, -2.5 * a * scale),
          (2.5 * scale, 2.5 * a * scale),
          stroke: blue.transparentize(50%) + 0.8pt
        )
      }

      // Draw parabolic approaches (y = ax^2)
      import cetz-plot: *
      for a in (-1, -0.5, 0.5, 1) {
        plot.plot(
          size: (6 * scale, 6 * scale),
          x-min: -2.5,
          x-max: 2.5,
          y-min: -2.5,
          y-max: 2.5,
          axis-style: none,
          {
            plot.add(
              domain: (-2, 2),
              x => (x, a * x * x),
              style: (stroke: red.transparentize(30%) + 1.2pt),
            )
          },
        )
      }

      // Mark origin
      circle((0, 0), radius: 0.1, fill: black)

      // Labels
      content((2.2 * scale, 1.8 * scale), text(size: 9pt, fill: blue, [Linjer]))
      content((1.5 * scale, -1.8 * scale), text(size: 9pt, fill: red, [Parabler]))
    }),
    caption: [Funktionen $f(x,y)$ nærmet fra forskellige retninger. Langs linjer (blå) går $f -> 0$, men langs parabler (rød) går $f$ mod forskellige værdier]
  ) <fig:discontinuous-2d>

  $f$ er diskontinuert i $(x,y) = (0,0)$ fordi grænseværdien afhænger af retningen vi nærmer os $(0,0)$ fra.

]

= Exercises <sec:exercises>
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
  Funktionen er ikke linær da det er en piecewise funktion der ikke er differentiabel i punktet $x = 0$. For at en funktion skal være lineær skal den opfylde to betingelser:
  1. Additivitet: $f(x + y) = f(x) + f(y)$ for alle $x, y in RR^n$.
  2. Homogenitet: $f(c x) = c f(x)$ for alle $x in RR^n$ og skalarer $c in RR$.
  
  ReLU opfylder ikke additivitet, for eksempel:
  $
    "ReLU"(1 + (-1)) = "ReLU"(0) = 0 \
    "ReLU"(1) + "ReLU"(-1) = 1 + 0 = 1 \
    0 != 1
  $
  
  Derfor er ReLU ikke en lineær funktion.
]
#math-problem(number: "5")[
  *Mulige visualiseringer*

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
]

#solution[
  For at kunne visualisere en funktion $f: RR^n -> RR^k$ kræves det at $n + k <= 3$ (vi kan kun se 3 dimensioner).

  + *$f: RR^2 -> RR$* -- Ja, kan visualiseres! ($2 + 1 = 3$ dimensioner). Grafen er en flade i 3D.
  
  + *$f: RR^4 -> RR$* -- Nej, kan ikke visualiseres direkte ($4 + 1 = 5$ dimensioner).
  
  + *$f: RR^2 -> CC$* -- Nej, ikke direkte ($2 + 2 = 4$ dimensioner). Man kan dog visualisere realdelen og imaginærdelen separat som to 3D-flader.
  
  + *$bold(f): RR^2 -> RR^2$* -- Ja! Vektorfeltet kan vises i 2D-planet med pile.
  
  + *$bold(f): RR^3 -> RR^3$* -- Ja! Vektorfeltet kan vises i 3D med pile i rummet.
  
  + *$bold(r): [0,10] -> RR^3$* -- Ja! En parametrisk kurve (helix) i 3D-rummet.

  === (a) Skalarfunktion $f(x_1, x_2) = sqrt(abs(x_1 x_2))$

  #align(center)[
    #let surface-func(x, y) = calc.sqrt(calc.abs(x * y))
    #let color-func(x, y, z, x-lo, x-hi, y-lo, y-hi, z-lo, z-hi) = {
      let t = if z-hi == z-lo { 0.5 } else { (z - z-lo) / (z-hi - z-lo) }
      return blue.lighten((1 - t) * 60%).transparentize(30%)
    }
    #plot-3d-surface(
      surface-func,
      color-func: color-func,
      subdivisions: 10,
      xdomain: (-2, 2),
      ydomain: (-2, 2),
      scale-dim: (0.08, 0.08, 0.04),
      axis-step: (1, 1, 1),
    )
  ]

  === (d) 2D Vektorfelt $bold(f)(x_1, x_2) = (-x_2/3, x_1/3)$

  Dette er et rotationsfelt (mod uret):

  #figure(
    cetz.canvas({
      import cetz.draw: *

      let scale = 0.8
      let arrow-scale = 0.25

      // Axes
      set-style(mark: (fill: black))
      line((-3.5 * scale, 0), (3.5 * scale, 0), mark: (end: ">"), stroke: 0.8pt)
      line((0, -3.5 * scale), (0, 3.5 * scale), mark: (end: ">"), stroke: 0.8pt)
      content((3.5 * scale + 0.2, 0), $x_1$, anchor: "west")
      content((0, 3.5 * scale + 0.2), $x_2$, anchor: "south")

      // Vector field: f(x1, x2) = (-x2/3, x1/3)
      for i in range(-2, 3) {
        for j in range(-2, 3) {
          if i == 0 and j == 0 { continue }
          let x = i * scale
          let y = j * scale
          let vx = -j * arrow-scale * scale
          let vy = i * arrow-scale * scale
          line(
            (x, y),
            (x + vx, y + vy),
            stroke: blue + 1pt,
            mark: (end: ">", fill: blue, scale: 0.4),
          )
        }
      }

      circle((0, 0), radius: 0.06, fill: red)
    }),
    caption: [Rotational vector field $bold(f)(x_1, x_2) = (-x_2 slash 3, x_1 slash 3)$ showing counterclockwise rotation]
  ) <fig:rotation-field>

  Vektorerne peger vinkelret på radiusvektoren og danner et rotationsmønster mod uret.

  === (e) 3D Vektorfelt $bold(f)(x, y, z) = (x^3 + y z^2, y^3 - x z^2, z^3)$

  #align(center)[
    #let i-func(x, y, z) = calc.pow(x, 3) + y * calc.pow(z, 2)
    #let j-func(x, y, z) = calc.pow(y, 3) - x * calc.pow(z, 2)
    #let k-func(x, y, z) = calc.pow(z, 3)
    #let color-func(x, y, z, x-lo, x-hi, y-lo, y-hi, z-lo, z-hi) = {
      let t = if z-hi == z-lo { 0.5 } else { (z - z-lo) / (z-hi - z-lo) }
      return purple.darken(t * 50%)
    }
    #plot-3d-vector-field(
      i-func,
      j-func,
      k-func,
      color-func: color-func,
      subdivisions: 2,
      subdivision-mode: "decrease",
      scale-dim: (0.03, 0.03, 0.03),
      xdomain: (-2, 2),
      ydomain: (-2, 2),
      zdomain: (-2, 2),
      rotation-matrix: ((-1.5, 1.2, 4), (0, -1, 0)),
      vector-size: 0.08em,
      vector-length-scale: 0.3,
    )
  ]

  === (f) Helix-kurve $bold(r)(t) = (cos(t), sin(t), t)$

  Projektionen på $x$-$y$ planet er en cirkel. Den fulde kurve er en helix (skruelinje):

  #figure(
    cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *

      plot.plot(
        size: (4, 4),
        axis-style: "school-book",
        x-label: $x$,
        y-label: $y$,
        x-min: -1.5,
        x-max: 1.5,
        y-min: -1.5,
        y-max: 1.5,
        x-tick-step: 1,
        y-tick-step: 1,
        {
          plot.add(
            domain: (0, 4 * calc.pi),
            samples: 200,
            t => (calc.cos(t), calc.sin(t)),
            style: (stroke: blue + 1.5pt),
          )
        },
      )
    }),
    caption: [Projection of helix curve $bold(r)(t) = (cos(t), sin(t), t)$ onto the $x$-$y$ plane]
  ) <fig:helix-projection>

  #note-box[
    Projektionen viser en cirkel, men i 3D stiger kurven opad langs $z$-aksen mens den roterer. For fuld 3D-visualisering kan Python med `dtuplot.plot3d_parametric_line` bruges.
  ]
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

$
Phi(vec(0.5,1)) &=  mat(-1,2) "ReLU"(mat(2,0;-1,1) vec(0.5,1) + vec(-1,0)) + 0 \
&= mat(-1,2) "ReLU"(vec(1,0.5) + vec(-1, 0) ) + 0 \
&= mat(-1,2) "ReLu"(vec(0,0.5)) + 0 \ 
&= mat(-1,2) vec(0,0.5) + 0 \
&= mat(-1,2) vec(0,0.5) \
&= 1
$

]

==== Spørgsmål b

Find et punkt $bold(x)$, hvor netværkets output $bold(Phi)(bold(x))$ er negativt. Begrund dit svar.

#solution[
  lad os vælge $x = mat(2,2)^T$:
  
  $
    A_1 bold(x) + bold(b)_1 &= mat(2, 0;-1, 1) vec(2, 2) + vec(-1, 0) \
    &= vec(2 dot 2 + 0 dot 2, -1 dot 2 + 1 dot 2) + vec(-1, 0) \
    &= vec(4, 0) + vec(-1, 0) \
    &= vec(3, 0)
  $
  
  så kan vi anvende ReLU:
  $
    "ReLU"(vec(3, 0)) = vec(max(0, 3), max(0, 0)) = vec(3, 0)
  $
  
  Nu kan vi beregne outputlaget:
  $
    bold(Phi)(bold(x)) &= A_2 vec(3, 0) + b_2 \
    &= mat(-1, 2) vec(3, 0) + 0 \
    &= vec(-1 dot 3 + 2 dot 0) + 0 \
    &= vec(-3)
  $


 #note-box[
   Work my way backwards
 ]
]

==== Spørgsmål c

Hvor mange justerbare parametre (vægte og bias-værdier) har dette netværk totalt?

#solution[
  Lag 1: Matrix $A_1$ er $2 times 2$ (4 parametre), bias $b_1$ er $2 times 1$ (2 parametre). I alt $4 + 2 = 6$.
  Lag 2: Matrix $A_2$ er $1 times 2$ (2 parametre), bias $b_2$ er $1 times 1$ (1 parameter). I alt $2 + 1 = 3$.

  Den totale antale parametre er $6 + 3 = 9$.

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

  #note-box[
    Unsure about this one rn 
  ]


]

=== 7: Visualisering af Netværket

I denne opgave skal du bruge Python til at visualisere funktionen $bold(Phi)(bold(x))$ fra forrige opgave (med ReLU som aktiveringsfunktion).

Du skal plotte grafen for netværket over området $x_1, x_2 in [-2, 2]$.

#note-box[
  Læg mærke til, at grafen består af plane flader, der er "knækket" og sat sammen. Dette skyldes ReLU-funktionen, som er stykkevis lineær. I store netværk der anvendes i praksis sættes millioner af sådanne lineære underrum sammen.
]

Kan du plotte grafen af det samme neurale netværk hvor $bold(sigma)_("step")$ bruges i stedet for ReLU? Planerne i den nye graf bør ikke "hænge sammen" (hvorfor?).

#solution[
  #figure(
    image("neural_network_plot.png"),
    caption: [ReLU med normal aktiveringsfunktion]
  )
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
