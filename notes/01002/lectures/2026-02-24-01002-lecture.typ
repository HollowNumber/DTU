#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": *

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - February 24, 2026",
  date: datetime(year: 2026, month: 2, day: 24),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)
#let inv(content) = $#content ^(-1) $
#let vecrow = vecrow.with(delim: "[")
#let dmat = dmat.with(delim: "[")

#note-box[
  $
  A^(n times n) "som er symmetrisk"
  $
]

Speltralsætningen er lignende:

$
bold(A) = bold(Q) Lambda bold(Q)^TT, bold(Q)^TT = bold(Q)^(-1) , bold(Q) bold(Q)^TT  = bold(I)
$

2. Reduktion af kvadratiske $bold(Q) in M_(n times n)$ former

$
Q^TT A Q = underbrace(Q^TT Q, = I) Lambda underbrace(Q^TT Q, = I)
$


#theorem()[
  En matrix matrix $A in M_n (CC)$ siges at være 

  #set enum(numbering: "(i)")

  1. diagnoliserbar hvis der eksisterer en inv matrix $S in M_n (CC)$ så $S^(-1) A S$ er diagonal
  2. Unitær diagnoliserbar hvis der eksis. en unitær matrix $U in M_n (CC)$ så $U^* A U$er diagonal 
  3. Reel ortogonaliserbar hvis der eksis. en reel ortogonal matrix $Q in M_n(RR)$ så $Q^TT A Q$ er diagonal]


Antag at $bold(A)$ er diagonaliserbar:
$
bold(S)^(-1) bold(A) bold(S) = bold(Lambda) = dmat(lambda_1, lambda_2, dots.down, lambda_n, fill: 0, delim: "[")
$

$
underbrace(bold(S) bold(S)^(-1),bold(I)) &bold(A) bold(S) = bold(S) bold(Lambda)\
&bold(A) bold(S) = bold(S) bold(Lambda)
$
$
bold(S) = mat(arrow(s_1),arrow(s_2),dots,arrow(s_3))
$

$
bold(S) arrow(c) = mat(arrow(s_1),arrow(s_2),dots,arrow(s_3)) vec(c_1,c_2,dots.v,c_n)
$

$
bold(S) vec(0,lambda_k,dots.v,0) = lambda_k arrow(s)_k
$

$
bold(A) bold(S) = mat(bold(A) arrow(s_1),bold(A) arrow(s_2),dots,bold(A) arrow(s_n))
$

#definition()[
k'te søjle $bold(A) arrow(s_k)$:
$
bold(A) arrow(s_k) = lambda_k arrow(s_k)
$
for $k=1,dots,n$
]


#theorem[
  #set enum(numbering: "(i)")


  Egenvektor par

  Matricen $bold(A) in M_n (CC) $ kaldes 

  1. Reel, symmetrisk hvis $A in M_n (RR), A^TT = A (= A^*)$
  2. Hermitisk hvis $ A^* = A$
  3. Normal hvis $A^* A = A A^*  $
]



#example[
  

  $
  A = mat(3, 2+4i; 2-4i, 3)
  $


  Den er ikke reel, og dermed heller ikke reel symmetrisk.

  Den er dog Hermitisk og normal. 

  #note-box[
    når den er $2 times 2$ kan man bare kigge på den kompleks konjugeret. 
  ]



  $
  C = mat(1, i+1, 3; 3, 1, i +1; i +1, 3, 1)
  $

  Den er ikke hermitisk (eller reel), men den er normal.
]

Antag $A = A^*$


Lemma 2.8.1: $A$ har reelle egenværdi

#let ll = $lambda$

$
ll_1 != ll_2 -> E_(ll_1) perp E_(ll_2)
$

#proof[

  #note-box[
    Husk:

    $
    iprod(A x, y) = iprod(x, A^star y)
    $
  ]

$lambda_1 eq.not lambda_2 => E_(lambda_1) perp E_(lambda_2)$

