#import "@local/dtu-template:0.6.2": *

#import "@preview/cetz:0.4.2"

#show: dtu-physics-note.with(
  course: "10060",
  course-name: "Fysik (Polyteknisk grundlag)",
  title: "Lecture - February 09, 2026",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)

= Kinematik i 2D

== Bevægelse i 2 og 3 Dimensioner

En positionsvektor i tre dimensioner kan skrives som:

$
arrow(r)(t) = vec(x(t), y(t), z(t))
$

Givet to positionsvektorer $arrow(r)_1$ og $arrow(r)_2$ kan vi finde forskellen mellem disse to vektorer, $Delta arrow(r)$, som:

$
Delta arrow(r) = arrow(r)_2 - arrow(r)_1
$

Den *gennemsnitlige hastighedsvektor* er givet ved:

$
arrow(v)_"gns" = (Delta arrow(r))/(Delta t) = (arrow(r)_2 - arrow(r)_1)/(t_2 - t_1)
$

Den *instantane hastighedsvektor* (den øjeblikkelige hastighed) kan skrives som:

$
arrow(v) = vec((d x(t))/(d t), (d y(t))/(d t), (d z(t))/(d t)) = vec(v_x, v_y, v_z) = vec(x'(t), y'(t), z'(t))
$

*Farten* (hastighedens størrelse) er:

$
abs(arrow(v)) = sqrt(v_x^2 + v_y^2 + v_z^2)
$

#note-box[
I to dimensioner udelades det sidste led, så $abs(arrow(v)) = sqrt(v_x^2 + v_y^2)$
]

=== Komponenter af en Hastighedsvektor

Givet en hastighedsvektor $arrow(v)$ i et xy-koordinatsystem, kan vi altid opdele den i komponenterne $v_x$ og $v_y$. Hvis vektoren danner en vinkel $alpha$ med x-aksen, gælder:

$
v_x &= abs(arrow(v)) dot cos(alpha) \
v_y &= abs(arrow(v)) dot sin(alpha)
$

Dette følger direkte af trigonometri. Farten kan findes ved:

$
"fart" = abs(arrow(v)) = sqrt(v_x^2 + v_y^2)
$

For at finde retningen af vektoren (vinklen $alpha$):

$
tan(alpha) &= v_y / v_x \
alpha &= tan^(-1)(v_y / v_x)
$

=== Accelerationsvektoren

Accelerationsvektoren beskriver ændringen i hastighedsvektoren. Når en partikel bevæger sig langs en kurve, kan både størrelsen og retningen af hastighedsvektoren ændre sig.

#align(center)[
 TODO: FIGURE
]

Ændringen i hastigheden er:

$
Delta arrow(v) = arrow(v)_2 - arrow(v)_1
$

Den gennemsnitlige acceleration er:

$
arrow(a)_"gns" = (Delta arrow(v))/(Delta t)
$

=== Instantan Accelerationsvektor

Den øjeblikkelige accelerationsvektor findes ved:

$
arrow(a) = (d arrow(v))/(d t) = vec((d v_x)/(d t), (d v_y)/(d t), (d v_z)/(d t)) = vec(a_x, a_y, a_z)
$

#example(title: "Parallel og Vinkelret Komponent")[
  Accelerationsvektorens retning har betydning for bevægelsen:

  - Parallel med hastigheden ($arrow(a) parallel arrow(v)$):
    - Hvis $arrow(a)$ peger samme vej som $arrow(v)$: farten stiger
    - Hvis $arrow(a)$ peger modsat $arrow(v)$: farten falder

  - Vinkelret på hastigheden ($arrow(a) perp arrow(v)$):
    - Kun retningen ændres, ikke farten
    - Eksempel: ensartet cirkelbevægelse

  Generelt kan acceleration opdeles i:
  - Tangentiel acceleration $a_(||)$: ændring i $abs(arrow(v))$ (farten)
  - Radial acceleration $a_perp$: ændring i retningen af $arrow(v)$
]

== Projektilbevægelse

Forudsætninger:

1. Kun tyngdekraften virker (ingen luftmodstand)
2. Punktformet partikel

#align(center)[
  TODO: Drawing
]

