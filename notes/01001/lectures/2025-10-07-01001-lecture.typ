#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - October 07, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

#set math.mat(delim: "[")

= Key Concepts

== Lineære ligningssystemer

Hvad er en lineær ligning? En lineær ligning er en ligning, der kan skrives på formen $a x + b = 0$, hvor $a$ og $b$ er konstanter og $x$ er en ubekendt.

Givet nogle ubekendte

$
  a_1 x_1 + dots + a_n x_n  = b
$
hvor
$
  a_1, dots, a_n, b in FF quad (FF "et legeme").
$

#note-box[
  Pragmatisk så er $FF$ enten $FF = CC$ eller $FF = RR$
]

Men hvad er løsningen til sådan en løsning? Det er det samme som en n-tuppel.

$
  (v_1, dots, v_n) in FF^n
$

som opfylder

$
  a_1 dot v_1 + dots + a_n dot v_n = b.
$


#definition("6.1.2")[
  Et lineært ligningssystem over $FF$ med $m$ ligninger og $n$ ubekendte $x_1, dots, x_n$ er et system:

  $
    a_(11) x_1 + a_(12) x_2 + dots + a_(1n) x_n &= b_1 \
    a_(21) x_1 + a_(22) x_2 dots + a_(2 n) &= b_2 \

    dots.v  \

    a_(m 1) x_1 + a_(m 2) x_2 + dots + a_(m n) x_n &= b_m \
  $

  Hvor alle $a_(i j)$ koefficienter, og $b_i$ er elementer i legemet $FF$ ($a_(i j), b_j in FF$).
  Hvor en løsning til systemet er $(v_1, dot, v_n) in FF^n$ som opfylder alle $m$ ligninger.
]

Sådan et system af lineære ligninger kaldes et *homogent*. hvis alle højre sider er $0$. Altså hvis $b_1, dots, b_m = 0$ er systemet homogent.
Hvis mindst én højreside ikke er nul, kaldes systemet *inhomogent* $forall b in FF, exists m in FF (m != 0) $.

#theorem(name: "6.1.1")[
  Givet et homogent lineær ligningssystem over $FF$. ($m$ ligninger, $n$ ubekendte)

  Da gælder

  1. $(0,0,0) in FF^n$ er en løsning
  2. Hvis $(v_1, v_2, dots, v_n)$ er en løsning, så er $(c dot v_1, c dot v_2, dots, c dot v_n)$ for alle $c in FF$
  3. Hvis $(v_1, v_2, dots, v_n)$ og $(w_1, w_2, dots, w_n)$ er løsninger til det givne system, så er $(v_1 + w_1, v_2 + w_2, dots, v_n + w_n)$ også en løsning til det givne system.
]

#proof[
  Punkt 3 i "6.1.1" givet en ligning fra ligningssystemet

  $
    a_(11) x_1 + dots + a_(1 n) x_n = b_1
  $

  Vi ved at

  $
    a_(11) v_1 + dots + a_(1 n) v_n &= 0 \
    a_(11) w_1 + dots + a_(1 n) w_n &= 0 \
    a_(11) v_1 + dots + a_(1 n) v_n + a_(11) w_1 + dots + a_(1 n) w_n &= 0 + 0 \
    a_(11) (v_1 + w_1) + dots + a_(1 n) (v_n + w_n) &= 0
  $

  På lignende måde ses at hvis $(v_1, dots, v_n)$ og $(w_1, dots, w_n)$ er løsninger til den $i$-te ligning $(a_(i 1) x_1 + dots + a_(1 n) x_n = b_i)$ så er $(v_1 + w_1, v_2 + w_2, dots, v_n + w_n)$ også en løsning til den $i$-te ligning.
  Så er $(v_1, dots, v_n)$ og $(w_1, dots, w_n) $ løsmning til alle $m$ ligninger så er $(v_1 + w_1, v_2 + w_2, dots, v_n + w_n)$ også en løsning til alle $m$ ligninger.
]

#theorem(name: "6.1.2")[
  Hvis et inhomogent lineært ligningssystem har en løsning $(v_1, dots, v_n) in FF^n$ så er enhver anden løsning på formen:


  $(v_1 + u_1, dots, v_n + u_n)$, hvor $(u_1, dots, u_n)$ er løsning til det tilhørende homogene lineær ligningssystem.

]