Bevis 
$
bold(A) arrow(v_1) = lambda_1 arrow(v_1)\
bold(A) arrow(v_2) = lambda_2 arrow(v_2)
$

Skal vise $arrow(v_1) perp arrow(v_2), quad iprod(arrow(v_1), arrow(v_2)) = 0$

$
lambda_1 iprod(arrow(v_1), arrow(v_2)) = iprod(lambda_1 arrow(v_1), arrow(v_2)) = iprod(bold(A) arrow(v_1), arrow(v_2))\
= iprod(arrow(v_1), bold(A) arrow(v_2)) = iprod(arrow(v_1), lambda_2 arrow(v_2))\
= lambda_2 iprod(arrow(v_1), arrow(v_2))\
$
$
lambda_1 iprod(arrow(v_1), arrow(v_2)) - lambda_2 iprod(arrow(v_1), arrow(v_2)) = 0\
underbrace((lambda_1 - lambda_2),eq.not 0) underbrace(iprod(arrow(v_1), arrow(v_2)), = 0) = 0
$

]


#theorem(title: "Speltralsætningen")[
  #set enum(numbering: "(i)")

  Lad $A in M_n (RR)$ så er følgende ækvivalent:


  1. $A$ er reel symmetrsik 
  2. $A$ er reel ortogonal diagonliserbar $ Q^TT A Q = Lambda <=> A = Q Lambda Q^TT  $
  3. $RR^n$ har en ONB af egenvektorer for $A$
]


#example[
  Givet $bold(A)$ reel symmetrisk (normal) Find den speltrale dekompisensation af $A = Q Lambda Q^TT$

  1. Find alle egenværdier af $A$ som rødder i det karakteristiske polynomium $det(I - lambda A)= 0 $ 

  $
  Lambda &= dmat(1,2,2,2,4, delim: "[") ("am"(2) = 3) \ 
  Lambda &= dmat(ll_1, ll_2, dots.down, ll_n, delim: "[")
  $


  2a. Hvis $"am"(ll_i) = 1$, normaliser egenvektoren 

  2b. Hvis $"am"(ll_i) > 1$, brug Gramm-Schmidt på dens egenvektorer i $E_(ll_i)$ 

  3. Opstil egenvektorerene (fra 2) i $vb(Q)$


  $
  vb(Q) = vecrow(q_1, q_2, q_n) quad vb(U) = vecrow(u_1, dots.c, u_n)
  $
]




#example(title: "2.8.6")[
Find minimum af funktionen $q: RR^2 arrow RR$
$
q(x_1,x_2) &= x_1^2 - 2 x_1 x_2 + x_2^2 + x_1-x_2 + 2\
&=underbrace(mat(x_1,x_2),1 times 2) underbrace(bold(A), 2 times 2) underbrace(vec(x_1,x_2), 2 times 1) + underbrace(mat(x_1,x_2),1 times 2) underbrace(va(b),2 times 1) + underbrace(c, 1 times 1)
$
Finde $bold(A)$
$
bold(A) = 1/2 underbrace(bold(H)_q, "Hessematricen") = 1/2 mat(2,-2;-2,2) = mat(1,-1;-1,1)\
$
Bemærk $bold(A)$ er reel symmetrisk $bold(A) = bold(Q) bold(Lambda) bold(Q)^T$

$va$ må være $vec(1,-1)$ da $mat(x_1,x_2) va(b) = x_1 - x_2$

*Finde egenværdierne:*
$
0 = "det" mat(1-lambda,-1;-1,1-lambda) = (1-lambda)^2 - (-1)^2 <=>\
(1-lambda)^2 = 1\
lambda = cases(0,2), quad lambda_1 = 0, lambda_2 = 2
$