#example(title: "Projektilbevægelsens Ligninger")[

  Acceleration:

  $
  a_x &= 0 quad "(Ingen luftmodstand)" \
  a_y &= - g quad "(Tyngdekraften)"
  $

  Både $a_x$ og $a_y$ er konstante i tid.

  Hastighed:

  $
  v_x &= v_(0,x) = abs(arrow(v)_0) dot cos(alpha_0) \
  v_y &= v_(0,y) - g dot t = abs(arrow(v)_0) dot sin(alpha_0) - g dot t
  $

  Position:

  $
  x(t) &= x_0 + v_(0,x) dot t quad "(Lineær i tid)" \
  y(t) &= y_0 + v_(0,y) dot t - 1/2 g t^2 quad "(Kvadratisk i tid)"
  $

  Banekurve (bane-ligning uafhængig af tid):

  For $x_0 = y_0 = 0$ kan vi isolere $t$ fra $x(t)$:

  $
  x(t) &= v_0 cos(alpha_0) dot t <==> t = x/(v_0 cos(alpha_0)) \
  y(t) &= v_0 sin(alpha_0) dot t - 1/2 g t^2
  $

  Indsæt $t$ i $y(t)$:

  $
  y(x) &= v_0 sin(alpha_0) dot x/(v_0 cos(alpha_0)) - 1/2 g (x/(v_0 cos(alpha_0)))^2 \
  y(x) &= tan(alpha_0) dot x - g/(2v_0^2 cos^2(alpha_0)) dot x^2
  $

  Dette er baneligningen - uafhængig af tid.

  #note-box[
  Bemærk: Baneligningen forudsætter at vi starter i $(0,0)$. For andre startpositioner skal $x_0$ og $y_0$ inkluderes.
  ]
]


#example(title: "2 lande i krig")[
  2 lande er i krig: Det ene land beskyder det andet land med et missil. Missilet skal rejse $L = 30$ km for at ramme målet og holde sig under $h=1$ km højde for ikke at bliver skudt ned.


  1. Hvad er hastigheden på missilen, og hvad er affyringsvinklen?
  2. Hvor lang tid er missilen undervejs?
  
  Vi er interesserede i at finde $v_0$, $alpha$ og $t$.


  #solution[
    Det højeste punkt er givet ved:

    $
      h = y = (v_0 dot sin(theta))^2/(2g) <==> v_0 = sqrt((h dot 2g)/(sin^2 theta))
    $

    Længden (range) er givet ved:

    $
      L &= R = (v_0^2 dot sin(2theta))/g = (h 2 cancel(g) sin(2 theta))/(cancel(g) sin^2 theta) = (2 dot 2 h cos (theta))/(sin (theta)) \ 
      &= (sin theta)/(cos(theta)) = (2 dot 2 h)/L <==> tan(theta) = (4h)/L \
      &=> theta = tan^(-1)((4h)/L) = tan^(-1) ((4 dot 1000 "m")/(30 dot 1000 "m")) = 0.13 "rad" approx 7.59^degree
    $

    Affyringshastigheden:

    $
      v_0 = sqrt((h dot 2g)/(sin^2 theta)) = sqrt((1000 "m" dot 2 dot 9.8 "m"/"s"^2)/(sin^2(0.13 "rad"))) = 1059 "m"/"s" = 3813 "km"/"t"
    $

    Flyvningstid (time of flight):

    $
      T_"tof" = (2 dot v_0 dot sin(theta))/(g) = (2 dot 1059 "m"/"s" dot sin(0.13 "rad"))/(9.8 "m"/"s"^2) = 28 "s"
    $

  ]

]


#example(title: "2 lande i krig fra bjerg")[
  Starthøjden er nu $500 "m"$

  Positioner og hastigheder:

  $
    x(t) &= v_(0,x) dot t \
    y(t) &= v_(0,y) dot t - 1/2 g t^2 + 500 "m" \
    v_x &= v_(0,x) \
    v_y &= v_(0,y) - g t
  $

  Vi siger at nedslag sker ved tidspunkt $T$:

  $
    x(t = T) &= L = v_(0,x) dot T \
    y(t = T) &= 0 = v_(0,y) dot T - 1/2 g T^2 + 500 "m"
  $

  Vi kan kalde toppunktet for $t^*$:

  $
    v_x (t^*) &= v_(0,x) \
    v_y(t^*) &= 0 = v_(0,y) - g dot t^* \
    (v_(0,x))/(v_(0,y)) = (v_0 sin theta)/(v_0 cos theta) <==> tan theta = (v_(0,y))/(v_(0,x))
  $

  #note-box[
    Vi har altså fem ligninger med fem ukendte. Her vil det være oplagt at bruge SymPy til at finde løsningen.
  ]

  Svar: $v_0 = 1230 "m"/"s"$

]


