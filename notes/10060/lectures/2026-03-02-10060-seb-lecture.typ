#import "@local/dtu-template:0.6.3":*
#import "@preview/callisto:0.2.4"
#import "@preview/mitex:0.2.6": mitex
#import "@preview/cmarker:0.1.8"
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/physica:0.9.8": *
#import "@preview/quill:0.7.2": *
#import "@preview/unify:0.7.1": qty, unit, num, numrange, qtyrange

#set text(lang: "da")

#show: dtu-physics-note.with(
  course: "10060",
  course-name: "Physics (Polytechnical Foundation)",
  title: "Kraft - Lecture - March 02, 2026",
  date: datetime(year: 2026, month: 3, day: 2),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

#definition(title: "Enheden for Kraft")[
  $
    unit("N") = unit("kg m/s^2")
  $
  #note-box()[
    Alternativt kan vi vise en kraft som en kvantitet: $qty("1", "N")$.
  ]
]

== Fem vigtige kræfter

#definition(title: "Tyngdekræft")[
  $
    va(F)_g = m va(g)
  $

  #note-box()[
    Standard tyngdeacceleration ved Jordens overflade: $qty("9.82", "m/s^2")$.
    Hvis man ønsker flere cifre eller usikkerheder kan man skrive f.eks.
    $num("9.815+-0.005")$ $unit("m/s^2")$ eller $qty("9.815+-0.005", "m/s^2")$.
  ]
]

#definition(title: "Normalkraft")[
  Normalkraften virker vinkelret på underlaget og betegnes ofte $N$.
  Eksempel: Et legeme med masse $qty("10", "kg")$ på en horisontal flade.
  Tyngdekraften er $qty("10", "kg") dot qty("9.82", "m/s^2") = qty("98.2", "N")$,
  og normalkraften er ligeværdig i størrelse: $qty("98.2", "N")$.
]

#definition(
  title: "Snorkraft",
)[
  Ved ideel snor (masseløs, ustrakt) overføres spænding uden ændring af størrelse langs snoren.
  Hvis en snor bærer en vægt giver det samme snorforspænding i hele snoren (ignorer friktion).
  Eksempel med to legemer: hvis et legeme trækker med $qty("5", "N")$, oplever det modsatte legeme en snorforspænding på $qty("5", "N")$.
]

#definition(title: "Fjederkraft")[
  Hookes lov: $ va(F) = -k va(x) $.
  Eksempel: En fjeder med konstant $k = qty("200", "N/m")$ komprimeres $x = qty("0.02", "m")$,
  så er kraften $ qty("200", "N/m") dot qty("0.02", "m") = qty("4", "N") $ modsat forskydningen.
]

== Newtons Første lov
#definition(title: "Newtons Første Lov")[
  $
    sum va(F) = va(0) <=> va(v) = va("konst")
  $

  #note-box()[
    Hvis den resulterende kraft er nul, forbliver hastigheden konstant.
    Eksempel: et legeme i hvile har net kraft $qty("0", "N")$ og forbliver i hvile.
    Vi kan også illustrere et numerisk eksempel med usikkerhed: $num("0.0+-0.1")$.
  ]
]

== Inertialsystemer
Kan kort beskrives som referencer hvor Newtons første lov gælder; der er ingen fiktive kræfter i disse systemer.

/ Sort: Inertialsystem (fx spor, der ikke accelererer)
/ Orange: Ikke-inertialsystem (fx accelererende tog) — man mærker fiktive kræfter som centrifugalkraft.

#example[
  Centripetalacceleration for cirkelbevægelse: $a = v^2 / R$.

  Eksempel med tal: hvis $v = qty("5", "m/s")$ og $R = qty("2", "m")$ så
  $a = (qty("5", "m/s"))^2 / qty("2", "m") = qty("12.5", "m/s^2")$.
]

== Newtons Anden lov
#definition(title: "Newtons Anden lov")[
  $
    sum va(F) = m va(a)
  $

  #note-box()[
    Eksempel: Hvis $m = qty("2", "kg")$ og $va(a) = qty("3", "m/s^2")$,
    så er den resulterende kraft $ qty("2", "kg") dot qty("3", "m/s^2") = qty("6", "N")$.
    Vi kan vise talformatet pænt med Unify: $num("6")$ eller som kvantitet $qty("6", "N")$.
  ]
]

