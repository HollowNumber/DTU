#import "@local/dtu-template:0.5.1":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - December 02, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Key Concepts

Andenordens linere diff ligninger med konstante koefficienter indsættes udtrykkerne for

$
  f,f',f''
$

i

$
  f''(t) + a_1 f'(t) + a_0 f(t) = 0
$

i

$
  cancel(e^(lambda_1 t)) dot g''(t) = 0
$

$
  g(t) = c_1 dot t + c_2 (c_1, c_2 in RR)
$

Husk at: $f(t) = g(t)dot e^(lambda_1 t) $

Derfor hvis $D = 0$, så har $f''(t) + a_1 f'(t) + a_0 f(t)= 0$


#example[
  $
    f''(t) +  4 f'(t) + 4 f(t) = 0
  $
  Har fuldstændig løsning:

  Det karakteristiske polynomium er $Z^2 + 4 Z + 4$. Så diskriminannten:
  $
    D &= 4^2 -4 dot 1 dot 4 = 0 \
    lambda_1 &= lambda_2 = - 4/2 = - 2
  $

  Så

  $
    f(t) = c_1 dot t dot e^(-2t) + c_2 e^(-2t)
  $


  Et andet eksempel hvor:

  $
    f''(t) + 4 f'(t) + 13 f(t) = 0 \
  $

  hvor

  $
    D &= 4^2 - 4 dot 13 = -36 \
    lambda_1 &= (-4 + 6i)/2 = - 2 + 3 i
  $

  Derfor er den fuldstændige løsning:

  $
    f(t) = c_1 dot e^(-2t) dot cos(3t) + c_2 dot e^(-2t) dot sin(3t) quad c_1, c_2 in RR
  $

]

#theorem(title: "Korollar 13.3.21")[
  $ f''(t) + a_1 f'(t) + a_0 = q(t) quad (q(t) != 0) $

  Lad $f_p(t)$ være en partiuklær løsning til den givne differential ligning, såer den fuldstændige løsning:

  $
    f(t) = f_p(t) + f_h(t)
  $

  hvor $f_h(t)$ er den fuldstændige løsning til den homogene differential ligning

  $
    f''(t) + a_1 f'(t) + a_0 f(t) = 0
  $

]


#example[
  Hvis vi har en højreside som ikke er nul.

  $
    f''(t) + 4 f'(t) + 4 f(t) = cos(2t)
  $

  Så kan vi beregne den fuldstændige løsning.

  Vi ved $f_hom (t) = c_1 dot t  dot e^(-2t) + c_2 dot e^(-2t) $ er den fuldstændige løsning til den homogene differential ligning

  Vi skal nu finde den particular løsning $f_p(t)$, dette gør man ved at se på strukturen af en partiuklær løsning og "gætte".

  $
    f_p(t) = a dot cos(2t) + b dot sin(2t) quad (a,b in FF)
  $

  kunne være et gæt, hvor $a,b$ skal bestemmes. Så fås

  $
    f'_p(t) &= a dot -sin(2t) dot 2 + b dot cos(2t) dot 2 \
    f''_p(t) &= a dot - cos(2t) dot 4 + b dot -sin(2t) dot 4
  $

  Vi kan nu indsætte vores partikulære løsning $f_p(t)$ i den givne differential ligning:

  $
    f''(t) + 4 f'(t) + 4 f(t) = cos(2t)
  $

  $
    = - 4 a dot cos(2t) - 4b dot sin(2t) &&+ 4 (-2 a dot sin(2t) + 2 b dot cos(2t)) \
    &&+ 4 (a cos(2t) + b sin(2t) ) = cos(2t)
  $

  $
    (underbracket((-4 a + 8 b + 4 a), 1) dot cos(2t) + (underbracket(-4b -8a + 4b, 0)) dot sin(2t)) = cos(2t)
  $

  Så $f_p(t) = 1/8 dot sin(2t)$ er en partikulær løsnin.

  Vi kan nu lægge det sammen med den homogene løsning $f_hom (t)$ for at få den fuldstændige løsning:

  $
    f(t) = f_p(t) + f_h(t) = 1/8 dot sin(2t) + c_1 dot t  dot e^(-2t) + c_2 dot e^(-2t) quad (c_1, c_2 in RR)
  $

  Er den fuldstændige løsning

]

Begyndelsesværdibetingelser:

$
  f''(t) + a_1 f'(t) + a_0 f(t) = q(t)
$

#set math.mat(delim: "[")
#set math.vec(delim: "[")

hvor
$
  vec(f(t), f'(t) )
$
er løsning til

$
  vec(f'_1(t), f'_2(t) ) = mat(0, 1; - a_0, - a _1) dot vec(f_1 (t), f_2(t) ) + vec(0, q(t))
$

= Examples



= Important Points



= Questions & Follow-up
