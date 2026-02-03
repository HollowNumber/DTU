#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - September 02, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Udsagnslogik

Et logisk udsagn er en kombination af påstande der kan være enten sande eller falske. Et eksempel på dette kan være at $x = 10, 1 < y, a != p$. Variablerne $P, Q$ bruges typisk til at betgne logiske udsagn. Et logisk udsagn kan være sandt eller falsk, hvilket vil sige at et udsagn $P$ kan tage værdien *T* (true) eller værdien *F* (falsk eller false). Tallene 1 eller 0 benyttes også for henholdvis *T* eller *F*.

Udsagn kan opdeles i mindre enklere udsagn. For eksempel

$ x= 10 "og" 1 < y $

af de to enklere udsagn $x = 10, 1 < y$ kombineret med ordet "og". I udsagnslogik notation skrives dette som

$
  x = 10 and 1 < y
$

og mere læseligt ved

$
  (x = 10) and (1 < y)
$

#definition(
  "Sandhedstabel"
)[
  Lad $P$ og $Q$ være to logiske udsagn. Da er $P and Q$ sandt, netop når både $P$ er sandt, og $Q$ er sandt. Dette kan vises som en _sandhedstabel_

  #dtu-table(
    columns: 3,
    caption: "Sandhedstabel",
    [$P$], [$Q$], [$P and Q$],
    [T], [T], [T],
    [F], [T], [F],
    [T], [F], [F],
    [F], [F], [F]
  )
]


$F$ udgives for et logisk udsagn, som er modstrid eller for en falsk værdi. Tilsvarende er notationen for en _tautologi_ $T$

#dtu-table(
  columns: 3,
  caption: [Sandheds tabel for $P and not P$],
  [$P$], [$not P$], [$P and not P$],
  [T], [F], [F],
  [F], [T], [F],
)
#example()[

  Et eksempel på en sandhedstabel hvis altid er sand:

#dtu-table(
  columns: 3,
  caption: [Sandheds tabel for $P and or P$],
  [$P$], [$not P$], [$P and or P$],
  [T], [F], [T],
  [F], [T], [T],
)
]


#example()[
  Logisk ækvivalens

#dtu-table(
  columns: 5,
  caption: [$P or Q and P or (Q or not P)$],
  [$P$], [$Q$], [$not P$], [$Q or not P$], [$P or Q <==> P or (Q or not P)$],
  [T], [T], [F], [T], [T],
  [T], [F], [F], [F], [T],
  [F], [T], [T], [T], [T],
  [F], [F], [T], [T], [T],
)

$(P or Q) <==> (P or (Q or not P)$ er en tautologi
]


#definition(
  "1.3.1"
)[
  Implikation medfører $==>$ $P ==> Q$ ($P$ medføer $Q$)

  Hvis $P$ så $Q$
]

#example()[
  Vi har set at $P or Q$ og $P or (Q and not P)$ er logisk ækvivalente udsagn.

  Man kan komme frem til at de er logisk ækvivalente uden ved brug af sandhedstabeller.

  Man simplificere

  $
    P or (Q and not P) &<==> (P or Q) and (P or not P) \
          &<==> (P or Q) and T \
          &<==> (P or Q)
  $

  Dermed vises at $(P or Q) <==> (P or (Q or not P)$ er en tautologi
]


#definition(
  "1.3.4"
)[
  Følgende er tautologier
  $
    (P ==> Q) &<==> (not P or Q) \
    (P ==> Q) &<==> (not Q ==> not P) ("Kontraposition") \
    P &<==> (not P ==> F) ("Modstridsbevis") \
  $
]


#example()[
  Eksempel på Kontraposition (Opgave 7 i dag)

  $
    a&: "er et helt tal." \
    P&: a² "er et lige tal" \
    Q&: a "er et lige tal"
  $

  Vis at $P==> Q$ (Opgave 7)

  Kontrapositionen af $P ==> Q$

  er $not Q ==> not P$, dvs.

  $
    not Q&: a "er et ulige tal" \
    not P&: a² "er et ulige tal" \
    not Q ==> not P&: "Hvis a er ulige så er a² også ulige"
  $
]



#example()[
  Eksempel på modstridsbevis

  $
    P&: sqrt(2) "kan ikke skirves som en brøk af hele tal"
  $

  Man kan istedet vise det logiske ækvivalente at $not P ==> F$ antag at $sqrt(2) = a/b $ for at vise et hele tal og vis derudfra et modstrid

  Antag at $sqrt(2) = a/b$ skrives som forkortet brøk. Dermed gælder

  $
    2 &= (a²)/(b²) \
    2b² &= a^2
  $

  Men så $a²$ et lige tal (fordi $a² = 2 b²$)

  Udfra opgave 7 konkluderes at $a$ er et lige tal, dvs. $a = 2c$ for et hvist hele tal c.

  Man indsætter det i ligningen:

  $
    2b² = (2c)² = 2c dot 2c = 4c²
  $

  derfor

  $
    b² = 2 dot c²
  $

  dvs. at b² er et lige tal

  Opgave 7 medfører at $b$ er et lige tal

  Men så er $a/b$ ikke en forkortet brøk: modstrid.

]
