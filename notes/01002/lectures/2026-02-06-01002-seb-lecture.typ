#import "@local/dtu-template:0.6.0":*
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/plotsy-3d:0.2.1": plot-3d-parametric-curve

#show: dtu-note.with(
  course: "01002",
  course-name: "Mathematics 1b (Polytechnical foundation)",
  title: "Lecture - February 06, 2026",
  date: datetime(year: 2026, month: 2, day: 6),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

#set math.vec(delim: "[")
#set math.mat(delim: "[")

=== Vektorfunktioner i 2D og 3D

#note-box(
  title: "Intuition",
)[
  En *vektorfunktion* er en funktion der tager en parameter (ofte tid $t$) og returnerer en vektor der beskriver en position i rummet.
]

#example(title: "3D vektorfunktion - spiralkurve")[
  $
    underline(r)(t) = vec(cos(t), sin(t), t)
  $

  Dette beskriver en *helix* (spiralkurve) i 3D. For hver værdi af $t$:
  - $(cos(t), sin(t))$ giver en cirkel i $x y$-planen
  - $t$ får kurven til at stige op ad $z$-aksen

  #figure({
    let xfunc(t) = calc.cos(t)
    let yfunc(t) = calc.sin(t)
    let zfunc(t) = t / (2 * calc.pi)

    plot-3d-parametric-curve(
      xfunc,
      yfunc,
      zfunc,
      subdivisions: 20,
      scale-dim: (0.08, 0.08, 0.08),
      tdomain: (0, 13), // approximately 4*pi
      xaxis: (-2, 2),
      yaxis: (-2, 2),
      zaxis: (0, 3),
      axis-step: (1, 1, 1),
      dot-thickness: 0.03em,
      front-axis-thickness: 0.08em,
      front-axis-dot-scale: (0.03, 0.03),
      rear-axis-dot-scale: (0.06, 0.06),
      rear-axis-text-size: 0.4em,
      axis-label-size: 1em,
      rotation-matrix: ((-2, 2, 3), (0, -1, 0)),
      xyz-colors: (dtu-red, dtu-blue, dtu-green),
    )
  }, caption: [Spiralkurve (helix): $underline(r)(t) = (cos t, sin t, t)$])
]

#example(title: "2D vektorfunktion - cirkel")[
  $
    underline(r)(t) = vec(cos(t), sin(t)), quad t in [0, 2pi]
  $

  Dette er simpelthen *enhedscirklen* i 2D - parametriseret ved vinklen $t$.
]

== Kontinuitet af vektorfunktioner

#definition(
  title: "Kontinuitet (3.2, 3.1)",
)[
  $underline(f)$ er *kontinuert* i $underline(x)_0 in A = "dom"(f)$

  hvis og kun hvis
  $
    lim_(underline(x) -> underline(x)_0) underline(f)(underline(x)) = underline(f)(underline(x)_0)
  $

  #note-box(
    title: "Komponentvis",
  )[
    En vektorfunktion $underline(f) = (f_1, f_2, ..., f_n)$ er kontinuert hvis og kun hvis *alle* komponentfunktionerne $f_1, f_2, ..., f_n$ er kontinuerte.
  ]
]

== $norm(x)$ i $RR^n$ og indre produkt
#example(
  title: "2.1.1 - Indre produkt og vinkel",
)[
  $V = RR^2, FF=RR$

  #figure(cetz.canvas(length: 1cm, {
    import cetz.draw: *
    import cetz.angle: angle

    // Draw axes
    set-style(mark: (fill: black))
    line((-0.5, 0), (3.5, 0), stroke: gray + 0.5pt)
    line((0, -0.5), (0, 2.5), stroke: gray + 0.5pt)

    // Vector x
    line((0, 0), (3, 1), mark: (end: ">"), stroke: dtu-blue + 2pt, name: "vx")
    content((3.1, 1.2), [$underline(x) = vec(x_1, x_2)$], anchor: "south-west")

    // Vector y
    line((0, 0), (1.5, 2), mark: (end: ">"), stroke: dtu-red + 2pt, name: "vy")
    content((1.3, 2.2), [$underline(y) = vec(y_1, y_2)$], anchor: "south")

    // Angle theta
    angle((0, 0), (3, 1), (1.5, 2), radius: 0.7, label: $theta$, label-radius: 0.5)
  }), caption: [To vektorer med vinkel $theta$ mellem dem])

  $chevron.l x,y chevron.r$ betegner det *indre produkt* (prikprodukt):

  $
    underline(x) dot underline(y) = x_1 y_1 + x_2 y_2 = norm(x) norm(y) cos(theta)
  $

  #important(title: "Ortogonalitetsbetingelse")[
    $underline(x) != 0$ og $underline(y) != 0$ er *ortogonale* (vinkelrette) hvis og kun hvis:
    $
      chevron.l underline(x), underline(y) chevron.r = 0 quad <==> quad theta = 90 degree
    $

    Dette skyldes at $cos(90 degree) = 0$, så $norm(x) norm(y) cos(90 degree) = 0$.
  ]

  #definition(
    title: "2.1.2 - Sædvanlige indre produkt",
  )[
    Lad $FF = RR$ eller $CC$

    For $underline(x), underline(y) in FF^n$ er det sædvanlige indre produkt defineret ved
    $
      chevron.l x,y chevron.r = x_1 overline(y_1) + x_2 overline(y_2) + ... + x_n overline(y_n) \
        &= sum^n_(k=1) x_k overline(y_k)
    $

    #note-box(
      )[
      Alle $y_k$ skal *komplekst konjugeres* (stregen over $y_k$ betyder konjugering, alstå: $bold(overline(a+b i) = a - b i)$)
    ]

    Hvis $FF=RR$ (kun reelle tal) gælder simpelthen:

    $
      chevron.l x,y chevron.r = sum^n_(k=1) x_k y_k \
      = underline(y)^T underline(x) \
      = mat(y_1, y_2, ..., y_n) mat(x_1;x_2;dots.v;x_n)
    $

    #note-box(title: "Matrixform")[
      Indre produkt kan skrives som matrix-multiplikation: række-vektor gange søjle-vektor.
    ]
  ]
]