Men hvordan løser vi ligningssystemer generelt? Betragt dette linæer ligningssystem

$
cases(
  x_1 + x_2 + x_3 &= 3 \
  x_1 + 2x_2 + 3x_3 &= 6
) "over" RR
$

Vi kan simplificere dette ligningssystem, hvilket vil sige at det har samme løsningsmængde som:

$
cases(
  x_1 + x_2 +x_3 &= 3 \
  x_2 + 2x_3 &= 3
)
$

Dette gøres ved, givet ligningerne $f_1$ og $f_2$ kan man simplificere ved $f_2 - f_1$. Tilsvarende $f_1 - f_2$ gælder også. Man kan endvidere simplificere:

$
  cases(
    x_1 - x_3 = 0\
    x_2 + 3x_3 &= 3
  ) "over" RR
$

Lad os vælge nogle en ubekendt $x_3$ og give det en værdi $x_3 = 1$, derfra kan man løse for det $x_3$ og dermed er $(1,1,1)$ en løsning.


== Matricer

At skrive lineære ligningssystemer som er blevet gjort indtil videre, er meget langtrukket. Det man kan gøre i stedet for er, at skrive dem som matricer.

#let du(variable) = $underline(underline(#variable))$

$
  du(upright(A)) = mat(
    a_11, a_12, dots, a_(1 n) ;
    a_21, a_22, dots, a_(2n) ;
    dots.v, dots.v, dots.down, dots.v ;
    a_(m 1), a_(m 2), dots, a_(m n);
  ) "Systemets koefficient matrix"
$

og

$
du(upright(I)) = mat(
  a_11, a_12, dots ,a_(m n), b_1;  augment: #(-1),
  a_21, a_22 ,dots, a_(2 n), b_2;
  dots.v , dots.v , dots.down, dots.v, dots.v;
  a_(m 1), a_(m 2), dots, a_(m n), b_m

) "Systemets totalmatrix"
$

Til dette kan der bruges 3 typer af "operationer" til at simplificere et given system.

+ byt om på to rækker. Dette betegnes som, givet en række $i$ og række $j$ skrives $"R"_i <-> "R"_j$
+ gang en række med en konstant forskellig fra nul. ($"R"_i <- c dot "R"_i $)
+ gang en række med en konstant og læg resultatet fra det til en anden række ($"R"_1 <- "R"_1 + d dot "R"_j$ )


=== Generelt

Givet en totalmatrix, så kan man bruge række operationer til at modificere matricen til en der opfylder:


+ rækker med kun nultal er nederst i matricen
+ to forskellige ikke nul rækker har deres pivot-elementer i forskellige søjler og pivot-element i den nederste række er mere til højre end pivot-elementer i den øverste række.


Givet en vektor $(0, 0, 5, 7, 0)$. Det første ikke nul indgang af en række kaldes pivot-elementet af den række. Hvis man har to rækker

$
(0, dots, 0, a, dots,) \
(0,dots, 0,0, b, dots  )
$
Så gælder det at den nedre rækkers pivot element skal lægge længere til højre end den øvre.

En matrix der opfylder krav 1. og 2. kaldes en trappematrix. Er følgende yderligere to krav opfyldt, kaldes matricen reduceret trappematrix

3. For alle rækker: første ikke-nul element i en række er lig med $1$ (pivoterne er alle $1$).
4. Hvis en søjle indeholder et pivotelement, så er alle de øvrige elementer i søjlen $0$.




= Eksempler


== Lineære ligningssystemer

#example[
  $
    x_1 + 2 x_2 = 3 quad "over" RR
  $

  Vi har nogle løsninger

  $
    (1,1) "er en løsning" \
    (3,0) "er en løsning" \
    (3 + 2 i, - i) "er ikke en løsning"
  $

  løsninger til en lineær ligning skal have koefficienter i det talsystem $FF$.

  Man kan tage samme eksempel men over $CC$

  $
    (1,1) "er en løsning" \
    (3,0) "er en løsning" \
    (3 + 2 i, - i) "er en løsning"
  $

  så angående hvilket legeme $FF$ vi arbejder over, så er løsningerne forskellige.

]


