#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - November 11, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

#set math.mat(delim: "[")
#set math.vec(delim: "[")
= Lineære afbildninger

== Tidligere

En funktion er en afbildning fra

$
  f: A -> B
$
hvor $A$ er en definitionsmængde og $B$ er dispositionsmængden. Det er det samme som at sige:

$
  f(A) = image(f) &= {f(a} | a in A} \
  &= {b in B | "der findes" a in A "så" b = f(a)}
$

=== Invertibel funktion

$f: A -> B$

$f$ kaldes invertibel hvis der er en funktion hvis

$
  f^(-1) : B -> A
$

så

$
  f compose f^(-1) = id_B "og" f^(-1) compose f = id_A
$

dvs.

$
  f(f^(-1)(b) ) = b "og" f^(-1)(f(a)) = a "for alle" b in B "for alle" a in A
$

== Lineære afbildninger

#definition(title: "Lineære Afbildning")[
  Lad $V$ og $W$ være vektorrum over $FF$ en funktion $ L : V -> W$ kaldes en lineær afbildning hvis

  + $L(v_1 + v_3) = L(v_1) + L(v_2) "for alle" v_1, v_2 in V$
  + $L(c dot v) = c dot L(v) "for alle" c in FF "og" v in V$
]

#note-box[
  Generelt er en lineære afbildning:

  $
    L: V -> W
  $

  Hvor $V$ er definitionsrummet og $W$ er dispositionsrummet
]

#definition(title: "billedrummet")[
  $
    L(v) &= image L = {L(v | v in V} \
      &= { w in W | "der findes" v in V "så" w = L(v) }
  $
  Faktum: $image L$ er et underrum i $W$

  vises i lemma 10.4.2 for alle $w_1, w_2 in image L$ skal tjekkes at $w_1 + c dot w_2$ også er i $image L$. Så der findes
  $
    v_1, v_2 in V "så" w_1 &=  L(v_1) "og" \
    w_2 &= L(v_3)
  $
  hvilket bliver til
  $
    &w_1 + c dot w_2 \
   &= L(v_1) + c dot L(v_2) \
   &= L(v_1 + c dot v_3)
  $
]

#lemma(name: "11.1.2")[
  givet $A in FF^(m times n)$

  $
    L_A : FF^n &-> FF^m \
    v mapsto A dot v
  $

  Så er image
  $
    image L_A = op("colspan")(A)
  $

  $w in image L_A <=> "der findes" v in FF^n$

  $
    W = L_A (v) = A dot v
  $

  Skrives $A = mat(dots.v, dots.v, , dots.v; a_1, a_2, dots, a_n ;dots.v, dots.v, , dots.v)$

  fås:

  $
    A = dot v = underbracket(v_1 dot a_2 + v_2 dot a_2 + dots + v_n dot a_n, "er i" op("span")(a_1, a_2, dots, a_n) )
  $

  Faktisk

  $
    image(L_A) = op("span")(a_1, dots, a_n) = op("span")(A)
  $
]

= Examples

#example[
  Vælg $a in RR, L : RR -> RR$ og

  $
    x mapsto a dot x
  $

  er en lineær afbildning:

  tjek 1.
  $
    L(x_1 + x_2) &= a dot (x_1 + x_2) \
    &= a dot x_1 + a dot x_2 \
    &= L(x_1) + L(x_2)
  $

  tjek punkt 2.

  $
    L(c dot x_1) &= a dot c dot x_1 \
    &= c dot a x_1 \
    &= c dot L(x_1)
  $
]

#example[
  Vælg $a, b in RR, b != 0$

  Lad funktionen være
  $
    f: RR &-> R \
    x &mapsto a x + b
  $
  bemærk $f(0) = b != 0$ og dermed er det ikke en lineær afbildning
]

#example[
  $underline(underline(A)) in FF^(m crossmark n)$

  $
    L_(underline(underline(A))) : FF^n &-> FF^m \
    underline(v) mapsto underline(underline(A)) dot underline(V)
  $

  Er en lineær afbildning:

  1.
  $
    L_A (v_1 + v_2) &= A dot (v_1 + v_2) \
    &= A dot v_1 + A dot v_2 \
    &= L_A(v_1) + L_A(v_2)
  $

  2.

  $
    L_A (c dot v) &= A dot (c dot v) = c dot A dot v \
    &= c dot L_A (v)
  $
]

#example[
  $
    A &= mat(2, -1; 1,1) in RR^(2 times 2) \
    L_A  &: RR^2 -> RR^2 \
    v &mapsto A dot v
  $


  $
    A dot vec(1,0) &= mat(2, -1; 1,1) dot vec(1,0) = vec(2,1) \
    A vec(0,1) &= vec(-1, 1)
  $


]


#example[
  $
    C_infinity (RR) "det relle vektorrum af alle vilkårligt ofte differentiable funktioner" \
    f: RR -> RR
  $

  For eksempel indeholder

  $
    C_infinity(RR) \
    t mapsto e^t (e^t), cos(t), sin(t), cos(t) = (e^t + e^(-t))/2, sin(t) = (e^t - e^(-t))/2
  $
]

= Important Points



= Questions & Follow-up
