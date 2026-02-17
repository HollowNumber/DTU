#import "@local/dtu-template:0.6.0":*
#import "@preview/callisto:0.2.4"
#import "@preview/mitex:0.2.6": mitex
#import "@preview/cmarker:0.1.8"
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/physica:0.9.8": *
#import "@preview/quill:0.7.2": *
#import "@preview/unify:0.7.1": qty, unit, num

#show: dtu-physics-note.with(
  course: "10060",
  course-name: "Physics (Polytechnical Foundation)",
  title: "Usikkerhed - February 16, 2026",
  date: datetime(year: 2026, month: 2, day: 16),
  author: "Mikkel M.H. Pedersen (255015)",
  semester: "2026 Spring",
)

== Usikkerhed notation og afrunding
Angivelse af usikkerhed

$
  x                         &"bedste bud på størrelse" \
  delta x                   &"usikkerhed, positiv størrelse" \
  x plus.minus delta x      &"absolut usikkerhed" \
  (delta x)/abs(x)          &"relativ usikkerhed" \
  (delta x)/abs(x) dot 100% &"procentuel usikkerhed"
$

Antallet af cifre i bedste bud og usikkerhed skal stemme overens

$
  L &= #qty("10.0+-0.5", "m") \
  A &= #qty("24.43+-0.13", "m^2") \
  L &= #qty("10.0", "m") plus.minus 1% \
$

#note-box(
  )[
  Brug Uncertainties pakken i Python til at håndtere usikkerheder i beregninger. Det gør det nemt at holde styr på både bedste bud og usikkerhed gennem alle trin i beregningen.
]

=== Hvorfor vurdere usikkerhed?
Eksempler:

- Hvor nøjagtigt er længden $#qty("7.612", "m")$?
- Er de to længder $#qty("3.1", "m")$ og $#qty("3.69", "m")$ næsten ens?

=== Afrunding af resultat og usikkerhed

$
  delta x_1 = 0.44566 -> delta x_1 = 0.4 \
  delta x_2 = 0.14327 -> delta x_2 = 0.1 \
$

Hvad er den procentvise usikkerhed på $delta x_1$ og $delta x_2$?

$
  frac(delta x_1, x) dot 100% = frac(0.44566 - 0.4, 0.4) dot 100% = 11.14% \
  frac(delta x_2, x) dot 100% = frac(0.14327 - 0.1, 0.1) dot 100% = 43.27%
$

=== Beregninger med uafhængige usikkerheder
Eksempel:

$
  z       &= x + y quad "(eller" x - y")" \
  delta z &= sqrt((delta x)^2 + (delta y)^2) \
$

=== Beregninger med afhængige usikkerheder
$
  z       &= x + y quad "(eller" x - y")" \
  delta z &= delta x + delta y \
$

#example(
  title: "Længder, Uafhængige",
)[
  Længderne af A og A+B måles uafhængigt med samme usikkerhed $delta x$

  Hvad er usikkerheden på længden af B?

  $
    L_A &= L_A plus.minus delta x, quad L_(A + B) = L_(A + B) plus.minus delta x \
    L_B &= L_(A + B) - L_A \
        &= L_(A + B) - L_A plus.minus sqrt(delta x^2 + delta x^2) = L_(A + B) - L_A plus.minus sqrt(2) dot delta x \
  $
]

=== Beregninger med størrelser

#conceptual-question()[
  Hvad er arealet af bordet,

  $
    b = #qty("51+-1", "cm") \
    d = #qty("52+-5", "cm") \
  $

  Muligheder:

  - $A = #qty("0.27+-0.03", "m^2")$
  - $A = #qty("0.265+-0.03", "m^2")$
  - $A = #qty("0.27+-0.26", "m^2")$
  - $A = #qty("0.265+-0.26", "m^2")$
]