#definition(title: "2.1.3 - Normen (længden) af en vektor")[
  Normen (længden) af en vektor $underline(x) in FF^n$ er defineret ved:
  $
    norm(underline(x)) = sqrt(lr(chevron.l underline(x), underline(x) chevron.r)) = sqrt(sum^n_(k=1) |x_k|^2)
  $

  #note-box(title: "Egenskaber")[
    - $norm(underline(x)) >= 0$ (altid ikke-negativ)
    - $norm(underline(x)) = 0 <==> underline(x) = underline(0)$
    - $norm(c underline(x)) = |c| dot norm(underline(x))$ for $c in FF$
    - $norm(underline(x) + underline(y)) <= norm(underline(x)) + norm(underline(y))$ (trekantsuligheden)
  ]
]

#example(title: "Ortogonalitet i $RR^4$")[
  $RR^4$

  $
    underline(x) = vec(0, 1, -3, 1), underline(y) = vec(1, 1, 3, a)
  $

  *Hvilken værdi af $a in RR$ gør disse vektorer ortogonale?*

  Vi finder $a$ sådan at $chevron.l x,y chevron.r = 0$:

  $
    chevron.l x,y chevron.r &= 0 dot 1 + 1 dot 1 + (-3) dot 3 + 1 dot a \
                            &= 0 + 1 - 9 + a \
                            &= -8 + a
  $

  Sæt lig med 0:
  $
    -8 + a = 0 quad ==> quad a = 8
  $

  #note-box(title: "Verifikation")[
    Med $a = 8$: $chevron.l x, y chevron.r = 0 + 1 - 9 + 8 = 0$ ✓
  ]
]

=== Beregning af normen

Normen ("længden") beregnes ved:

$
  norm(underline(x)) = sqrt(lr(chevron.l underline(x), underline(x) chevron.r)) = sqrt(sum^n_(k=1) x_k dot overline(x)_k) = sqrt(sum^n_(k=1) |x_k|^2)
$

#definition(title: "Enhedsvektor")[
  En vektor $underline(v)$ kaldes en *enhedsvektor* hvis $norm(underline(v)) = 1$

  Man kan altid lave en enhedsvektor fra enhver ikke-nul vektor ved at *normere* den:
  $
    hat(underline(v)) = underline(v) / (norm(underline(v)))
  $
]

#note-box(
  title: "For komplekse tal",
)[
  For $z in CC$ gælder: $z overline(z) = |z|^2$

  Dette er grunden til at vi bruger konjugering i indre produktet - det sikrer at normen altid er reel og positiv.
]

#example(title: "Norm i $CC^2$ (kompleks vektor)")[
  $
    underline(x) = vec(2i, 1)
  $

  Beregn $norm(underline(x))$:
  $
    norm(underline(x)) &= sqrt(|2i|^2 + |1|^2) \
                       &= sqrt(4 + 1) \
                       &= sqrt(5)
  $

  #note-box()[
    Bemærk: $|2i| = 2$ fordi $|a + b i| = sqrt(a^2 + b^2)$, så $|0 + 2i| = sqrt(0 + 4) = 2$
  ]
]

=== Kvadratiske former

