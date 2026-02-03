#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - September 05, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

#important[
  Hvis der er problemer med Möbius skriv til `uepe@dtu.dk`
]

= Key conecpts

== Repetition

Implikation:

#dtu-table(
  columns: 3,
  caption: "Medfører",
  [P], [Q], [$P => Q$],
  [T], [T], [T],
  [F], [T], [T],
  [T], [F], [F],
  [F], [F], [T],
)


Bi implikation (Biconditional):

#dtu-table(
  columns: 3,
  caption: "Biconditional",
  [P], [Q], [$P <=> Q$],
  [T], [T], [T],
  [F], [T], [F],
  [T], [F], [F],
  [F], [F], [T],
)

Tautologi: Et udsagn som altid er sandt:

#dtu-table(
  columns: 3,
  caption: "Tautologi",
  [P], [$not P$], [$P or not P$],
  [T], [F], [T],
  [F], [T], [T],
)



= Examples

#example[
  Bestem alle løsninger $x in RR$ således at

  $
    sqrt(x) = - x
  $

  Hvis
  $
    sqrt(x) &= - x \
   (sqrt(x))² &= (- x)² \
   x &= x ^2
  $

  Dette medfører

  $
    x = x² => x² - x = 0
  $

  Simplificere

  $
    x² - x = 0 => x (x -1 ) = 0
  $

  Nu kan det faktoriserers

  $
    x (x -1) = 0 &=> (x = 0) or (x - 1 = 0) \
    (x = 0) or (x -1 = 0) &=> (x = 0) or (x = 1)
  $

  Bemærk: $x = 0$ er en løsning til ligningen $sqrt(x) = -x$, men $x = 1$ er ikke.

  Dette er ikke et problem, vi har vist at
  $
    (sqrt(x) = -x) => ( (x=0) or (x = 1))
  $

  #important[
  Vi finder alle de mulige løsninger men, tilfældet kan være at de ikke alle sammen faktisk er løsninger.
  ]


  Følgende sætninger er ækvivalente

  $
    (x = 0) or (x - 1 = 0) &<=> (x = 0) or (x = 1) \
    x = x² &<=> x² - x = 0 \
    x² -x = 0 &<=> x (x-1) = 0 \
    x (x -1) = 0 &<=> (x = 0) or (x - 1 = 0)
  $

  Så man finder alle de mulige løsninger, for at finde de reele løsninger.
]

Tag et andet eksempel

#example[
  Vi har numerisk værdi funktion
  $
    abs(x) "Numerisk værdi af x"
  $

  $
    abs(x) = cases(
      &&x &"hvis" x >= 0,
      -&&x &"hvis" x < 0
    )
  $

  Tag den numeriske værdi af 5

  $
    abs(5) &= 5 \
    abs(-5) &= 5 = -(-5)
  $


  Vi ved at en $P and T$ er logisk ækvivalent med P

  Vi har ligningen

  $
    (2 dot abs(x) = 3 x -1)/P
  $

  Hvor P er $P and T$, vi kan bruge tautologien $(x >= 0) or (x < 0)$

$
  (2 abs(x) = 3x -1) or [ (x >=) or (x < 0) ]
$

Dette er det samme som

$
  P and (Q or R) <=> (P and Q) or (P and R)
$

Er det samme som

$
  [(2 abs(x) = 3 x - 1) and (x >= 0 )] or [(2 abs(x) = 3x-1) and (x < 0)]
$

Er det samme som

$
  [(2x = 3x -1) and (x >= 0) ] or [(-2x = 3x -1) and (x < 0)]
$

$
  [ (-x = -1) and (x >= 0) ] or [(-5x = -1) and (x < 0)]
$

Hvilket er det samme som

$
  [(x = 1) and (x >= 0)] or [(x = 1/5) and (x < 0)]
$

Så
$
  (x = 1) or F
$

Til sidst bliver til
$
  x = 1
$

Så vi ved at $x = 1$ er en løsning
]



#example[
  Find alle reelle tal $x$ således at:

  $
    abs(x - 1) = -x² + x
  $

  // Insert graph or something

  $
    (abs(x-1) = -x² + x) and [(x >= 1) or (x < 1)]
  $

  Vi starter med at bruge regneregler for udsagnslogik

  $
    [(abs(x -1) = -x² + x) and (x >= 1)] or [( abs(x-1) = -x² + x) and (x < 1)]
  $

  Nu kan vi simplificere

  $
    [(x - 1 = -x² +x) and (x >= 1)] or [(-(x-1) = -x² + x)) and (x < 1)]
  $

  Simplificere

  $
    [(x² - 1 = 0) and (x >= 1)] or [(x^2 - 2x + 1 = 0) and (x < 1)]
  $

  Nu kan vi løse de kvadratiske sætninger

  $
    [ (x = 1) or (x = -1) and [(x >= 1) or (x = 1)]
  $

  Vi kan nu simplificere de to led

  $
    [((x = 1) and (x >= 1)) or ((x = 1) and (x >= 1)) ] or F
  $

  Modstrid

  $
    ((x =1) or F) or F <=> (x = 1) or F <=> x = 1
  $
]


#example[
  Tag sætningen: Vi har lært af succeserne men også af ethvert tilbageslag

  Vi kan lave det til logiske udsagn

  $
    P&: "Success" \
    not P&: "Tilbageslag" \
    Q&: "Vi har lært noget" \

    &(P => Q) and (not P => Q)
  $


  Vi kan lave en sandhedstabel

  #dtu-table(
    columns: 6,
    caption: $(P => Q) and (not P => Q)$,
    [P], [Q], [$not P$], [$P => Q$], [$not P => Q$], $(P => Q) and (not P => Q)$,
    [T], [T], [F], [T], [T], [T],
    [F], [T], [F], [T], [T], [T],
    [T], [F], [F], [F], [T], [F],
    [F], [F], [T], [T], [F], [F],
  )

  Det er så logisk ækvivalent med at vi har lært noget.
]


= Important Points



= Questions & Follow-up