== Cirkel Bevægelse 

=== Cirkelbevægelse med konstant hastighed

For ensartet cirkelbevægelse (konstant fartens størrelse) gælder:

$
abs(arrow(v)) &= "konstant" \
abs(arrow(a)_"rad") &= v^2/R
$

Hastigheden kan udtrykkes ved omkredsen og omløbstiden:

$
v &= ("omkreds")/"omløbstid" = (2 pi dot R)/T
$

Radial acceleration kan også udtrykkes ved omløbstiden:

$
a_"rad" &= v^2/R = ((2 pi R)/T)^2 / R = (4 pi^2 dot R^2)/(T^2 dot R) \ 
&= (4 pi^2 dot R)/T^2
$


#example(title: "Cykelist")[
  En cykelist kører rundt i en cirkel med en omløbstid på 30 sekunder og med hastigheden 10 km/t. Hvad er den radiale acceleration som cykelisten bliver påvirket af? (Brug $g = 9.8 "m"/"s"^2$)

  Relevante ligninger:

  $
    v &= (2 pi r)/(T) \ 
    a_"rad" &= v^2/r
  $

  Vi kender omløbstiden $T = 30 "s"$ og hastigheden:

  $
    v = 10 "km"/"t" = 10/3.6 = #calc.round(10/3.6, digits: 2) "m"/"s"
  $

  Vi kan løse for $r$ i hastighedsligningen:

  $
    r &= (v dot T)/(2 pi) = (2.78 "m"/"s" dot 30 "s")/(2 pi) \ 
    &= 13.3 "m"
  $

  Vi sætter ind i $a_"rad"$:

  $
    a_"rad" &= (2.78 "m"/"s")^2/(13.3 "m") = 0.58 "m"/"s"^2 \
    &= (0.58)/(9.8) = 0.06 g
  $

]

=== Tangential acceleration

Den *tangentielle acceleration* er defineret som:

$
a_"tan" &= (d abs(v))/(d t)
$

#note-box[
  Bemærk at:
  
  $
    (d abs(v))/(d t) != abs((d arrow(v))/(d t))
  $

  Dette skyldes at:

  $
    (d arrow(v))/(d t) &= arrow(a)_"total" \ 
    abs((d arrow(v))/(d t)) &= abs(arrow(a)_"total") = sqrt(a^2_"rad" + a^2_"tan")
  $

  Størrelsen af den totale acceleration er altså ikke det samme som den afledede af hastighedens størrelse.
]


#example(title: "Centrifuge")[
  En centrifuge har en konstant tangential acceleration på $a_"tan" = 8 "m"/"s"^2$ i $15 "s"$, hvorefter den opnår sin endelige hastighed.

  1. Hvad er denne hastighed?
  2. Hvor mange omdrejninger per minut (RPM) har centrifugen efter accelerationen? (Radius $R = 0.3 "m"$)

  Del 1: Hastighed

  $
    (d abs(v))/(d t) &= a_"tan" \ 
    v(t) &= integral a_"tan" d t = integral_0^(15"s") a_"tan" d t = [a_"tan" dot t]_0^15 \ 
    &= 8 "m"/"s"^2 dot 15 "s" = 120 "m"/"s"
  $

  Del 2: Omdrejninger per minut

  Omkredsen af centrifugen:

  $
    O = 2 pi dot R = 2 pi dot 0.3 "m" = 1.88 "m"
  $

  Omdrejninger per sekund og derefter per minut:

  $
    "RPS" &= (120 "m"/"s")/(1.88 "m") = 63.8 "rps" \
    "RPM" &= 63.8 "rps" dot 60 = 3828 "RPM"
  $
]


== Relativ Bevægelse

