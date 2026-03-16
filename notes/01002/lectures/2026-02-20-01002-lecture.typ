#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": * 

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - February 20, 2026",
  date: datetime(year: 2026, month: 2, day: 20),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)

$
V=RR^3\
bold(V) = mat(arrow(v_1), arrow(v_2), arrow(v_3)) = mat(1,-2,-1;2,4,-1;2,0,3)
$

$"rang"(bold(V))=3$ eller $"rref"(bold(V)=mat(1,0,0;0,1,0;0,0,1))$

Så er $alpha = arrow(v_1),arrow(v_2),arrow(v_3)$ lineært uafhængig i $RR^3$ og derfor en basis.

*Anvender Gram-Schmidt på $alpha$:*
$
beta = arrow(u_1), arrow(u_2), arrow(u_3)
$
Der er en ortogonal basis for $RR^3$
$
bold(U)=mat(1/3,-2/3,-2/3;2/3,2/3,-1/3;2/3,-1/3,2/3)
$
Dvs. den opfylder:
$
iprod(arrow(u_i),arrow(u_j)) = cases(1 quad i=j quad "norm"=1,0 quad i eq.not j quad arrow(u_i) perp arrow(u_j))
$

$
bold(U)^* dot bold(U) &= mat(1/3,-2/3,-2/3;2/3,2/3,-1/3;2/3,-1/3,2/3) mat(1/3,-2/3,-2/3;2/3,2/3,-1/3;2/3,-1/3,2/3)\
&= mat(1,0,0;0,1,0;0,0,1)
$
*Hvad udregner vi egentligt?*
$
bold(U)^* bold(U) &= mat(-,arrow(u_1^*),-;-, arrow(u_2^*),-;-, arrow(u_3^*),-) dot mat(arrow(u_1), arrow(u_2), arrow(u_3))\
&= mat(arrow(u_1^*) arrow(u_1), arrow(u_1^*) arrow(u_2), arrow(u_1^*) arrow(u_3);arrow(u_2^*) arrow(u_1), arrow(u_2^*) arrow(u_2), arrow(u_2^*) arrow(u_3); arrow(u_3^*) arrow(u_1), arrow(u_3^*) arrow(u_2), arrow(u_3^*) arrow(u_3)) = mat(iprod(arrow(u_1), arrow(u_1)), iprod(arrow(u_2), arrow(u_1)), iprod(arrow(u_2), arrow(u_1)); iprod(arrow(u_1), arrow(u_2)), iprod(arrow(u_2), arrow(u_2)), iprod(arrow(u_3), arrow(u_2)); iprod(arrow(u_1), arrow(u_3)), iprod(arrow(u_2), arrow(u_3)), iprod(arrow(u_3), arrow(u_3)))
$

*Hvad er $bold(U)^(-1)$?*

Må være $bold(U)^*$ da hvis $bold(A) dot bold(B) = bold(I) => bold(A)^(-1) = bold(B)$


Lad $arrow(x)=vec(x_1,x_2,x_3)=vec(1,2,3)$
$
[arrow(x)]_alpha = attach(arrow(x), bl: alpha) = vec(a_1,a_2,a_3) "dvs"\
arrow(x)=sum_(k=1)^3 a_k arrow(v)_k = a_1 arrow(v_1) + a_2 arrow(v_2) + a_3 arrow(v_3)
$
Finde $a_k$:
$
arrow(x) &= a_1 vec(1,2,2) + a_2 vec(-2,4,0) + a_3 vec(-1,-1,3)\
&= mat(1,-2,-1;2,4,-1;2,0,3) vec(a_1,a_2,a_3)
$
$
vec(1,2,3) = arrow(x) = bold(V) vec(a_1,a_2,a_3)\
vec(a_1,a_2,a_3) = bold(V)^(-1) vec(1,2,3)\
mat(,,,1;,bold(V),,2;,,,3) arrow.squiggly "Gauss elim"
$
$
attach(arrow(x),bl: beta) &= vec(c_1,c_2,c_3) quad arrow(x) = sum_(k=1)^n c_k arrow(u_k) \
vec(c_1,c_2,c_3) &= bold(U)^(-1) arrow(x) ="(unitær)" bold(U)^* arrow(x)\
&= mat(1/3,2/3,2/3;2/3, dots;dots) vec(1,2,3)\
&=vec(1 dot 1/3 + 2 dot 2/3 + 3 dot 2/3,dots,dots) = vec(11/3,2,)
$

$
attach(arrow(x), bl: e) = arrow(x) = bold(V) attach(arrow(x), bl: alpha)\
attach(arrow(x), bl: alpha) = vec(a_1,a_2,a_3) quad attach(arrow(x), bl: e) = vec(x_1,x_2,x_3)
arrow(x) = x_1 vec(1,0,0) + x_2 vec(0,1,0) + x_3 vec(0,0,1)\
e = vec(1,0,0), vec(0,1,0), vec(0,0,1)
$
Basissikftematrix fra $alpha$ til $e$ koordinater: $bold(V)^(-1) = amat(bold(M), alpha, e)$

$
attach(arrow(x), bl: beta) = bold(U)^* attach(arrow(x), bl: e)\
bold(U)^* = amat(bold(M), beta, e), bold(U)^* = amat(bold(M), e, beta)\
attach(arrow(x), bl: e) = bold(U) attach(arrow(x), bl: beta)
$

$
bold(U) bold(U)^* = bold(I), quad bold(I) arrow(x) = arrow(x)
$

$
arrow(x) = bold(U) bold(U)^* arrow(x) = sum_(k=1)^n iprod(arrow(x_k), u_k) u_k
$


#definition(title: "2.6.1")[
En kvadratisk matrix $bold(U) in M_(n times n) (CC)$ kaldes _unitær_ hvis $bold(U)^* dot bold(U) = bold(I)$

Den kaldes _reel ortogonal_ hvis $bold(U)^T bold(U) = bold(I)$
]

== Ortogonale komponenter
Lad $Y subset.eq V$. Det ortogonale komplement:
$
Y^perp = {arrow(v) i n V : iprod(arrow(v), arrow(y)) = 0 "for alle" arrow(y) in Y}
$

#example()[
Lad $Y = "span"(arrow(v_1), arrow(v_2)) = "span"(arrow(u_1), arrow(u_2))$. Bemærk $"dim"(Y) = 2, "dim"(Y^perp) = 1$
$
Y^perp = "span"(arrow(u_3))
$
$
<=> &arrow(v_1)^* arrow(x) = 0\
&arrow(v_2)^* arrow(x) = 0
$
$
mat(1,2,2)
$
]

#definition()[
$
arrow(x) in Y^perp <=> &iprod(arrow(x), arrow(v_1)) = 0\
&iprod(arrow(x), arrow(v_2)) = 0
$

]