#definition(
  title: "1.2.1 - Kvadratisk form",
)[
  En *kvadratisk form* er en funktion $q: RR^n -> RR$ defineret ved:
  $
    q(underline(x)) = underline(x)^T bold(A) underline(x) + underline(b)^T underline(x) + c
  $

  hvor:
  - $bold(A) in RR^(n times n)$ er en matrix (ofte symmetrisk)
  - $underline(b) in RR^n$ er en vektor (lineære led)
  - $c in RR$ er en konstant

  #note-box(
    title: "Intuition",
  )[
    Kvadratiske former generaliserer paraboler og ellipser til højere dimensioner. Leddet $underline(x)^T bold(A) underline(x)$ giver "krumningen", $underline(b)^T underline(x)$ giver hældning, og $c$ er en forskydning.
  ]
]

#example(
  title: "Kvadratisk form med $n=2$",
)[
  Lad $bold(A) = mat(-1, 0;0, -2)$, $underline(b)= vec(0, 0)$, $c=0$, $underline(x) = vec(x_1, x_2)$

  Beregn $q(underline(x))$:
  $
    q(underline(x)) &= underline(x)^T bold(A) underline(x) + underline(b)^T underline(x) + c \
                    &= mat(x_1, x_2) mat(-1, 0;0, -2) vec(x_1, x_2) + mat(0, 0) vec(x_1, x_2) + 0 \
                    &= mat(x_1, x_2) vec(-x_1, -2x_2) \
                    &= -x_1^2 - 2x_2^2
  $

  #note-box(
    title: "Geometrisk fortolkning",
  )[
    Grafen $"graf"(q) = {(x_1, x_2, q(x_1, x_2)) : (x_1, x_2) in RR^2}$ er en *elliptisk paraboloid* der åbner nedad (fordi begge led er negative).
  ]

  #figure(cetz.canvas(length: 0.7cm, {
    import cetz.draw: *

    // Draw contour curves (niveau kurver)
    set-style(stroke: dtu-blue + 1pt)

    // Each ellipse represents a contour level
    for r in (0.5, 1, 1.5, 2, 2.5) {
      // Ellipse: x^2 + 2y^2 = constant
      // So x ranges from -r to r, y from -r/sqrt(2) to r/sqrt(2)
      let pts = ()
      for i in range(0, 37) {
        let theta = i * 10 / 180 * calc.pi
        let x = r * calc.cos(theta)
        let y = r / calc.sqrt(2) * calc.sin(theta)
        pts.push((x, y))
      }
      line(..pts, close: true)
    }

    // Axes
    set-style(mark: (fill: black), stroke: black + 1pt)
    line((-3.5, 0), (3.5, 0), mark: (end: ">"))
    line((0, -2.5), (0, 2.5), mark: (end: ">"))
    content((3.7, 0), [$x_1$], anchor: "west")
    content((0, 2.7), [$x_2$], anchor: "south")

    // Label
    content((2, 1.8), [niveau-kurver], anchor: "south")
  }), caption: [Niveau-kurver for $q(x_1, x_2) = -x_1^2 - 2x_2^2$ (ellipser)])
]

== Partielle afledte og gradienten $nabla f(underline(x))$

#definition(title: "Partiel afledt")[
  Den *partielle afledte* af $f$ med hensyn til $x_i$ er:
  $
    (partial f)/(partial x_i) = lim_(h -> 0) (f(x_1, ..., x_i + h, ..., x_n) - f(x_1, ..., x_i, ..., x_n))/h
  $

  #note-box(title: "Regneregel")[
    Når du differentier med hensyn til $x_i$, behandler du alle andre variable som *konstanter*.
  ]
]

#example(title: "Beregning af partielle afledte")[
  Lad $f: RR^2 -> RR$ være givet ved:
  $
    f(x_1, x_2) = 1 - x_1^2/2 - x_1 x_2^2
  $

  *Beregn de partielle afledte:*

  For $display((partial f)/(partial x_1))$: Betragt $x_2$ som konstant (sæt $c = x_2^2$):
  $
    h(x_1)  &= 1 - x_1^2/2 - c dot x_1 \
    h'(x_1) &= 0 - x_1 - c = -x_1 - x_2^2
  $
  Så: $(partial f)/(partial x_1) = -x_1 - x_2^2$

  For $display((partial f)/(partial x_2))$: Betragt $x_1$ som konstant:
  $
    g(x_2)  &= 1 - c_1 - x_1 dot x_2^2 quad ("hvor" c_1 = x_1^2/2) \
    g'(x_2) &= 0 - 0 - 2x_1 x_2 = -2x_1 x_2
  $
  Så: $(partial f)/(partial x_2) = -2 x_1 x_2$
]