#example(title: "Eksempel: Relativ hastighed i to dimensioner")[

  Hvilken kurs skal et fly have for at kompensere for en sidevind?

  $
    sin(beta) &= ("modstående katete")/"hypotenusen" \
    &= abs(arrow(v)_(L | J))/abs(arrow(v)_"F|L") \
    
    beta &= sin^(-1)((100 "km"/"h" )/(240 "km"/"h")) = 24.6^degree
  $
  
  hvor:
  - $arrow(v)_(L | J)$ er luftens hastighed i forhold til jorden (sidevinden)
  - $arrow(v)_"F|L"$ er flyets hastighed i forhold til luften
  - $beta$ er den vinkel flyet skal kompensere med
]


= Opgaver

== Opgave 1 

A particle moves in a projectile motion neglecting air resistance. In the figure below, part of the parabolic trajectory is drawn, and three points, 1, 2 and 3, are marked. The speed of the particle in the points are $v_1$, $v_2$ and $v_3$.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    // Draw Ground
    line((-1, 0), (7, 0), stroke: (thickness: 2pt))

    // Draw Parabola (Bezier)
    // Start low left, peak middle high, end low right
    bezier((0, 0), (5.2, 3.2), (2.5, 7), stroke: (dash: "dashed", paint: blue, thickness: 1.5pt), name: "curve")

    // Mark points
    let p1 = (0.75, 1.8)
    let p2 = (3, 4.5) // Peak area
    let p3 = (5.2, 3.2)

    fill(black)
    circle(p1, radius: 0.15, name: "c1")
    circle(p2, radius: 0.15, name: "c2")
    circle(p3, radius: 0.15, name: "c3")

    content((p1.at(0) + 0.4, p1.at(1)), text(size: 14pt, "1"))
    content((p2.at(0), p2.at(1) - 0.5), text(size: 14pt, "2"))
    content((p3.at(0) - 0.4, p3.at(1)), text(size: 14pt, "3"))

    // Draw Direction Arrows on path
    line((1.5, 3.5), (1.8, 4.0), mark: (end: "stealth", fill: blue, scale: 0.8), stroke: (paint: blue, thickness: 2pt))
    line((4.5, 4.0), (4.8, 3.5), mark: (end: "stealth", fill: blue, scale: 0.8), stroke: (paint: blue, thickness: 2pt))
  })
]

What is the relationship between the speed in the three points?

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [A) $v_1 = v_2 = v_3$],
  [B) $v_1 < v_2 < v_3$],
  [C) $v_1 < v_3 < v_2$],
  [D) $v_2 < v_1 < v_3$],
  [E) $v_2 < v_3 < v_1$],
  [F) $v_3 < v_1 < v_2$],
  [G) $v_3 < v_1 < v_2$],
  [H) Don't know]
)

Answer: E.  $v_2 < v_3 < v_1$, $v_2$ is the apex of the projectile curve, and therefore the velocity will be the lowest. $v_3$ hasn't reached its full potential, and is therefore at a lower velocity than $v_1$. And $v_1$ which is the start velocity is the highest. 

// --- PROBLEM 2 ---
== Opgave 2 
A person kicks a ball which rests on the top of a staircase. The ball has a horizontal velocity $v$ after the kick. The ball just misses the lowest step on the staircase. Each step on the staircase is a square with side lengths $d$.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    // Draw Stairs
    let step_size = 1
    let steps = 3

    // Top platform
    line((-2, 3), (0, 3), stroke: 1pt)

    // Steps
    line((0,3), (0,2), (1,2), (1,1), (2,1), (2,0), (3,0), (3,-1), stroke: 1pt)

    // Ground
    line((-3,-1), (4,-1), stroke: 2pt)

    // Ball
    circle((0, 3.15), radius: 0.15, fill: black)
    line((0, 3.15), (1, 3.15), mark: (end: "stealth"), name: "vec")
    content("vec.end", anchor: "south", padding: 0.2, $v$)

    // Trajectory
    bezier((0, 3), (2.5, 3), (2.1, 0), stroke: (dash: "dashed"))

    // Dimensions
    line((-0.5, 2), (-0.5, 1), mark: (start: "stealth", end: "stealth"))
    content((-0.8, 1.5), $d$)

    line((1, 0.5), (2, 0.5), mark: (start: "stealth", end: "stealth"))
    content((1.5, 0.8), $d$)
  })
]