- Vektorligning
- Kun eksterne kræfter
- Kun for konstant m (udvides senere)
- Gyldig i et inertialsystem (kan udvides)

== Newtons Tredje lov
#definition(title: "Newtons Tredje lov")[
  $
    va(F)_(A arrow.r B) = - va(F)_(B arrow.r A)
  $

  #note-box()[
    Aktions-reaktionskraft-parret virker på forskellige legemer.

    Eksempel: Når en fod skubber mod jorden med $qty("200", "N")$ fremad,
    skubber jorden tilbage med $qty("200", "N")$ i den modsatte retning.
  ]
]

== Ranges og formateringseksempler med Unify

#note-box(title: "Tal og intervaller")[
  - Et tal med usikkerhed (symmetrisk): $num("1.234+-0.005")$.
  - Et tal med asymmetrisk usikkerhed: $num("1.234+0.005-0.002")$.
  - Et tal med exponent: $num("1.3e3")$ vises pænt.
  - Et talrange: $numrange("1.23e1", "4.56e1")$.
  - En kvantitetsrange: $qtyrange("1e3", "2e3", "m/s^2", per: "/", delimiter: "\"to\"")$ giver et interval.
]

== Hvordan man løser opgaver i praksis?

+ Tegn et kraftdiagram for hvert legeme.
+ Indfør koordinatsystem(er).
+ Opstil Newtons 1. og 2. lov i x- og y-retning for hvert legeme.
+ Brug kinematik/geometry: f.eks. betingelser fra snor, hjul og bånd.
+ Løs ligningssystemet.
+ Kontrollér enheder og størrelsesorden (brug f.eks. $qty("1", "N")$, $qty("1", "kg")$, $qty("1", "m/s^2")$).

=== Om at tegne et kraftdiagram:
- Stor, tydelig figur.
- Vælg hvilket legeme der betragtes.
- Newtons love gælder for det valgte legeme.
- Kun kræfter på legemet må medtages!

==== "Free-body diagram"
#note-box(title: "Pas På")[
  Kan du for hver pil i kraftdiagrammet svare på: hvilket andet legeme leverer denne kraft?
]

#note-box(title: "Pas På")[
  - Der er ingen "accelerationskraft" eller separat "ma-kraft".
  - Resulterende kraft er summen af de eksterne kræfter.
]

#cetz.canvas({
  import cetz.draw: *

  rect((0, 0), (1, 1), fill: gray, stroke: 0pt)
  content((0.5, 0.5), $m$)
  line((-1, 0), (3, 0))
  line((1, 0.5), (3, 1.5))
  mark((3.2, 1.6), 25deg, symbol: ">", fill: black)
  content((2.5, 1.6), $va(F)$)
  arc((1.9, 0.5), start: 0deg, delta: 25deg, mode: "OPEN")
  content((2, 0.6), anchor: "south-west", $theta$)
  line((1, 0.5), (3, 0.5), stroke: (dash: "dashed", paint: black.lighten(50%)))
})

= Exercises
== Problem 1.

A block with mass $m$ is on a smooth horizontal surface. The block is pulled by a constant force, $va(F)$, which is at angle $theta$ to the horizontal. We consider a moving system.

#cetz.canvas(
  {
    import cetz.draw: *

    // 1. Draw the ground line
    line((-1, 0), (7, 0), stroke: 2pt)

    // 2. Draw the block (mass m)
    // We use a light gray fill and a slightly darker gray border
    rect((1, 0), (3, 2), fill: gray.lighten(80%), stroke: (paint: gray.lighten(40%), thickness: 2pt), name: "block")

    // Place the mass label in the center
    content("block.center", $m$)

    // 3. Define the start point for the force (middle of the right edge)
    let start = (3, 1)

    // 4. Draw the dashed horizontal reference line
    line(start, (6, 1), stroke: (dash: "dashed"), name: "ref")

    // 5. Draw the force vector F
    // We set it at a 30 degree angle
    line(start, (3 + 3 * calc.cos(30deg), 1 + 3 * calc.sin(30deg)), mark: (end: ">"), name: "force")

    // 6. Labels and Angle
    // Force label F near the arrow tip
    content("force.end", $va(F)$, anchor: "south-east", padding: .2)

    // Draw the arc for theta
    arc((4, 1), start: 0deg, stop: 30deg, radius: 1)

    // Position the theta label inside the arc
    content((start.at(0) + 1.4, start.at(1) + 0.35), $theta$)
  },
)

