#import "@local/dtu-template:0.6.3":*

#show: dtu-physics-note.with(
  course: "10060",
  course-name: "Fysik (Polyteknisk grundlag)",
  title: "Lecture - March 09, 2026",
  date: datetime(year: 2026, month: 3, day: 9),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)


#definition(title: "Hooke's lov")[

  $
  F_"fjeder" = - k dot (x - x_0)
  $

  hvor: 
  $
x_0&: "Ligevægt position" [m] \ 
k&: "Fjederkonstant" ["N"slash m ]
  $
]


#solution()[
    For den første person, ved terminal fart, er den nedadgående kraft (tyngdekraften) lig med den opadgående kraft (luftmodstanden):

    $
      m g = k v^2
    $

    Hvor $m$ er massen, $g$ er tyngdeaccelerationen (ca. 9.81 m/s^2), $k$ er konstanten, og $v$ er terminalfarten.

    Vi kan løse for $k$:

    $
      k = (m g)/v^2
    $

    For den første person:

    $
      k = frac(70 dot 9.81,15^2) = frac(686.7,225) approx 3.05 quad, N dot s^2/m^2
    $

    For den anden person, ved terminal fart, gælder det samme forhold:

    $
      m g = k v^2
    $

    Vi kan løse for den nye terminal fart $v'$:

    $
      v' = sqrt(frac(m g,k))
    $

    Indsætter værdierne for den anden person:

    $
      v' = sqrt(frac(90 dot 9.81,3.05)) = sqrt(frac(882.9,3.05)) approx sqrt(289.5) approx 17.02 m/s
    $

    Så terminalfarten for vennen under udspringet vil være cirka 17.02 m/s.
  ]



= Exercises



