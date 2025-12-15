#import "@local/dtu-template:0.5.1":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - November 21, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)


#set math.mat(delim: "[")
#set math.vec(delim: "[")

= Key Concepts

== Diagnolisering

Vi har et vektorrum $V$ over $FF$, hvis dimension er $dim(V) = n$

Vi har videre en ordnet basis $beta = (v_1, dots, v_n$

En lineær afildning

$
  L: V -> V
$

Egenvektor:

$
  v in V (v != 0)
$

hvis:

$
  L(v) = lambda dot v "for" lambda in FF
$



Vi antager at vektorerne i $beta$ alle er egenvektorer for $L$:

$
  L(v_i) = lambda_i dot v_i "for" i = 1, dots, n
$

#let amat(mat, left, right) = math.attach(math.mat(mat), bl: left, br: right)

$
  amat(L, beta, beta) &= [ amat(L(v_1), ,beta )  amat(L(v_2), ,beta ) ... amat(L(v_n), ,beta ) ] \
  &= [ amat(lambda_1 dot v_1, , beta)  amat(lambda_2 dot v_2, , beta) ... amat(lambda_n dot v_n, , beta) ] \
  &= mat(lambda_1, 0, dots, 0;
    0, lambda_2, dots, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots, lambda_n
  ) // This is wrong but i'll fix it later
$


#definition(title: "12.3.1")[
  $
    L : V -> V
  $

  være en lineær afbildning, man siger at $L$ kan diagnoliseres hvis der findes en ordnet basis $beta$ for $V$ så $amat(L, beta, beta)$ er en diagonalmatrix.

  Ækvivalent med at $L$ kan skrives som en diagonalmatrix i en basis $beta$.

]

#example(title: "Diagnolisering af en matrix")[
  Givet $bold(A) in FF^(n times n)$ en kvardratisk matrix. Man siger at $bold(A)$ kan diagnoliseres hvis der findes en ordnet basis for $FF^n$ bestående, af egenvektorer for $bold(A)$.

  $
    L_bold(A) : FF^n &-> FF^n \
    bold(v) &mapsto bold(A) dot v
  $

  Så $bold(A)$ kan diagnoliseres hvis dens lineære afbildning $L_bold(A)$ kan diagnoliseres.
]

#note-box(title: "Mål i dag")[
  Hvornår findes en ordnet basis for $V$ (hhv. $FF^n$) bestående af egenvektoerer for $L$ (hhv $bold(A)$)
]

Lad $lambda$ være egenværdi for $L$:

$
  E_lambda {v | L(v) = lambda dot v}
$

Det geometriske multiplicitet er noteret med:

$
  dim(E_lambda) = op("gm")(lambda)
$
Hvilket er egenrummet tilhørende $lambda$,

Hvor $lambda$ er rod i $P_L (Z)$, det karakteristiske polynomium.
Rodens multiplictet findes ved:

$
  op("am")(lambda)
$

Som kaldes den algebraiske multiplicitet.
Det vides at $1 <= op("gm" )(lambda) <= op("am")(lambda) $

#let gm = math.op("gm")
#let am = math.op("am")

#lemma(name: "12.3.1")[
  $
    L : V -> V
  $

  Egenværdierne er:

  $
    lambda_1, lambda_2, dots, lambda_r
  $

  Hvor de alle er forskellige

  Vi kan skrive: $d_1 = gm( lambda_1 ), d_2 = gm(lambda_2), dots, d_r = gm(lambda_r) $

  Så har vi at

  $
    &E_lambda_1 "har en ordnet basis" (v^((1))_1, dots, v^((1))_d_1) \ // Continue this down to E_lambda_r
    &E_lambda_2 "har en ordnet basis" (v^((2))_1, dots, v^((2))_d_2) \
    &dots.v \
    &E_lambda_r "har en ordnet basis" (v^((r))_1, dots, v^((r))_d_r)
  $

  Så er sættet:

  $
    (v^((1))_1, dots, v^((1))_d_1, v^((2))_1, dots, v^((2))_d_2, dots, v^((r))_1, dots, v^((r))_d_r)
  $

  Er lineært uafhængige. Hvilket vil sige at vi har fundet

  $
    d_1 + d_2 + dots.c + d_r
  $
  har mange lineært uafhængige egenvektorer.
]

Hvornår gælder

$
  d_1 + d_2 + dots + d_r = n (= dim(v_1) )
$

hvis ligningen er opfyldt, er sættet fra lemma 12.3.1 en ordnet basis for $v$

$
  d_i = gm(lambda_i) <= am(lambda_i) = m_i
$


= Examples



= Important Points



= Questions & Follow-up