/ a): Make a force diagram of the block.

#solution()[
#cetz.canvas({
  import cetz.draw: *

  // Draw the block (as a point/small square representing the center of mass)
  rect((0, -0.3), (0.6, 0.3), fill: gray.lighten(80%), stroke: 2pt + gray, name: "block")
  content("block.center", $m$)

  // Force F at angle theta
  line((0.3, 0), (rel: (2.5 * calc.cos(30deg), 2.5 * calc.sin(30deg))), mark: (end: ">"), stroke: 1.5pt + blue, name: "force-f")
  content("force-f.end", $va(F)$, anchor: "south-west", padding: 0.1)

  // Normal force N (upward)
  line((0.3, 0), (0.3, 2.5), mark: (end: ">"), stroke: 1.5pt + green, name: "force-n")
  content("force-n.end", $N$, anchor: "south", padding: 0.1)

  // Weight mg (downward)
  line((0.3, 0), (0.3, -2.5), mark: (end: ">"), stroke: 1.5pt + red, name: "force-mg")
  content("force-mg.end", $m va(g)$, anchor: "north", padding: 0.1)

  // Horizontal reference line (dashed)
  line((0.3, 0), (3.5, 0), stroke: (dash: "dashed", paint: gray))

  // Angle theta
  arc((0.3, 0), start: 0deg, stop: 30deg, radius: 0.8, stroke: 1pt)
  content((0.3 + 1.1, 0.25), $theta$)
})
]

/ b): Determine the acceleration of the block.

#solution()[
  $
    va(a) = va(F)/m dot cos(theta)
  $
]

/ c): Determine an expression for the normal force on the block.

#solution()[
  $
    N = m g - F dot sin(theta)
  $
]

== Problem 2.

Two blocks with mass $m_A$ and $m_B$ are connected by a rope. The block with mass $m_A$ is pulled upwards by a vertical force, $va(F)$.

#cetz.canvas({
  import cetz.draw: *

  // Block A (top)
  rect((0, 3), (3, 5), fill: luma(220), stroke: black)
  content((1.5, 4), $m_A$)

  // Block B (bottom)
  rect((0, 0), (3, 2), fill: luma(220), stroke: black)
  content((1.5, 1), $m_B$)

  // Force F arrow (upward from top of block A)
  line((1.5, 5), (1.5, 6.8), mark: (end: ">", size: 0.3), stroke: black)
  content((2.1, 6.3), $va(F)$)

  // Tension T label (between blocks)
  content((2, 2.35), $T$, anchor: "south")
  line((1.5, 2), (1.5, 3))

  // x axis arrow (to the right of diagram)
  line((4.5, 4.5), (4.5, 6.3), mark: (end: ">", size: 0.3), stroke: black)
  content((5.1, 6.0), $x$)
})

/ a): Determine the acceleration of the blocks.

#solution()[
  $
    va(a) = va(F) / (m_A + m_B) - va(g)
  $
]

/ b): Find an expression for the tension, $T$.

#solution()[
  $
    T = m_B/(m_A + m_B) dot F
  $
]

_Let $F = qty("30.0", "N")$, $m_A = qty("3.00", "kg")$ and $m_B = qty("2.00", "kg")$_

/ c): What is the acceleration of the blocks? What does this mean?

#solution(
  )[
  $
    a = qty("30.0", "N") / (qty("3.00", "kg") + qty("2.00", "kg")) - qty("9.82", "m/s^2") = qty("-3.82", "m/s^2")
  $

  Den negative acceleration betyder at blokkene accelererer nedad (i negativ x-retning). Kraften $va(F)$ er ikke stor nok til at løfte systemet opad.
]

// ─── Problem 3 ───────────────────────────────────────────────────────────────
== Problem 3

A particle with mass $m = qty("2.0", "kg")$ moves in a straight line. The figure shows the speed of the particle as a function of time.

