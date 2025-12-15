#import "@local/dtu-template:0.5.1":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - November 28, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall",
)

#set math.mat(delim: "[")
#set math.vec(delim: "[")

= Key Concepts

$
  f'(t) = bold(A) dot f(t) quad bold(A) in RR^(n times n)
$

Antag at $bold(A)$ kan diagnoliseres $(v_1, dots, v_n)$ ordnet basis for $RR^n$ bestående ud af egenvektorer for $bold(A)$ den fuldstændige løsning er $bold(A) dot v_i = lambda_i dot v_i$

$
  f(t) = c_1 dot v_1 dot e^(lambda_1 t) + dots.c + c_n dot v_n e^(lambda_n t) quad (c_1, dots, c_n in RR)
$

Løsningsmængden til $f'(t) = bold(A) dot f(t)$ er $op("span")_RR (v_1 e^(lambda_1 t), dots.c, v_n e^(lambda_n t) $

Hvad hvis $bold(A)$ ikke diagnoliseres (over $RR$).

I dag: $bold(A) in RR^(n times n) $ kan diagnoliseres over $CC$

#example(title: "")[
  $
    bold(A) = mat(-1, -3;3, -1) in RR^(2 times 2)
  $

  $
    P_(bold(A)) &= det(mat(-1 - Z, -3;3, -1-Z)) \
                &= (-1-Z)^2 + 9 = (1 + Z)^2 + 9
  $
  Egenværdierne:
  $
    (1+ lambda)^2 + 9 &= 0 \
    (1+ lambda)^2     &? -9 \
    1 + lambda        &= plus.minus 3 i \
    lambda_1          &= 1 +3i "og" lambda_2 = -1 - 3 i
  $

  Egenrummene:

  $
    E_(-1 + 3i)         &= ker(bold(A) - (-1 + 3i) bold(I)_2) \

    mat(-3i, -3;3, -3i) &arrow.long.r_("rref") mat(1, -i;0, 0)
  $

  Dvs. $vec(a, b) in E_(-1 + 3i) <==> a - i dot b = 0 $

  $
    vec(a, b) in E_(-1+3i) &<=> vec(a, b) = b dot vec(i, 1) (b in CC) \

    E_(-1 + 3i) = op("span")_(CC)(vec(i, 1))
  $

  Fordi $bold(A)$ er en reel matrix gælder at
  $
    bold(A) dot v &= lambda dot v \
    bold(A) dot v &= overline(lambda) dot overline(v)
  $

  Derfor $E_(-1-3i) = ("span")_CC (vec(-i, 1))$
]

Nøglen til at løse 1. ordens systemer af diff. ligninger var:

1. Man skal kunne diagnolisere $bold(A)$
2. man skal løse $f'(t) = lambda dot f(t) quad (lambda in CC) $

Vi betragter funktioner: $f(t) = f_1(t) + i dot f_2(t) $ hvor $t, f_1, f_2$ er reelle og eller reelle funktioner.

$
  Re(f(t)) &= f_1(t) \
  Im(f(t)) &= f_2 (t)
$

$
  overline(f(t))        &= f_1(t) - i dot f_2 (t) \
  f(t) + overline(f)(t) &= 2 f_1 (t) \
  f(t) - overline(f)(t) &= 2 i dot f_2 (t)
$


$ "Derfor"  &:op("span")_CC (f(t), overline(f)(t)) \ &= op("span")_CC (Re(f(t)), Im(f(t))) $

#example(title: "Løsning")[

  $
    f(t) &= e^(2 i dot t) quad (t in RR) \
    &= cos(2 t ) + i dot sin(2 t) \
  $

  Hvor $Re(f(t)) = cos(2 t)$ og $Im(f(t)) = sin(2 t)$. Og den afledte:

  $
    f'(t) &= 2 i dot e^(2 i dot t) \
    &= 2 i dot (cos(2 t ) + i dot sin(2 t)) \
    &= -2 sin(2 t) + i dot cos(2 t) dot 2 \
    (e^(2 i t))' &= 2 i dot (cos(2t) + i dot sin(2t) ) \
    &= 2i dot e^(2 i t)

  $


  Mere generelt:

  $
    (e^(beta i t) )' &= beta i dot e^(beta i t) quad (beta in RR)
  $

  #lemma(name: "13.1.3")[
    Hvis $lambda in CC, t in RR$ hvor $lambda = alpha + i dot beta (alpha, beta in RR)$

    $
      Re(e^(lambda t) ) &= e^(alpha t) dot cos (beta t) \
      Im(e^(lambda t) ) &= e^(alpha t ) dot sin(beta t)
    $
  ]


  Så

  $
    (e^(lambda t) )' = lambda dot e^(lambda t)
  $


  Dvs. $f'(t) &= lambda f(t)$ har dne komplekse fuldstændige løsmning:

  $
    f(t) &= c dot e^(lambda t) quad (c in CC)
  $
]