=== Homogent og inhomogent systemer



#example[
  Et homogent lineære ligningssystem hvor $FF = RR$:

  $
    cases(
      x_1 + x_2 + x_3 &= 0 \
      x_1 + 2 x_2 + 3 x_3 &= 0
    )
  $

  er

  $
    (0,0,0) "en løsning" \
    (1, -2, 1) "er en løsning" \
    (-1, 2, -1) "er en løsning"
  $
]



#example[
  Inhomogent system med ingen løsninger.

  $
    cases(
      x_1 + x_2 = 0 \
      2x_1 + 2x_2 = 1
    ) "over" RR
  $

  Har altså ingen løsninger.
]

=== Tilhørende homogene lineære ligningssystem



#example[
  Inhomogent system over $RR$

  $
    cases(
      x_1 + x_2 + x_3 &= 3 \
      x_1 + 2 x_2 + 3 x_3 &= 6
    )
  $

  har tilhørende homogene lineær ligningssystem:

  $
    cases(
      x_1 + x_2 + x_3 &= 0 \
      x_1 + 2 x_2 + 3 x_3 &= 0
    )
  $

  som har følgende løsninger:

  $
    (1,1,1) "til det inhomogene system"
  $
  dette kaldes den partielle løsning.

  Og $(0,0,0), (1,-2,1) ,(-1,2,-1)$ er løsninger til det tilhørende homogene system.

  Ifølge sætning 6.1.2 gælder derfor at

  $
    (1,1,1) + (0,0,0) &= (1,1,1) \
    (1,1,1) + (1,-2,1) &= (2,-1,2) \
    (1,1,1) + (-1,2,-1) &= (0,3,0)
  $
  er løsninger til det inhomogene system.
]


=== Lineære systemer som matricer


#example[
  $
    cases(
      x_1 + x_2 + x_3 &= 1 \
      x_1 + 2x_2 + 4x_3 &= 2 \
      x_1 + 4x_2 + 16x_3 &=  3
    ) "over" RR
  $


  Først finder vi total matricen $upright(A)$


  $
  underline(upright(A)) = mat(
    1,1,1,1;
    1,2,4,2;
    1,4,16,3
  )
  arrow.r.long_("R"_2 <- "R"_2 - "R"_1 \ "R"_3 <- "R"_3 - "R"_1)
  mat(
    1,1,1,1;
    0,1,3,1;
    0, 3, 15, 2
  )
  $
  Vi kan prøve at simplificere det videre

  $
   upright(underline(A)) arrow.long.r_("R"_3 <- "R"_3 - 3 "R"_2) mat(
      1,1,1,1;
      0,1,3,1;
      0,0,6, -1
  )
  $

  Så på den gamle notation bliver det igen

  $
    cases(
      x_1+ x_2 + x_3 &= 1 \
      x_2 + 3x_3 &=  1 \
      6x_3 &= -1
    )
  $

  hvor vi så kan løse vores ubekendte. Dette kaldes *backward-substitution*. Vi kan endvidere simplificere ligningssystemet

  $
    arrow.long.r_("R"_1 <- "R"_1 - "R_2") mat(
      1,0,-2,0;
      0,1,3,1;
      0,0,6,-1
    ) arrow.r.long_("R"_3 <- 1/6 dot "R"_3)

    mat(
      1,0,-2,0;
      0,1,3,1;
      0,0,1,- 1/6
    ) arrow.r.long_("R"_1 <- "R"_1 + 2 "R"_3 \ "R"_2 <- "R"_2 - 3 "R"_3)

    mat(
      1,0,0, - 1/3;
      0,1,0, 3/2;
      0,0,1, - 1/6
    )
  $

  Så ligningssystemet er nu blevet til

  $
  cases(
    x_1 &= - 1/3 \
    x_2 &= 3/2 \
    x_3 &= - 1/6
  )
  $

  Så derfor har systemet vi startede med kun én løsning, nemlig: $(- 1/3, 3/2, - 1/6)$
]