#cetz.canvas({
  import cetz-plot: plot
  plot.plot(
    size: (10, 8),
    x-label: [$t$ #unit("s")],
    y-label: [$v$ #unit("m/s")],
    x-tick-step: 2,
    y-tick-step: 2,
    x-minor-tick-step: 1,
    y-minor-tick-step: 1,
    x-min: 0,
    x-max: 10,
    y-min: 0,
    y-max: 13,
    x-grid: "both",
    y-grid: "both",
    {
      // The data points extracted from your image:
      // (0,0) -> (2,3) -> (6,3) -> (10,11)
      plot.add(((0, 0), (2, 3), (6, 3), (10, 11)), line: "linear")
    },
  )
})

/ a): What is the maximum value of the sum of the forces on the particle? When does the sum of the forces have this value?

#solution(
  )[
  Accelerationen er størst mellem $t = qty("6", "s")$ og $t = qty("10", "s")$:

  $
    a_max = (qty("11", "m/s") - qty("3", "m/s")) / (qty("10", "s") - qty("6", "s")) = qty("8", "m/s") / qty("4", "s") = qty("2", "m/s^2")
  $

  Med Newtons anden lov:
  $
    F_max = m dot a_max = qty("2.0", "kg") dot qty("2", "m/s^2") = qty("4", "N")
  $

  Dette sker i tidsintervallet $t in [qty("6", "s"), qty("10", "s")]$.
]

/ b): When is the sum of the forces on the particle equal to zero?
#solution(
  )[
  Summen af kræfter er nul, når accelerationen er nul, hvilket sker mellem $t = qty("2", "s")$ og $t = qty("6", "s")$, hvor hastigheden er konstant.
]

/ c): What is the sum of the forces on the particle at the time $t = qty("1.4", "s")$?
#solution(
  )[
  Hastigheden ved $t = qty("1.4", "s")$ er $v = qty("2.1", "m/s")$ (estimeret fra grafen). Accelerationen kan estimeres som stigningstallet mellem $t = qty("0", "s")$ og $t = qty("2", "s")$:

  $
    a = (qty("3", "m/s") - qty("0", "m/s")) / (qty("2", "s") - qty("0", "s")) = qty("3", "m/s") / qty("2", "s") = qty("1.5", "m/s^2")
  $

  Summen af kræfter ved $t = qty("1.4", "s")$ er:
  $
    F = m dot a = qty("2.0", "kg") dot qty("1.5", "m/s^2") = qty("3.0", "N")
  $
]

// ─── Problem 4 ───────────────────────────────────────────────────────────────
== Problem 4.

A person with mass $M$ is standing on the ground. The person lifts a barbell with total mass $2m$, such that it accelerates upwards with acceleration $va(a)$. The person's arms can be viewed as massless.

What is the normal force on the person from the floor?

#grid(columns: (1fr, 1fr), [
  / A): $N = M g$
  / B): $N = (M + m) g$
  / C): $N = (M + 2m) g$
  / D): $N = M g + m a$
], [
  / E): $N = M g + 2m a$
  / F): $N = M g + 2m(a + g)$
  / G): $N = (M + 2m)(a + g)$
  / H): Do not know
])

#solution(
  )[
  Når personen løfter vægten, skal de ikke kun støtte deres egen vægt, men også den kraft, der kræves for at accelerere vægten opad. Den normale kraft på personen er derfor summen af tyngdekraften på personen og den kraft, der kræves for at løfte vægten:

  $
    N = M g + 2m (a + g)
  $

  Dette svarer til valgmulighed F.

]

// ─── Problem 5 ───────────────────────────────────────────────────────────────
== Problem 5.

A block with mass $m$ is on a smooth slope. The block is pushed by a constant horizontal force, $va(F)$. The slope is at angle $theta$ to the horizontal. We consider a moving system.