#solution(
  )[
  Arealet er givet ved $A = b dot d$.

  For at beregne usikkerheden på arealet, skal vi bruge formlen for usikkerheden på et produkt:

  $
    delta A = A dot sqrt(pdv(A, b)^2 (delta b / A)^2 + pdv(A, d)^2 (delta d / A)^2) = A dot sqrt((delta b / b)^2 + (delta d / d)^2) \
  $

  Først beregner vi arealet:
  $
    A = b dot d = #qty("51", "cm") dot #qty("52", "cm") = #qty("2652", "cm^2") \
  $

  Nu beregner vi den relative usikkerhed for både $b$ og $d$:
  $
    frac(delta b, b) = frac(#qty("1", "cm"), #qty("51", "cm")) = 0.0196 \
    frac(delta d, d) = frac(#qty("5", "cm"), #qty("52", "cm")) = 0.09615 \
  $

  Nu kan vi beregne den samlede relative usikkerhed for arealet:
  $
    sqrt((delta b / b)^2 + (delta d / d)^2) = sqrt(0.0196^2 + 0.09615^2) = 0.0981274
  $

  Endelig kan vi beregne usikkerheden på arealet:

  $
    delta A = A dot 0.0981274 = #qty("2652", "cm^2") dot 0.0981274 = #qty("260.234", "cm^2") \
  $

  Så arealet af bordet er $#qty("2652+-260", "cm^2")$ eller $#qty("0.27+-0.03", "m^2")$.
]

== Fejlophobningsloven

#law(name: "Fejlophobningsloven")[
  Uafhængige usikkerheder:
  $
    delta z = sqrt((pdv(f, x) delta x)^2 + (pdv(f, y) delta y)^2 + ...) \
  $

  Afhængige usikkerheder:
  $
    delta z = abs(pdv(f, x)) delta x + abs(pdv(f, y)) delta y + ... \
  $

  #note-box()[
    Kan generaliseres til flere variable
  ]
]