*Finde egenvektor for $lambda_1$:*
$
mat(1,-1,0;-1,1,0; augment: #(-1)) arrow mat(1,-1,0;0,0,0; augment: #(-1))\
x_1 = x_2 = t in RR\
$
$
va(v_1) = vec(x_1,x_2) = vec(t,t) = t vec(1,1), quad t in RR\
E_(lambda_1 = 0) = "span"(vec(1,1))\
norm(va(v_1)) = sqrt(1^2+1^2) = sqrt(2)\
$
$
va(q_1) = 1/sqrt(2) = vec(1/sqrt(2),1/sqrt(2))
$

*Finde egenvektor for $lambda_2$:*
$
bold(A) va(v_2) = 2 va(v_2)\
(bold(A) - 2 bold(I)) va(v_2) = va(0)\
mat(-1,-1,0;-1,-1,0;augment: #(-1)) arrow.squiggly mat(-1,-1,0;0,0,0;augment: #(-1))
$
$
-x_1 - x_2 = 0, quad x_1 = -x_2, quad x_2 = t in RR
$
$
va(v_2) = vec(x_1,x_2) = vec(-t,t) = t vec(-1,1)\
va(q_2) = vec(-1/sqrt(2),1/sqrt(2))
$

Lav kontrol: $q_1 perp q_2$

$
vb(A) = vb(Q) vb(Lambda) vb(Q)^TT 
$

Hvor:

$
vb(Q) &= amat(vb(M), e, beta) \ 
vb(Q)^TT &= amat(vb(M), beta, e)
$

Hvor $beta = q_1, q_2$ 

Vi ved at en vektor er $va(x) = (x_1, x_2) $ men vi kan også skrive det som 

$
amat(va(x), e, ,) = vec(x_1, x_2) quad amat(va(x), beta, ,) = vec(tilde(x_1), tilde(x_2)) = limits(vb(M))_(beta = e )  amat(va(x), e, ,) = vb(Q)^T amat(va(x), e, ,)
$

Vi kan nu skrive vores tilde koordinater ind i $bold(q)$ 

$
vb(q) &= (tilde(x)_1, tilde(x)_2) = amat(va(x)^TT, beta,,) vb(Q)^TT vb(A) vb(Q) amat(va(x), beta,,)  + amat(va(x), beta,,) vb(Q)^TT va(b) + c \ 

&= amat(va(x)^TT,beta,, ) vb(Lambda)  amat(va(x),beta,, ) + amat(x^TT,beta,, ) vb(Q)^TT va(b) + c \ 

$

]



= Opgaver

== Typer af matricer 

Betragt matricerne: 

$
A = dmat(1,2,3, fill: 0), B = mat(1, 2, 3; 3,1,2;2,3,1), C = mat(1, 2+i, 3i; 2-i, 1, 2; -3 i ,2 ,1 ), D = mat(i, 2, 3; 2, i, 2; 3, 2, i)
$

Afgør for hver matrix om den er symmetrisk, hermitisk, og/eller normal.

#solution[
  $A in RR^(3times 3 )$


  Symmetrisk hvis $A = A^TT$, siden $A$ er en $n times n$ matrice og reel er den symmetrisk. Siden den er både reel og symmetrisk er den også hermitisk og normal.



]

#solution[

  $B$ er reel. Dermed er den også normal.


  Vi ser om den er symmetrisk ved:

  $
  B^TT = mat(1, 3, 2; 2,1,3; 3,2,1) 
  $

  Som vi kan se så er $B != B^TT$ Så dermed er matricen ikke symmetrisk. Matricen er dermed reel og normal. 

]


#solution[
  Vi kan se, at $C in CC^(3 times 3)$


  $
  C^* = mat(1, 2+i, 3 i; 2 - i, 1, 2; -3i, 2, 1)
  $

  Vi kan se at $C = C^*$. Hvilket vil sige at den er hermitisk og normal. Men ikke symmetrisk.
]

#solution[
  Vi ser om $D$ er hermitisk 


  $
  D^star = mat(-i,2 ,3;2,-i,2; 3,2,-1)
  $

  Vi kan se, at $D$ ikke er reel i diagonalen, og dermed ikke er hermitisk. Men den der dog normal.
]

== Hermitisk 2-gange-2 matrix 

$
 A=  mat(0, i; -i, 0)
$