#cetz.canvas({
  import cetz.draw: *

  // --- Configuration ---
  let incline-angle = 20deg
  let block-width = 2
  let block-height = 1.5
  let block-position-x = 4 // Horizontal distance along ground
  let force-arrow-length = 3

  // --- Calculations ---
  // Position the block so its bottom-left corner touches the incline
  let block-anchor = (block-position-x, block-position-x * calc.tan(incline-angle))

  // --- Draw Elements ---

  // 1. Draw the Incline and Ground
  line((0, 0), (10, 0), stroke: 2pt, name: "ground") // Bottom line
  line((0, 0), (10, 10 * calc.tan(incline-angle)), stroke: 2pt, name: "slope") // Angled line

  // 2. Angle arc and label (theta)
  arc((1.6, 0), start: 0deg, stop: incline-angle, radius: 1.5, stroke: 1pt)
  content((1.9, 0.3), $theta$)

  // 3. Draw the Block (Rotated)
  scope({
    // Move to where the block will be, then rotate the coordinate system
    translate(block-anchor)
    rotate(incline-angle)

    // Draw the block locally at (0,0)
    rect((0, 0), (block-width, block-height), fill: gray.lighten(80%), stroke: 2pt + gray, name: "block")

    // Place label 'm' in the center of the locally defined block
    content((block-width / 2, block-height / 2), $m$)
  })

  // 4. Force F (Must remain strictly horizontal)
  // Calculate the vertical midpoint of the block's left face in the absolute system
  let midpoint-offset-y = (block-height / 2) * calc.cos(incline-angle)
  let force-impact-point = (block-anchor.at(0), block-anchor.at(1) + midpoint-offset-y)

  line(
    (force-impact-point.at(0) - force-arrow-length, force-impact-point.at(1)),
    force-impact-point,
    mark: (end: ">"),
    stroke: 1.5pt,
  )

  // Label F (placed slightly above and behind the arrow head)
  content((force-impact-point.at(0) - force-arrow-length / 1.3, force-impact-point.at(1) + 0.5), $va(F)$)
})

/ a): Draw a force diagram of the block.
#solution(
  )[
  #cetz.canvas({
    import cetz.draw: *

    let theta-angle = 20deg

    // Draw the block (simplified as center of mass)
    rect((0, -0.3), (0.6, 0.3), fill: gray.lighten(80%), stroke: 2pt + gray, name: "block")
    content("block.center", $m$)

    // Horizontal force F (strictly horizontal)
    line((0.3, 0), (0.3 - 2.5, 0), mark: (end: ">"), stroke: 1.5pt + blue, name: "force-f")
    content("force-f.end", $va(F)$, anchor: "east", padding: 0.1)

    // Weight mg (strictly downward/vertical)
    line((0.3, 0), (0.3, -2.5), mark: (end: ">"), stroke: 1.5pt + red, name: "force-mg")
    content("force-mg.end", $m va(g)$, anchor: "north", padding: 0.1)

    // Normal force N (perpendicular to incline, so at angle 90deg + theta from horizontal)
    let n-angle = 90deg + theta-angle
    line((0.3, 0), (0.3 + 2.5 * calc.cos(n-angle), 2.5 * calc.sin(n-angle)), mark: (end: ">"), stroke: 1.5pt + green, name: "force-n")
    content("force-n.end", $N$, anchor: "south-east", padding: 0.1)

    // Draw incline reference line (to show the angle)
    line((0.3, 0), (0.3 + 2, 2 * calc.tan(theta-angle)), stroke: (dash: "dashed", paint: gray))

    // Draw horizontal reference
    line((0.3, 0), (0.3 + 2, 0), stroke: (dash: "dotted", paint: gray.lighten(50%)))

    // Angle theta between horizontal and incline
    arc((0.3 + 1.2, 0), start: 0deg, stop: theta-angle, radius: 0.6, stroke: 1pt)
    content((0.3 + 1.5, 0.15), $theta$)
  })
]

/ b): Determine the acceleration of the block.
#solution()[

  $
    va(a) = va(F)/(m) dot cos(theta) - g sin(theta)
  $

]

/ c): Find an expression for the normal force on the block.
#solution()[
  $
    N = m g cos(theta) + F dot sin(theta)
  $
]

// ─── Problem 6 ───────────────────────────────────────────────────────────────
== Problem 6.

Three blocks with masses $m_A$, $m_B$, $m_C$ are pulled across a smooth surface by a horizontal force, $va(F)$.