#theorem(title: "13.2.5")[
  $bold(A) in RR^(n times n)$, diagnoliserbar over $CC$.

  $(v_1, dots,c, v_n)$ ordnet basis for $CC^n$

  $
    bold(A) dot v_i = lambda_i dot v_i quad (lambda_i in CC)
  $

  Så har $f'(t) &= bold(A) dot f(t)$

  Kompleks fuldstændige løsning:

  $
    f(t) &= c_1 dot v_1 e^(lambda_1 t) + dots.c + c_n dot v_n e^(lambda_n t) quad (c_1, dots, c_n in CC)
  $
]

#example(title: "fortsat")[

  $
    bold(A) = mat(-1, -3; 3, -1)
  $

  $
    lambda_1 &= -1+3i \
    lambda_2 &= -1 -3i
  $


  Systemet $f'(t) = bold(A) dot f(t)$ har den komplekse fuldstændige løsning:

  $
    f(t) &= c_1 dot vec(i, 1) dot e^( (-1 + 3 i) dot t) + c_2 vec(-1, 1) e^( (-1-3i) dot t ) quad (c_1, c_2 in CC)
  $

  Fra kompleks til reet:

  Vi antager $bold(A) in RR^(n times n)$, derfor har $P_(bold(A)) (Z)$ relle koefficienter.

  #lemma(name: "5.3.3")[
    ægte komplekse rødder $lambda$ kommer i par. $lambda, overline(lambda)$ (kompleks konjugeret)

    Hvor $lambda in CC backslash RR$
  ]


  $bold(A)$ har egenværdier $lambda_1, dots.c, lambda_n in CC$

  Vi omskriver:

  $
    lambda_1, dots.c, lambda_r quad "reelle egenværdier"
  $

  $
    mu_1, mu_2, dots, mu_s
  $

  $
    overline(mu_1), overline(mu_2), dots.c, overline(mu_s)
  $

  ^ par af ægte komplekse egenværdier


  $
    f'(t) &= bold(A) dot f(t) quad bold(A) in RR^(n times n)
  $

  $
    f(t) &= op("span")_CC (v_i e^(lambda_i t), dots, v_r e^(lambda_i t ), w_i e^(mu_i t), overline(w)_i dot e^(overline(mu)_i dot t), dots, w_s dot e^(mu_s t), overline(w)_s dot e^(overline(mu)_s t) ) ) \
      &= op("span")_CC (v_i dot e^(lambda_i t), dots, v_r e^(lambda_i t), Re(w_i e^(mu_i t) ), Im(w_1 e^(mu_i) t ), dots.c, Re(w_s e^(mu_s t )), Im(w_s e^(mu_s t)))
  $

  Fra korrolar:

]


  #corollary(name: "13.2.6")[
    $
      f'(t) = bold(A) dot f(t)
    $
     har den reelle fuldstændige løsning:

     $
       f(t) = c_i e^(lambda_i t) &+ dots.c + c_r e^(lambda_r t) + c_(r+1),\  Re(w_i e^(mu_i t)  ) &+ c_(r+2) Im(w_i dot e^(mu_i t)) + dots+ c_(n-1) Re(w_s e^(mu_s t ) ) + c_n Im(w_s e^(mu_s t) )
     $
  ]


#example(title: "Løsning fortsat")[
  $bold(A) = mat(-1,-3; 3,-1)$

  Den komplekse fuldstændige løsning er:
  $
    f(t) = c_1 dot vec(i,1) e^( (-1 + 3 i ) dot t ) + c_2 dot vec(-i, 1) e^((-1-3i) t) quad (c_1, c_2 in CC)
  $

  Vi fokuserer på første led: $vec(i,1) e^((-1+3i)t)$

  Brug Lemma 13.1.3 med $lambda = -1 + 3i$, hvor $alpha = -1$ og $beta = 3$:

  $
    e^((-1+3i)t) &= e^(-t + 3i t) \
    &= e^(-t) dot e^(3i t) \
    &= e^(-t) (cos(3t) + i sin(3t))
  $

  Derfor:
  $
    vec(i,1) e^((-1+3i)t) &= vec(i,1) dot e^(-t) (cos(3t) + i sin(3t)) \
    &= e^(-t) vec(i,1) (cos(3t) + i sin(3t)) \
    &= e^(-t) (vec(i,1) cos(3t) + i vec(i,1) sin(3t)) \
    &= e^(-t) (vec(i dot cos(3t), cos(3t)) + i vec(i dot sin(3t), sin(3t))) \
    &= e^(-t) (vec(i dot cos(3t), cos(3t)) + i vec(-sin(3t), sin(3t)))
  $

  Opdel i real- og imaginærdel:
  $
    Re(vec(i,1) e^((-1+3i)t)) &= e^(-t) vec(-sin(3t), cos(3t)) \
    Im(vec(i,1) e^((-1+3i)t)) &= e^(-t) vec(cos(3t), sin(3t))
  $

  Fra korrolaret 13.2.6 er den reelle fuldstændige løsning:
  $
    f(t) = c_1 e^(-t) vec(-sin(3t), cos(3t)) + c_2 e^(-t) vec(cos(3t), sin(3t)) quad (c_1, c_2 in RR)
  $

  Eller ækvivalent:
  $
    f(t) = e^(-t) (c_1 vec(-sin(3t), cos(3t)) + c_2 vec(cos(3t), sin(3t))) quad (c_1, c_2 in RR)
  $
]