What is the magnitude of the initial velocity $v$?

#grid(
  columns: (1fr, 1fr, 1fr),
  row-gutter: 1em,
  [A) $v = frac(sqrt(g d), 2)$],
  [B) $v = sqrt(g d)$],
  [C) $v = sqrt(3g d)$],
  [D) $v = 3sqrt(g d)$],
  [E) $v = frac(sqrt(3g d), sqrt(2))$],
  [F) $v = frac(sqrt(3g d), 2)$],
  [G) $v = frac(3sqrt(g d), sqrt(2))$],
  [H) $v = frac(sqrt(3g d), 4)$],
  [I) Don't know]
)

#solution[]

// --- PROBLEM 3 ---

== Opagve 3 

A person is at equator and is moving in a circular motion. The radius of the earth is 6370 km.

a) Determine the acceleration of the person.

If earth were rotating faster, the person would become weightless when the acceleration was $g$.

b) Determine the period of rotation of the earth if a person had to become weightless.


#solution[

  1. 
  $
  v = (2 pi dot R)/(T)
  $

  Assuming the earth takes 24 hours to complete a full rotation $approx #(24*60*60) "s" $


  #let seconds = 24*60*60 

  $
  v = (2 pi dot #(6370 * 1000 )"m")/(#seconds "s") = #calc.round((2 * calc.pi * 6370*1000)/seconds, digits: 2) "m"/"s" 
  $

  We now find the acceleration $a_"rad"$


  $
  a_"rad" = #calc.round( calc.pow(calc.round((2 * calc.pi * 6370*1000)/seconds, digits: 2), 2)/(6370*1000)  ,digits: 4) "m"/"s"
  $

  2.

  // Figure this shit out lol
  //
]

// --- PROBLEM 4 ---

== Opgave 4 

A rock is thrown from a point A on top of a tower and hits the point B on the ground 3.5 s later. The line from A to B has an angle of $50^(degree)$ with the horizon.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    // Tower
    rect((-1, 0), (0, 4), fill: tiling(size: (5pt, 5pt))[ \ \ / \ ], stroke: 1pt)
    line((-1, 0), (6, 0), stroke: 1pt) // Ground

    let start = (0, 4)
    let end = (5, 0)

    // Trajectory
    bezier(start, (2, 4.5), end, stroke: (dash: "dashed"))

    // Line A to B
    line(start, end, stroke: (dash: "dashed"))

    // Horizontal line from A
    line(start, (2, 4), stroke: 0.5pt)

    // Angle arc
    arc(start, start: 0deg, stop: -38.6deg, radius: 1, name: "angle")
    content((1.3, 3.6), $50^(degree)$)

    // Points
    content(start, anchor: "south-east", [A])
    content(end, anchor: "north-west", [B])

    // Initial velocity arrow (approx)
    line(start, (1, 4), mark: (end: "stealth"))
  })
]

a) Determine the initial speed of the rock.

// --- PROBLEM 5 ---

A person plays with a tennis ball in a large room and tries to throw the ball from one end of the room and hit a picture hanging $h=30$ cm from the ceiling on the opposite end of the room. It is assumed, that the person throwing the ball, throws the ball in the same height as the picture. The ball just barely avoids touching the ceiling. The room is $L=10$ m long.

a) Determine the initial speed of the ball, the initial angle and duration of flight if the ball has to hit the picture.

// --- PROBLEM 6 ---

A diver jumps from 3 m springboard. During the jump, the diver reaches a height on 2.5 m above the springboard and lands in the water 2.8 meters from the starting point.

a) Determine the x and y components of the initial speed, the angle of the jump as well as the duration of flight.

// --- PROBLEM 7 ---