#cetz.canvas(
  {
    import cetz.draw: *

    // Style settings for the blocks
    let block-style = (stroke: 1pt, fill: white)
    let block-width = 1.2
    let block-height = 0.8
    let spacing = 0.8

    // 1. Draw the ground (slashed line)
    // We'll draw the main horizontal line and then a loop for the hatches
    line((-1, 0), (7, 0), stroke: 2pt)
    for i in range(0, 40) {
      line((-1 + i * 0.2, 0), (-1.2 + i * 0.2, -0.2), stroke: 0.5pt)
    }

    // 2. Draw Block C (Left)
    rect((0, 0), (block-width, block-height), name: "C", ..block-style)
    content("C.center", [C])

    // 3. Draw Block B (Middle)
    rect((block-width + spacing, 0), (2 * block-width + spacing, block-height), name: "B", ..block-style)
    content("B.center", [B])

    // 4. Draw Block A (Right)
    rect((2 * block-width + 2 * spacing, 0), (3 * block-width + 2 * spacing, block-height), name: "A", ..block-style)
    content("A.center", [A])

    // 5. Draw connecting lines (Strings/Rods)
    line("C.east", "B.west")
    line("B.east", "A.west")

    // 6. Draw Force Arrow F
    line("A.east", (rel: (1, 0)), mark: (end: ">"), name: "force")
    content("force.end", [ $va(F)$ ], anchor: "west", padding: .1)
  },
)

/ a): Determine the acceleration, $va(a)$, of the blocks.
#solution()[
  $
    va(a) = va(F) / (m_A + m_B + m_C)
  $
]

/ b): Determine the tension, $T_(B C)$, acting on block B and C.
#solution(
  )[
  Tension er kraften i snoren mellem blok B og C, som kun trækker på blok B. Derfor er den kraft, der accelererer blok B og C, $va(F) - T_(B C)$, og denne kraft skal give den samme acceleration som hele systemet:

  $
    T = (m_c)/(m_A + m_B + m_C) dot va(F)
  $
]

/ c): Determine the tension, $T_(A B)$, acting on block A and B.
#solution()[
  $
    T_(A B) = (m_B + m_C)/(m_A + m_B + m_C) dot va(F)
  $
]

== Problem 7.

A light block is resting on a heavy block. The heavy block is on a rough horizontal surface. The heavy block is being pushed by a constant, horizontal force. The two blocks move to the right with a constant speed without moving relative to each other.

#cetz.canvas({
  import cetz.draw: *

  // Define common style attributes
  let line-style = (stroke: 1pt)
  let box-style = (stroke: (paint: gray.lighten(50%), thickness: 1.5pt), fill: gray.lighten(90%))

  // 1. Draw the horizontal line representing the ground
  line((0, 0), (6, 0), ..line-style)

  // 2. Draw the bottom, larger rectangle
  // Using absolute coordinates for the corners
  rect((3, 0), (5.1, 2.1), ..box-style)

  // 3. Draw the top, smaller rectangle
  // Positioned on top of and centered on the bottom box
  rect((3.45, 2.1), (4.65, 3.3), ..box-style)

  // 4. Draw the arrow
  // Starts on the left and points to the right side of the bottom box
  // The y-coordinate is roughly halfway up the bottom box
  line((0.6, 0.9), (2.9, 0.9), mark: (end: ">"), ..line-style)
})

/ a): Draw a force diagram for each of the two blocks.
#solution()[
  *Force diagram for the light (top) block:*
  
  #cetz.canvas({
    import cetz.draw: *
    
    // Top block (light block)
    rect((0, -0.2), (0.8, 0.2), fill: gray.lighten(90%), stroke: 1.5pt + gray, name: "top")
    content("top.center", [Light])
    
    // Normal force from heavy block (upward)
    line((0.4, 0), (0.4, 2), mark: (end: ">"), stroke: 1.5pt + green, name: "n-top")
    content("n-top.end", $N_("heavy on light")$, anchor: "south", padding: 0.1)
    
    // Weight of light block (downward)
    line((0.4, 0), (0.4, -2), mark: (end: ">"), stroke: 1.5pt + red, name: "mg-light")
    content("mg-light.end", $m_"light" va(g)$, anchor: "north", padding: 0.1)
  })
  
  *Force diagram for the heavy (bottom) block:*
  
  #cetz.canvas({
    import cetz.draw: *
    
    // Bottom block (heavy block)
    rect((0, -0.3), (1, 0.3), fill: gray.lighten(90%), stroke: 1.5pt + gray, name: "bottom")
    content("bottom.center", [Heavy])
    
    // Applied pushing force (horizontal, to the right)
    line((0.5, 0), (0.5 - 2.5, 0), mark: (end: ">"), stroke: 1.5pt + blue, name: "f-push")
    content("f-push.end", $va(F)$, anchor: "east", padding: 0.1)
    
    // Normal force from ground (upward)
    line((0.5, 0), (0.5, 2.5), mark: (end: ">"), stroke: 1.5pt + green, name: "n-ground")
    content("n-ground.end", $N_"ground"$, anchor: "south", padding: 0.1)
    
    // Weight of heavy block (downward)
    line((0.5, 0), (0.5, -1.8), mark: (end: ">"), stroke: 1.5pt + red, name: "mg-heavy")
    content("mg-heavy.end", $m_"heavy" va(g)$, anchor: "north", padding: 0.1)
    
    // Normal force from light block (downward - reaction to force on light block)
    line((0.5 + 0.6, 0), (0.5 + 0.6, -1.3), mark: (end: ">"), stroke: 1.5pt + orange, name: "n-light")
    content("n-light.end", $N_("light on heavy")$, anchor: "north", padding: 0.1)
    
    // Friction from ground (horizontal, to the left, opposing motion)
    line((0.5, 0), (0.5 + 2, 0), mark: (end: ">"), stroke: 1.5pt + purple, name: "f-friction")
    content("f-friction.end", $f_"friction"$, anchor: "west", padding: 0.1)
  })
  
  Since the blocks move with constant speed, the net force on each block is zero (Newton's First Law).
]

