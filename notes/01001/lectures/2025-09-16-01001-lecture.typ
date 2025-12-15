#import "@local/dtu-template:0.4.2":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - September 16, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Key Concepts

$
  NN &= {1, 2, 3, ...} \
  ZZ &= {..., -2, -1, 0, 1, 2} \
  QQ &= {a/b | a in ZZ, b in NN}
$


$
  x^2 = -1, x &= i \
  i^2 &= - 1
$


#definition("4.1.1")[
  De komplekse tal er
  $
    CC = {a + b i | a ,b in RR }
  $<4.1.1>

    Caspar Wessel (1799)

    #example[
      $
        &a + b i = b i + a quad quad  &&a + b x = b x +a \
       &a + b dot i &&a + b dot x \
       &a + i b &&a + x b \
      $
    ]

    Et mere formelt eksempel

    #example[
      hvis $a, b,c, d in RR$ så gælder
      $
        a + b i = c + d i <==> a = c and b = d
      $

      Da $a$ er et reelt tal kan man skrive det som

      $
        a &in RR \
        a &= a + o dot i
      $

      Så dvs at $RR subset.neq CC$



      Komplekse tal  på formen

      $
        b dot i = o + b dot i
      $

      kaldes "ren imaginære"

      #definition("Ren imaginære")[
        Et rent imaginært tal er et komplekst tal hvor den reelle del er nul.
      ]
    ]


    Hvis $z = a + b i (a, b in RR)$

    Så skrives

    $
      Re(z) &= a "realdel af " z \
      Im(z) &= b "imaginære del af" z
    $

]


== Rektangulære form
Rektangulært form hvis

$
  z = a + b i (a, b in RR)
$

Tag talparet $(a, b)$, givet at $z = a + b i$ kaldes talparret z's rektangulære koordinater.



== Afstand til origo

lad $a + b i = z$

Så er afstanden givet ved $sqrt(a²+b²)$

Notationen for dette er
$
  abs(z) = sqrt(a² + b²)
$

Formen $abs(z)$ kaldes for modulus, numerisk værdi, eller absolut.

#important[
  Hvis
  $
    z = a + b i
  $
  Så har vi set at
  $
    z dot overline(z) = a^2 + b^2 = abs(z)²
  $
]

#example[
  Løs ligningen

  $
    abs(z) = 2 "indenfor" CC
  $

  Inden for $RR: z = 2 "og" z = - 2$

  Vi skriver $z$ på rektangulære form

  $
    z = a + b i
  $

  Så medføres $abs(z) = 2$ at har en uendelig mængde løsninger, da det resultere i en cirkel


]


Et andent eksempel

#example[
  Løs ligningen $abs(z + 2 - 3 i) = 3$ indenfor $CC$ og indenfor $RR$

  Vi skriver $z$ på rektangulære form

  $
    z &= a + b i
  $

  Dermed indsætter vi $z$ i $abs(z + 2 - 3 i) = 3$

  $
    abs(a + b i + 2 - 3 i) &= 3 \
    abs((a + 2) + (b - 3) i) &= 3\
    sqrt((a + 2)^2 + (b-3)^2) &= 3
  $

  Derfor
  $
    (a + 2)² + (b-3)² = 3²
  $

  Dermed har vi en cirkel med radius $3$ hvis midpunkt ligger i $RR^2 (-2,3)$
]

#important[
  $
    &abs(z) &&"afstand fra" z "til" 0 \
    &abs(z-z_0) &&"afstand fra" z "til" z_0
  $
]

= Examples


#example[
  $
    z &= 1 + 3 i \
   Re(1 + 3 i) &= 1 \
  Im(1 + 3 i) &= 3
  $

  Så
  $
    z = i &= 0 + 1 dot i \
    Re(i) &= 0 \
    Im(i) &= 1
  $
]


== Addition og subtraktion i $CC$

Det er baseret på hvordan man vil lægge polynomier sammen

Lad to sæt
$
  z_1 = a + b i, z_2 = c + d i (a, b, c, d in RR)
$

Nu kan man lægge dem sammen ved at lægge de reelle dele sammen og imaginære dele sammen

$
  z_1 + z_2 = (a+c) + (b+d) i
$

Subtrahering
$
  z_1 - z_2 = (a - c) + (b - d) i
$

#example[
  Beregn $(1 + 2 i) - (8 - i)$

  $
    &= 1 - 8 + 2 i -(-i) \
    &= -7 + 3 i
  $
]

== Multiplikation

Lad vores sæt være
$
  z_1 = a + b i, z_2 = c + d i
$


#definition("4.2.2 (Multiplikation)")[

  $
    z_1 dot z_2 = (a c - b d) + (b c + a d ) i
  $

  Hvorfor det?

  $
    z_1 dot z_2 &= (a + b i) dot (c + d i) \
    &= a c + a d i + b i dot c + b i dot d i \
    &= a c + (a d + b c) i + b d i ^ 2 \
    &= a c + (a d + b c) i - b d
  $

  Husk at
  $
    i^2 = - 1
  $

  Så dermed bliver det

  $
    (a c - b d)+ (a d + b c) dot i
  $
]

#example[
  Produktet af
  $
    (1 + 2 i) dot (3 + 4 i)
  $

  Kan findes ved at gange ud

  $
    &= 3 + 4 i + 6 i + 8 i ^2 \
    &= -5 + 10 i
  $
]

Idéen ved definitionen er at gange ud, og bruge det at $i^2 = -1$

== Division

#definition("4.2.3 (Kompleks konjugation)")[
  $
    z &= a + b i in CC (a,b in RR)
  $

  Den komplekse konjugation af $z$ er $overline(z)$

  $
    overline(z) &= a - b i
  $


  #example[
    $
      z &= 2 + 3 i, overline(z) &&= 2 -3 i \
      z &= -4 - 5 i, overline(z) &&= -4-(-5 i) = -4 + 5 i
    $

    $
      (2 +3 i) dot (2 -3 i) &= 4 - 6 i + 6 i - 9 i ^2 \
        &= 4 + 9 = 13
    $

    Lad

    $
      z &= a + b i
    $

    $
      z dot overline(z) &= (a + b i) dot (a - b i) \
      &= a ^2 - a b i + a b i - b^2 dot i ^2 \
      &= a^2 - b^2 dot (-1) \
      &= a^2 + b^2 "et reelt tal i" RR >= 0
    $

    #important[
      $
        z dot overline(z) = 0 <==> (a = 0) and (b = 0)
      $
    ]
  ]

]


#example[
  Lad

  $
    (1 + 2 i)/5 &= 1/5 + 2/5 i
  $

  Du kan altså dividere komplekse tal med reelle tal

  Et andet eksempel

  $
    (1 + 2 i)/(3+4 i) &= ((1 + 2 i) dot (3-4 i))/((3 + 4 i) dot (3 -4 i)) \
    &= (3-4 i + 6 i - 8 i ^2)/(9 + 16) \
    &= (11 + 2 i)/25 \
    &= 11/25 + 2/25 i
  $

  Man kan prøve at gøre division mere generelt

  $
    "hvis" z = a + b i
  $

  Så er

  $
    1/z &= 1/(a + b i) &&= (1 dot (a - b i))/((a + b i) (a - b i)) \
    &= (a - b i)/(a^2 + b^2) &&= a/(a^2 + b²) - b/(a² + b²) dot i

  $
]


= Important Points



= Questions & Follow-up
