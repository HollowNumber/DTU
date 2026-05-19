#import "@local/dtu-template:0.6.3": *
#import "@preview/physica:0.9.8": *
#import "@preview/unify:0.8.0": *

#show: dtu-physics-note.with(
  course: "10060",
  course-name: "Fysik (Polyteknisk grundlag)",
  title: "Lecture - April 27, 2026",
  date: datetime(year: 2026, month: 4, day: 27),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring",
)

= Noter
== Relevante formler
#definition(title: "Rotationsenergi")[
  $
    K_"rot" = 1/2 I omega^2
  $
]

#definition(title: "Kinetisk energi af bevægende
og roterende legeme")[
  $
    K = K_"rot" + K_"trans" = 1/2 I_("cm") omega^2 + 1/2 M v^2_("cm")
  $
]

#definition(title: "Energi bevarelse")[
  $
    K_(1,"trans") + K_(1,"rot") + U_1 + W_"other" = K_(2,"trans") + K_(2,"rot") + U_2
  $
]

#definition(title: "Parallelaksesætningen")[
  $
    I_(parallel) = I_("cm") + M d^2
  $
]