Now the pushing force is increased such that the system accelerates towards the right. There is still no relative movement between the blocks.

/ b): Draw force diagrams for both blocks.
#solution(
  )[
  Nothing changes since the blocks still move together without relative motion, so the force diagrams remain the same as in part a).
  
  *Force diagram for the light (top) block:*
  
  #cetz.canvas({
    import cetz.draw: *
    
    // Top block (light block)
    rect((0, -0.2), (0.8, 0.2), fill: gray.lighten(90%), stroke: 1.5pt + gray, name: "top")
    content("top.center", [Light])
    
    // Normal force from heavy block (upward)
    line((0.4, 0), (0.4, 2), mark: (end: ">"), stroke: 1.5pt + green, name: "n-top")
    content("n-top.end", $N_("heavy on light")$, anchor: "south", padding: 0.1)
    
    // Weight of light block (downward)
    line((0.4, 0), (0.4, -2), mark: (end: ">"), stroke: 1.5pt + red, name: "mg-light")
    content("mg-light.end", $m_"light" va(g)$, anchor: "north", padding: 0.1)
  })
  
  *Force diagram for the heavy (bottom) block:*
  
  #cetz.canvas({
    import cetz.draw: *
    
    // Bottom block (heavy block)
    rect((0, -0.3), (1, 0.3), fill: gray.lighten(90%), stroke: 1.5pt + gray, name: "bottom")
    content("bottom.center", [Heavy])
    
    // Applied pushing force (horizontal, to the right) - NOW LARGER
    line((0.5, 0), (0.5 - 2.5, 0), mark: (end: ">"), stroke: 1.5pt + blue, name: "f-push")
    content("f-push.end", $va(F)$, anchor: "east", padding: 0.1)
    
    // Normal force from ground (upward)
    line((0.5, 0), (0.5, 2.5), mark: (end: ">"), stroke: 1.5pt + green, name: "n-ground")
    content("n-ground.end", $N_"ground"$, anchor: "south", padding: 0.1)
    
    // Weight of heavy block (downward)
    line((0.5, 0), (0.5, -1.8), mark: (end: ">"), stroke: 1.5pt + red, name: "mg-heavy")
    content("mg-heavy.end", $m_"heavy" va(g)$, anchor: "north", padding: 0.1)
    
    // Normal force from light block (downward - reaction to force on light block)
    line((0.5 + 0.6, 0), (0.5 + 0.6, -1.3), mark: (end: ">"), stroke: 1.5pt + orange, name: "n-light")
    content("n-light.end", $N_("light on heavy")$, anchor: "north", padding: 0.1)
    
    // Friction from ground (horizontal, to the left, opposing motion)
    line((0.5, 0), (0.5 + 2, 0), mark: (end: ">"), stroke: 1.5pt + purple, name: "f-friction")
    content("f-friction.end", $f_"friction"$, anchor: "west", padding: 0.1)
  })
  
  The force diagrams remain the same because the same forces act on the blocks. The only difference is that now $va(F) > f_"friction"$, causing a net force and acceleration to the right.
]