#note-box[
  *Vigtig observation:* Når vi har komplekse egenværdier $lambda = alpha plus.minus i beta$, får vi reelle løsninger på formen:
  $
    e^(alpha t) vec(cos(beta t), sin(beta t)) "og" e^(alpha t) vec(-sin(beta t), cos(beta t))
  $
  multipliceret med relevante egenvektorer.
]

= Examples

#example(title: "Verificering af løsning")[
  Lad os verificere at $f(t) = e^(-t) vec(cos(3t), sin(3t))$ er en løsning til $f'(t) = bold(A) dot f(t)$:

  $
    f'(t) &= (e^(-t))' vec(cos(3t), sin(3t)) + e^(-t) vec(cos(3t), sin(3t))' \
    &= -e^(-t) vec(cos(3t), sin(3t)) + e^(-t) vec(-3sin(3t), 3cos(3t)) \
    &= e^(-t) vec(-cos(3t) - 3sin(3t), -sin(3t) + 3cos(3t))
  $

  Tjek om $bold(A) dot f(t)$ giver samme resultat:
  $
    bold(A) dot f(t) &= mat(-1,-3;3,-1) dot e^(-t) vec(cos(3t), sin(3t)) \
    &= e^(-t) mat(-1,-3;3,-1) vec(cos(3t), sin(3t)) \
    &= e^(-t) vec(-cos(3t) - 3sin(3t), 3cos(3t) - sin(3t))
  $

  Hvilket stemmer overens! ✓
]

= Important Points

== Diagnolisering over $CC$

- Selvom en reel matrix $bold(A) in RR^(n times n)$ ikke kan diagnoliseres over $RR$, kan den altid diagnoliseres over $CC$
- Komplekse egenværdier kommer i konjugerede par: hvis $lambda = alpha + i beta$ er en egenværdi, så er $overline(lambda) = alpha - i beta$ også en egenværdi
- Tilsvarende kommer egenvektorer i konjugerede par

== Komplekse funktioner med reelt input

- For $lambda = alpha + i beta in CC$ og $t in RR$:
  - $e^(lambda t) = e^(alpha t) (cos(beta t) + i sin(beta t))$
  - $Re(e^(lambda t)) = e^(alpha t) cos(beta t)$
  - $Im(e^(lambda t)) = e^(alpha t) sin(beta t)$
  - $(e^(lambda t))' = lambda e^(lambda t)$

== Fra kompleks til reel løsning

Givet kompleks fuldstændig løsning med egenværdier $mu, overline(mu)$ og egenvektorer $w, overline(w)$:

1. Løsningsrummet udspændes af: $op("span")_CC (w e^(mu t), overline(w) e^(overline(mu) t))$

2. Dette er ækvivalent med: $op("span")_CC (Re(w e^(mu t)), Im(w e^(mu t)))$

3. Den reelle fuldstændige løsning er derfor:
   $
     f(t) = c_1 Re(w e^(mu t)) + c_2 Im(w e^(mu t)) quad (c_1, c_2 in RR)
   $

== Struktur af fuldstændig løsning (Korollar 13.2.6)

For $bold(A) in RR^(n times n)$ med:
- Reelle egenværdier: $lambda_1, dots, lambda_r$
- Komplekse egenværdipar: $mu_1, overline(mu)_1, dots, mu_s, overline(mu)_s$

Den reelle fuldstændige løsning er:
$
  f(t) = sum_(i=1)^r c_i v_i e^(lambda_i t) + sum_(j=1)^s (c_(r+2j-1) Re(w_j e^(mu_j t)) + c_(r+2j) Im(w_j e^(mu_j t)))
$

hvor $c_1, dots, c_n in RR$.