#example(
  title: "Bil ned af bakke",
)[
  $theta = #qty("30.5+-0.05", "degree"), quad g = #qty("9.82+-0.01", "m/s^2")$

  $a(g,theta) = g dot sin(theta)$

  $
    delta a &= sqrt((pdv(a, g) delta g)^2 + (pdv(a, theta) delta theta)^2) \
            &= sqrt((sin(theta) delta g)^2 + (g cos(theta) delta theta)^2) \
  $

  Konverter vinkel til radianer: $delta theta = 0.05 degree dot pi/180 = #num("8.727e-4") #unit("rad")$

  $
    delta a &= sqrt(
      (sin(30.5 degree) dot #qty("0.01", "m/s^2"))^2 + (#qty("9.82", "m/s^2") dot cos(30.5 degree) dot #num("8.727e-4"))^2
    ) \
            &= sqrt((0.5075 dot 0.01)^2 + (9.82 dot 0.8616 dot #num("8.727e-4"))^2) \
            &= sqrt(#num("2.576e-5") + #num("5.449e-5")) \
            &= sqrt(#num("8.025e-5")) \
            &= #qty("0.0090", "m/s^2")
  $

  #note-box()[
    Det foretrækkes at der bruges radianer i beregninger.
  ]
]

=== Usikkerhedsbidrag

$
  delta z = sqrt(
    underbrace((pdv(f, x) delta x)^2, "Error Component x") + underbrace((pdv(f, y) delta y)^2, "Error Component y") + ...
  ) \
$

For at forstå hvilke variable der bidrager mest til den samlede usikkerhed, kan vi beregne det relative bidrag fra hver variabel:

$
  "Bidrag fra x:" quad (pdv(f, x) delta x)^2 / (delta z)^2 dot 100% \
  "Bidrag fra y:" quad (pdv(f, y) delta y)^2 / (delta z)^2 dot 100% \
$

#note-box(
  )[
  Den variabel med det største bidrag dominerer usikkerheden. Hvis en variabel bidrager med >90%, kan man ofte ignorere de andre bidrag som approximation.
]

#example(
  title: "Usikkerhedsbidrag - Bil ned af bakke",
)[
  Fra tidligere: $theta = #qty("30.5+-0.05", "degree"), quad g = #qty("9.82+-0.01", "m/s^2")$

  $a(g,theta) = g dot sin(theta)$, og $delta a = #qty("0.0090", "m/s^2")$

  Beregn bidragene:

  $
    "Bidrag fra" g: quad     &(pdv(a, g) delta g)^2 = (sin(theta) delta g)^2 \
                             &= (0.5075 dot 0.01)^2 = #num("2.576e-5") \
    \
    "Bidrag fra" theta: quad &(pdv(a, theta) delta theta)^2 = (g cos(theta) delta theta)^2 \
                             &= (9.82 dot 0.8616 dot #num("8.727e-4"))^2 = #num("5.449e-5") \
  $

  Relative bidrag:
  $
    "Bidrag fra" g: quad     &frac(#num("2.576e-5"), (0.0090)^2) dot 100% = 31.8% \
    "Bidrag fra" theta: quad &frac(#num("5.449e-5"), (0.0090)^2) dot 100% = 67.3% \
  $

  Konklusion: Vinkelmålingen $theta$ dominerer usikkerheden (ca. 2/3 af det samlede bidrag), mens tyngdeaccelerationen $g$ bidrager ca. 1/3.
]

== Eksperimentel usikkerhed

=== Eksempel på analog måling:

Mål længden af et legeme med en lineal med $#qty("1", "mm")$ inddeling, og aflæs længden til 1 decimal (f.eks. $#qty("3.1", "cm")$). Mål *omhyggeligt* for at undgå parallaksefejl.

#note-box(
  )[
  *Parallaksefejl* opstår når man ikke aflæser vinkelret på skalaen. Hvis øjet er forskudt sideværts, vil man aflæse en forkert værdi. Placer altid øjet vinkelret på målepunktet.
]

For analog måling med skala:
$
  delta x = "width"/sqrt(24)
$

hvor "width" er bredden af mindste skalainterval (f.eks. $#qty("1", "mm")$).

Fordeling ved analog måling (trekantsfordeling):
- Måleværdien ligger ikke udenfor intervallet
- Mindre sandsynligt at måleværdien ligger yderligt
- Mest sandsynligt at måleværdien ligger nær midten

=== Eksempel på digital måling:

For digital måling (f.eks. digital vægt):
$
  delta x = "width"/sqrt(12)
$

hvor "width" er det sidste ciffer der vises (f.eks. hvis vægten viser $#qty("3.14", "kg")$, er width = $#qty("0.01", "kg")$).

Fordeling ved digital måling (firkantfordeling):
- Måleværdien ligger ikke uden for intervallet
- Alle værdier i intervallet er lige sandsynlige

=== Statistisk analyse af måleserie:

$
  x_1,x_2,...,x_N                                       &"måleserie" \
  overline(x) = (sum^N_(i=1) x_i)/N                     &"middelværdi" \
  s_x = sqrt(1/(N-1) sum^N_(i=1) (x_i - overline(x))^2) &"standardafvigelse" \
  delta x = s_x                                         &"usikkerhed på enkelte måling" \
  delta overline(x) = s_(overline(x)) = s_x / sqrt(N)   &"usikkerhed på middelværdi" \
$

=== Fordelinger som model for målinger

==== Normalfordeling
$
  P(mu - delta x <= x <= mu + delta x)     &= 0.68 \
  P(mu - 2 delta x <= x <= mu + 2 delta x) &= 0.95 \
  P(mu - 3 delta x <= x <= mu + 3 delta x) &= 0.99
$

==== Firkantfordeling
$
  P(mu - delta x <= x <= mu + delta x)           &= 0.58 \
  P(mu - 1.65 delta x <= x <= mu + 1.65 delta x) &= 0.95 \
  P(mu - 1.73 delta x <= x <= mu + 1.73 delta x) &= 1
$

==== Trekantsfordeling
$
  P(mu - delta x <= x <= mu + delta x)           &= 0.65 \
  P(mu - 1.81 delta x <= x <= mu + 1.81 delta x) &= 0.95 \
  P(mu - 2.45 delta x <= x <= mu + 2.45 delta x) &= 1
$

#example(
  title: "Måleserie",
)[
  $x = [250, 200, 150, 100, 50]$

  En ny måling giver $270$, er det normalt?

  Antag normalfordeling:
  $
    P(mu - delta x <= x <= mu + delta x)     &= 0.68 \
    P(mu - 2 delta x <= x <= mu + 2 delta x) &= 0.95 \
    P(mu - 3 delta x <= x <= mu + 3 delta x) &= 0.99
  $

  Beregn middelværdi og standardafvigelse:
  $
    overline(x) &= (250 + 200 + 150 + 100 + 50)/5 = 150 \
    s_x         &= sqrt(1/(5-1) [(250-150)^2 + (200-150)^2 + (150-150)^2 + (100-150)^2 + (50-150)^2]) \
                &= sqrt(1/4 [10000 + 2500 + 0 + 2500 + 10000]) \
                &= sqrt(25000/4) = sqrt(6250) approx 79.1
  $

  Standard score (z-score):
  $
    z = (x - overline(x)) / s_x = (270 - 150) / 79.1 = 120 / 79.1 approx 1.52
  $

  Konklusion: $abs(z) = 1.52 < 2$, så målingen ligger inden for $2 sigma$ intervallet. Dette er normalt (95% af målinger ligger inden for $2 sigma$).
]

== Præcision og nøjagtighed

==== Præcision
- Ligger målinger tæt på hinanden, har vi stor præcision
- Udtrykker reproducerbarhed
- Lille spredning = høj præcision

==== Nøjagtighed
- Udtrykker om målinger ligger tæt på den "korrekte" værdi
- Lille systematisk fejl = høj nøjagtighed

#note-box(
  )[
  Hvis ens måleinstrument/målemetode er nøjagtig, men ikke præcis, så kan resultatet forbedres ved at gentage målingen flere gange.
]

// Credit: Claude
#figure(
  cetz.canvas(
    {
      import cetz.draw: *

      let draw-target(x, y, label, points) = {
        // Draw target circles
        circle((x, y), radius: 1.5, stroke: black)
        circle((x, y), radius: 1.0, stroke: black)
        circle((x, y), radius: 0.5, stroke: black)

        // Draw measurement points
        for point in points {
          circle((x + point.at(0), y + point.at(1)), radius: 0.1, fill: red)
        }

        // Label
        content((x, y - 2), label)
      }

      // High precision, high accuracy
      draw-target(-3, 3, "Høj præcision\nHøj nøjagtighed", ((0.1, 0.05), (0.05, -0.1), (-0.05, 0.08), (-0.08, -0.05)))

      // High precision, low accuracy
      draw-target(3, 3, "Høj præcision\nLav nøjagtighed", ((0.8, 0.75), (0.75, 0.85), (0.85, 0.8), (0.82, 0.78)))

      // Low precision, high accuracy
      draw-target(-3, -3, "Lav præcision\nHøj nøjagtighed", ((0.3, 0.4), (-0.5, 0.2), (0.2, -0.6), (-0.3, 0.1)))

      // Low precision, low accuracy
      draw-target(3, -3, "Lav præcision\nLav nøjagtighed", ((1.0, 0.8), (-0.7, 0.9), (0.6, -1.1), (-0.9, -0.5)))
    },
  ),
  caption: "Illustration af præcision og nøjagtighed",
)

== Typer af usikkerheder

==== Tilfældige usikkerheder
- Spredning ved gentagende målinger
- Afvigelser $plus.minus$ omkring middelværdi
- Kan skyldes instrumentet, miljøpåvirkninger, eller måleproceduren
- Kan reduceres ved at gentage målinger og tage gennemsnit

==== Systematiske usikkerheder
- Målinger er konsekvent større eller mindre end den sande værdi
- Påvirker nøjagtigheden, ikke præcisionen
- Kan være sværere at opdage
- Kan skyldes fejljusteret instrument, kalibrationsfejl, eller forkert måleprocedure
- Kan IKKE reduceres ved at gentage målinger

#example(
  title: "Modstandsbestemmelse",
)[
Vi har foretaget fire målinger af strømmen gennem en modstand med forskellige spændinger over modstanden:

- Spænding, volt: $11.2, 13.4, 15.1, 17.7$
- Strøm, ampere: $4.67, 5.46, 6.28, 7.22$

Både voltmeter og amperemeter har en systematisk fejl på 2%.

Beregn modstanden $R = V/I$ for hver måling, og vurder både den tilfældige og systematiske usikkerhed på $R$.

=== Løsning

*Step 1: Beregn modstand for hver måling*
```python
  import numpy as np
  import uncertainties as unc

  V = np.array([11.2, 13.4, 15.1, 17.7])
  I = np.array([4.67, 5.46, 6.28, 7.22])
  R = V / I
  print(R)
```

Output: $[2.398, 2.454, 2.404, 2.452]$ $#unit("ohm")$

*Step 2: Beregn middelværdi og tilfældig usikkerhed*
```python
  R_mean = np.mean(R)
  R_sdom = np.std(R, ddof=1) / np.sqrt(np.size(R))
  print(R_mean, R_sdom)
```

Output:
$
  overline(R)           &= #qty("2.427", "ohm") \
  delta R_("tilfældig") &= s_(overline(R)) = #qty("0.015", "ohm")
$

*Step 3: Beregn systematisk usikkerhed*

Vi bruger fejlophobningsloven for $R = V/I$:

$
  (delta R_("sys"))/R = sqrt((delta V / V)^2 + (delta I / I)^2)
$

Begge måleinstrumenter har 2% systematisk fejl:
$
  (delta R_("sys"))/R &= sqrt((0.02)^2 + (0.02)^2) = sqrt(2) dot 0.02 = 0.02828 \
  delta R_("sys")     &= 0.02828 dot #qty("2.427", "ohm") = #qty("0.0686", "ohm")
$

*Step 4: Kombinér tilfældig og systematisk usikkerhed*

Da de to usikkerheder er uafhængige:
$
  delta R &= sqrt((delta R_("tilfældig"))^2 + (delta R_("sys"))^2) \
          &= sqrt((0.015)^2 + (0.0686)^2) = sqrt(0.000225 + 0.004706) \
          &= sqrt(0.004931) = #qty("0.07", "ohm")
$

*Resultat:*
$
  R = #qty("2.43+-0.07", "ohm")
$

#note-box(
  )[
  Den systematiske usikkerhed ($#qty("0.069", "ohm")$) dominerer kraftigt over den tilfældige usikkerhed ($#qty("0.015", "ohm")$). Dette betyder at præcisionen af målingerne er god, men nøjagtigheden begrænses af instrumenternes systematiske fejl.
]
]
