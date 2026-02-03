#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - October 03, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Key Concepts

== Matematisk induktion


#theorem[
  === Sætning 3.4.1
  Lad $S$ være en delmængde af $NN$. Vi antager at vi ved at:

  1. $1 in S$
  2. Hvis $n - 1 in S$, så gælder at $n in S$ for alle $n >= 2$

  Så er $S = NN$
]

#corollary(name: "3.4.2")[
  Lad $P(n)$ være et logisk udsagn for alle $n in NN$. Antag at:

  1. $P(1)$ er sand.
  2. Hvis $P(n-1)$ er sand, så er $P(n)$ også sand. For alle $n >= 2$

  Så er $P(n)$ sand for alle $n in NN$
]

#proof[
Bevis for koraller 3.4.2

Lad $S = {n in NN | P(n) "er sand" }$

#note-box[
  Vi vil vise at $S = NN$
]

Vi ved at $1 in S$, fordi det var givet at $P(1)$ er sand.
Vi ved også at $n - 1 in S$ så er $n$ også et element i $S$.
På grund af Sætning 3.4.1 kan vi konkludere at $S = NN$ og $P(n)$ er sand for alle $n in NN$
]


#note-box[
  en variant af induktion:

  Lad $b in ZZ$ og lad $P(n)$ være et logisk udsagn for alle $n in ZZ_(>= b)$

  Hvor det gælder at:

  1. $P(b)$ er sand.
  2. $P(n-1) => P(n) $ for alle $n >= b+1$

  Hvis det gælder så er $P(n) $ sand for alle $n in ZZ_(>= b) $
]


= Examples

== Induktions eksempler

#example[
  Tag summen af alle tal op til $n$
  $
    1 + 2 + dots + n = (n (n+1) )/2
  $

  Eller med sum tegnet

  $
    sum^n_(k=1) k  = (n (n+1) )/2
  $

  $P(n)$ Udsagnet er at, dette gælder for alle $n in NN$.

  Eksempel: $P(2): 1+2 = (2 dot (2+1))/2$


  Vi viser at $P(n)$ er sand for alle $n in NN$. Vi bruger et induktions bevis til dette.

  Et induktions bevis har en induktions basis: $P(1)$ er sand. Hvor $P(1) $ er udsagnet at ligningen er $1 = (1 (1+1))/2 $ er sand.

  Det næste induktionstrin er $P(n-1) => P(n) forall n >= 2 $

  Antag at $P(n -1)$ er sand (induktionshypotesen) med denne antagelse kan man vise at $P(n)$ også er sand.

  $
    P(n-1) : 1+ dots + (n-1) = ((n-1) (n-1 + 1) )/2
  $
  Burde være sand, og $P(n)$:

  $
    P(n): 1+ dots + n =^? (n(n +1))/2
  $


  Vi har

  $
    1 + dots + n &= 1 + dots + (n -1) + n \
    &= ((n-1)(n-1 +1 ))/2 + n \
    &= ( (n-1) dot n )/2 div (2n)/n = (n^2 - n + 2n)/2 \
    &= (n^2 + n)/2 = (n(n +1))/2
  $

  Dermed $P(n-1) => P(n)$ for alle $n >= 2$. Så $P(n)$ er sand for alle $n in NN$.
]

#example[
  Fibonnaci talfølgen er defineret ved
  $
    1,1,2,3,5,8,13, dots
  $
  Som kan skrives som

  $
    F_n = cases(
      1 &"hvis" n= 1 "eller" n= 2,
      F_(n-1) + F_(n-2) quad  &"hvis" n >= 3
    )
  $

  Så vi har ligningen:

  $
    F_1 + F_2 + dots + F_n = F_(n + 2) - 1
  $

  Vi kan nu vise ligningen $P(n) $ ved brug af induktion efter $n$.

  Induktionsbasis. $P(1)$ er sand, da $F_1 + F_2 = 1 + 1 = 2 = F_3 - 1$.

  Induktions hypotesen: antag at

  $
    F_1 + dots + F_(n -1) = F_(n +1) - 1 "for et" n >= 2
  $
  Så gælder:
  $
    F_1 + dots + F_n &= F_1 + dots + F_(n-1) + F_n \
    &= (F_(n+1) -1)  + F_n = F_n + F_(n + 1) - 1 \
    &= F_(n +2) - 1
  $

  Dermed gælder det for alle $n >= 2$. Så summen af alle fibonnacci tal er lig med $F_n + 2 - 1 $ for alle $n in NN$

]

=== Induktions variant

#example[

  Vi har udsagnet $P(n): 2^n >= n^2$

  $
    P(1)&: 2^1 >= 1^2 (2 >= 1) "sand" \
    P(2)&: 2^2 >= 2^2 (4 >= 4) "sand" \
    P(3)&: 2^3 >= 3^2 (8 >= 9) "falsk" \
    P(4)&: 2^4 >= 4^2 (16 >= 16) "sand"
  $

  Så vi viser at $2^n >= n^2 $ for alle $n in ZZ_(>=4) $

  Induktionsbasis: $(n= 4)$ hvor $2^4 >= 4^2$ er sand.

  Induktionstrin: vi antager at $2^(n-1) >= (n-1)^2$ for et $n >= 5$.

  Så gælder det at

  $
    2^n &= 2 dot 2^(n-1) >= 2 dot (n-1)^2 \
    &= 2 dot (n^2 -2n + 1) \
    &= 2n^2 -4 n  +2 \
    &= n^2 + n^2 - 4n + 2 \
    &= n^2 + n dot (n - 4) + 2 >= n^2 + 0 = n^2 \
  $

  Så dermed har vi at $2^n >= n^2$ for alle $n in ZZ_(>=4)$
]

Man kan tænke på et induktions bevis er ligesom en trappe. hvor på hvert trin har vi et logisk udsagn, basis er altså at vi skal komme på det første trin af trappen.
Induktionstrin er altså så at vi har styr på $P(n-1)$, det medfører så at vi kan finde det næste trin.


= Important Points



= Questions & Follow-up