In a shopping cart a vertical toy cannon is placed. The shopping cart is traveling with constant speed $v$ on the floor in the supermarket. The cannon shots by mistake a projectile vertical into the air compared to the shopping cart, with the same velocity $v$ as the shopping cart is traveling with. By accident, the projectile from the cannon end up into the cannon after the shopping cart has traveled the distance $L$.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    let cart(x) = {
      rect((x, 0.5), (x + 1.5, 1.5), stroke: 1.5pt) // Basket
      line((x, 1.5), (x - 0.3, 2), stroke: 1.5pt) // Handle
      circle((x + 0.3, 0.25), radius: 0.25, stroke: 1.5pt) // Wheel 1
      circle((x + 1.2, 0.25), radius: 0.25, stroke: 1.5pt) // Wheel 2
      rect((x + 0.5, 0.5), (x + 0.7, 1.8), fill: blue) // Cannon
    }

    // Floor
    rect((-1, -0.5), (8, 0), fill: black)

    // Cart 1
    cart(0)
    line((1.6, 1), (2.5, 1), mark: (end: "stealth"))
    content((2, 1.2), $v$)

    // Cart 2
    cart(5)

    // Trajectory
    bezier((0.6, 1.8), (2.5, 5), (5.6, 1.8), stroke: (dash: "dashed"))

    // Distance L
    line((0.75, -0.8), (5.75, -0.8), mark: (start: "stealth", end: "stealth"))
    content((3.25, -1.2), $L$)
  })
]

What is the velocity $v$ which makes this maneuver possible?

#grid(
  columns: (1fr, 1fr, 1fr),
  row-gutter: 1em,
  [A) $v = sqrt(g L)$],
  [B) $v = sqrt(2g L)$],
  [C) $v = sqrt(2sqrt(2) g L)$],
  [D) $v = sqrt((g L)/2)$],
  [E) $v = sqrt((g L)/(2sqrt(2)))$],
  [F) Don't know]
)

// --- PROBLEM 8 ---

A ball is thrown from one person to another, with a distance $L$ between one another. The ball is thrown and catched at the same height. The ball is thrown in a way, so the ball is at the receiver with lowest speed possible.

a) What is the speed of the ball immediately before it is catched?
b) At what angle should the ball be thrown?

// --- PROBLEM 9 ---

A particle (1) is at time $t=0$ thrown with an initial velocity $v_0$ from an unknown height $h$ above the ground. At the same time, another particle (2) with initial velocity is thrown along the ground. Particle (2) starts its horizontal movement at point $L$ to the right of the first particle. Neglect any friction. At an unknown time $T$, the two particles collide.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    // Cliff
    line((-1, 4), (0, 4), (0, 0), (6, 0), stroke: 1.5pt)

    // Particle 1
    circle((0, 4), radius: 0.1, fill: black)
    content((0, 4), anchor: "south-east", [(1)])
    line((0, 4), (1.5, 4), mark: (end: "stealth"))
    content((0.75, 4.3), $v_0$)

    // Particle 2
    circle((3, 0), radius: 0.1, fill: black)
    content((3, 0), anchor: "south-east", [(2)])
    line((3, 0), (4.5, 0), mark: (end: "stealth"))
    content((3.75, 0.3), $v_0/2$)

    // Trajectory
    bezier((0, 4), (3, 4), (5.5, 0), stroke: (dash: "dashed"))

    // Dimensions
    line((-0.2, 4), (-0.2, 0), mark: (start: "stealth", end: "stealth"))
    content((-0.5, 2), $h$)

    line((0, -0.5), (3, -0.5), mark: (start: "stealth", end: "stealth"))
    content((1.5, -0.8), $L$)
  })
]

a) Determine the time $T$.
b) Determine the height $h$.

The height is assumed known:
c) What is the magnitude of the relative speed, $vec(v)_(r e l) = vec(v)_1 - vec(v)_2$ between the two particles immediately before they collide?

// --- PROBLEM 10 ---

A football player has a free kick $3L = 30.0$ m from the goal. The wall of defenders is placed 10.0 m from where the free kick is taken. The wall of defenders is $h=2.0$ m tall. The goal has the height $H=2.44$ m. The football player kicks the ball, so the initial velocity has an angle of $15^(degree)$ with the horizon, and he kicks it hard enough, so the ball does not hit the ground before it hits the goal.

a) Make a drawing of the situation with relevant physical magnitudes.
b) Determine the initial velocity the football player has to kick the ball, so the ball just barely goes over the wall.
c) Determine the interval of initial speed in which the ball ends in the goal.

// --- PROBLEM 11 ---

A car travels in on a circular track with radius $R$. The car starts from rest and has a tangential acceleration $a_0$.

a) Derive an expression for the speed of the car and the radial acceleration.
b) Determine the magnitude of the acceleration of the car when it has traveled one round on the track.