#definition(
  title: "3.2.2 - Gradienten",
)[
  *Gradienten* af $f: RR^n -> RR$ er vektoren af alle partielle afledte:
  $
    nabla f(underline(x)) = vec((partial f)/(partial x_1), (partial f)/(partial x_2), dots.v, (partial f)/(partial x_n))
  $

  #important(title: "Betydning af gradienten")[
    Gradienten $nabla f(underline(x))$ peger i retningen af *størst stigning* af $f$ i punktet $underline(x)$.

    Længden $norm(nabla f(underline(x)))$ angiver *hvor hurtigt* $f$ stiger i denne retning.
  ]
]

=== Gradienten og niveau-kurver

#note-box(title: "Nøgle-indsigt")[
  *Gradienten står altid vinkelret på niveau-kurverne!*

  En niveau-kurve er mængden af punkter hvor $f(underline(x)) = c$ for en konstant $c$.
]

#example(
  title: "Gradient for kvadratisk form",
)[
  For $q(x_1, x_2) = -x_1^2 - 2x_2^2$ (fra før) beregner vi gradienten:
  $
    nabla q(underline(x)) = vec((partial q)/(partial x_1), (partial q)/(partial x_2)) = vec(-2x_1, -4x_2)
  $

  #note-box()[
    Grafen $"graf"(q) = {(x_1, x_2, q(x_1, x_2)) : (x_1, x_2) in RR^2}$ er en elliptisk paraboloid.
  ]

  *Eksempel:* I punktet $(1, 0)$:
  $
    nabla q vec(1, 0) = vec(-2 dot 1, -4 dot 0) = vec(-2, 0)
  $

  Gradienten peger i $(-1, 0)$-retningen (mod venstre), hvilket er retningen hvor $q$ stiger hurtigst.

  #figure(
    cetz.canvas(length: 1cm, {
      import cetz.draw: *

      // Draw contour curves (niveau kurver)
      set-style(stroke: dtu-blue + 1pt)

      // Ellipses for contour levels
      for r in (0.6, 1.0, 1.4, 1.8, 2.2) {
        let pts = ()
        for i in range(0, 37) {
          let theta = i * 10 / 180 * calc.pi
          let x = r * calc.cos(theta)
          let y = r / calc.sqrt(2) * calc.sin(theta)
          pts.push((x, y))
        }
        line(..pts, close: true)
      }

      // Axes
      set-style(stroke: gray + 0.5pt)
      line((-3, 0), (3, 0))
      line((0, -2), (0, 2))
      content((3.2, 0), [$x_1$], anchor: "west")
      content((0, 2.2), [$x_2$], anchor: "south")

      // Gradient arrows (pointing inward toward maximum at origin)
      set-style(mark: (fill: dtu-red), stroke: dtu-red + 1.5pt)

      // At point (1, 0): gradient = (-2, 0)
      line((1.8, 0), (1.0, 0), mark: (end: ">"))
      content((1.8, -0.3), [$nabla q$], anchor: "north")

      // At point (-1, 0): gradient = (2, 0)
      line((-1.8, 0), (-1.0, 0), mark: (end: ">"))

      // At point (0, 1/sqrt(2)): gradient = (0, -4*1/sqrt(2))
      let y1 = 0.71
      line((0, 1.4), (0, 0.8), mark: (end: ">"))

      // At point (0, -1/sqrt(2)): gradient = (0, 4*1/sqrt(2))
      line((0, -1.4), (0, -0.8), mark: (end: ">"))

      // Diagonal gradients
      line((1.3, 0.65), (0.8, 0.4), mark: (end: ">"))
      line((-1.3, 0.65), (-0.8, 0.4), mark: (end: ">"))
      line((1.3, -0.65), (0.8, -0.4), mark: (end: ">"))
      line((-1.3, -0.65), (-0.8, -0.4), mark: (end: ">"))

      // Label
      content((-2.5, 1.5), [niveau-kurve], anchor: "east")
      content((-2.5, 1.1), [$q = c$], anchor: "east")

      // Point label
      circle((1.8, 0), radius: 0.06, fill: black, stroke: none)
      content((2.1, 0.2), [$(1,0)$], anchor: "south-west")
    }),
    caption: [Niveau-kurver for $q$ med gradient-vektorer (røde pile). Gradienten peger mod centrum hvor $q$ har maksimum.],
  )

  #important(
    title: "Observation",
  )[
    Alle gradient-pile peger *ind mod origo* fordi det er der $q$ har sit *maksimum* ($q(0,0) = 0$ er størst, da $q$ er negativ overalt ellers).

    Pilene står *vinkelret* på ellipse-kurverne - dette er altid tilfældet for gradienter og niveau-kurver.
  ]
]
