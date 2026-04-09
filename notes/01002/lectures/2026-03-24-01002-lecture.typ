#import "@local/dtu-template:0.6.3":*
#import "@preview/cetz:0.4.2": draw, canvas
#import "@preview/physica:0.9.8": *

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - March 24, 2026",
  date: datetime(year: 2026, month: 3, day: 24),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)

= Integration over vilkårlige områder i 2D 


Lad $f : B -> RR$, $B subset.eq RR^2$, funktionen er kontinuert og dermed Riemann integrabel. Lad $B$ være begrænset med "pæn" rand $par B$


#note-box[
  $partial B$ er at den er stykkevis differentiabel i $CC^1$
]


Riemann integralet var defineret af funktionen $f$ over B, var defineret ved 


$
integral_B f(x,y) dd(x,y) <==> integral_B f(x,y) dd(X) <==> integral_B f(va(x)) dd(va(x))
$

hvilket er en "grænse-værdi" af Riemann-summer:

$
sum^J_(j=1) sum^J_(i=1) f(xi_(i,j) dots) Delta x_i Delta y_j
$

Som en hovedregel ignorere vi alle de "firkanter" der rammer randen. Vi skal forestille os at vi tager mindre og mindre stykker af vores graf og lægger dem sammen hvis de ikke ligger på randen.

#let tile = tiling(size: (20pt, 20pt), {
  set line(stroke: gray)

  place(line(start: (0%, 100%), end: (100%, 0%)))
  place(line(start: (50%, 150%), end: (150%, 50%)))
  place(line(start: (-50%, 50%), end: (50%, -50%)))
})

#example[
  $
  B= [0,3] times [-2,0]
  $

  #figure(
canvas(background: white, {
    import draw: *

    line((-0.5, 0), (4, 0), mark: (symbol: ">") )
    line(( 0, -2.5), (0, 0.5), mark: (symbol: ">") )

    rect((0,0), (3,-2), fill: tile  )
    circle((rel: (-1.5,1)), radius: (0.75) , fill: white, stroke: none, name: "c")
    content("c.center", $B$ )

  })
  )



  $
  f(x,y) = 1, (x,y) in B
  $


  $
  integral_B f(x,y) dd(x,y) &= integral_0^3 integral_(-2)^0 1 dd(y,x) \ 
  &= integral_0^3 [y]_(y = -2)^(y=0)  dd(x) = integral_0^3 (0- (-2)) \ 
  &= integral_0^3 2 dd(x) = [2x ]^(x=3)_(x=0) \ 
  &= 2 dot 3 - 2 dot 0 = 6 
  $

  Hvilket svare til arealet

]


#example[
  $
    B = {(x,y) in RR^2 divides -x <= y <= x^2 and 0<= x <= 1 }
  $

  $
  f(x,y) &= x y, (x,y) in B
  $

  $
  integral_B f(x,y) dd(x,y) &= integral_0^1 integral_(alpha_1(x) = -x )^(alpha_2(x)=x^2) f(x,y) dd(y,x) \ 
  &= integral_0^1 [1/2 x y^2]^(y=x^2)_(y=-x) dd(x) = integral_0^1 [1/2 x (x^2)^2 - 1/2 x (-x)^2] dd(x) \ 
  &= 1/2 integral_0^1  x^5 - x^3 dd(x) =1/2 [1/6 x^6 - 1/4  x^4]_(x=0)^(y=1)  \ 
  &=  1/2 ((1/6 dot 1^6 - 1/4 1^4) - (1/6 o^6 - 1/4 0^4)  ) = 1/2 (1/6 - 1/4) \ 
  &= 1/2 (4/24 - 6/24) \ 
  &= 1/2 (- 2/24) \ 
  &= - 1/24
  $
]


== Parametiseringer 

#definition(title: "6.4.1")[
lad $va(r) : Gamma -> RR^2$, $Gamma subset.eq RR^2$, være en $CC^1$-funktion på $Gamma^circle$ 

$
va(r)(u,v) = vec(r_1(u,v), r_2(u,v))
$


$
Gamma &= [a_1, b_1] times [a_2, b_2] \ 
Gamma^circle = ]a_1 b_1 [ times ]a_2, b_2 [ 
$

For at regne jacobi determinanten skal vi bruge jacobi determinanten 


$
J_va(r) (u,v) &= jmat(r_1, r_2; u,v) 
$

Og jacobi determinanten defineret ved 


$
det J_va(r) (u,v) &= pdv(r_1, u) dot pdv(r_2, v) - pdv(r_2, u) dot pdv(r_1, v)
$

$
va(r) (u,v) &= (u cos(v), u sin(v) ) \ 
B &= im(va(r)) = va(r)(Gamma)
$

Så vi har 


$
B &= { (x,y) in RR^2 divides 1/2 <= sqrt(x^2 + y^2) <= 2 and 45degree <= theta <= 90degree} \ 
(u,v) &= underbrace([pi/4, pi/2 ] times [pi/4, pi/2] ,Gamma)
$

Vi beregner nu Jacobideterminanten som er en areal korigerende faktor for polære koordinater. 

#note-box[
  $Gamma$ er altså en integral som man _kan_ regne, og så laver vi en afbildning til $B$ og bruger jacobi-determinanten til at korrigere så den passer.
]

$
J_va(r) (u,v) &= mat(cos(v), - u sin(v); sin(v), u cos(v)  )
det J_va(r) = (cos(v))^2 dot u -(- (sin(v)^2 u) \ 
&= u dot cos^2 (v) + u sin^2(v) = u 
$

#note-box[
  jacobi matricen af polære koordinater kaldes $J_va(p)  $
]

]

#theorem(title: "6.4.1")[
  Lad $Gamma subset.eq RR^2$ være begrænset med pæn rand (oftest $Gamma = [a_1, b_1] times [a_2, b_2]$) 

  $va(r): Gamma -> RR^2$ være en $C^1$-funktion så 

  - $va(r)$ er injektiv på $Gamma^circle$  hvor $B = im(va(r)) = va(r)(Gamma) $
  - $va(r)$ er regulær dvs $det J_va(r) (u,v) != 0$

  For $(u,v) in Gamma^circle$


  $
  (u,v) in Gamma^circle &= integral_(a_1)^b_1 integral_(a_2)^b_2 f(r_1(u,v), r_2 (u,v ) abs(det J_va(r) (u,v)  )dd(v,u) 
  $

]


#example[
  $
  va(r) = [0,1] times [0,1] 
  $


  $
  va(r) &= (u,v) = vec(3u, -2v)
  $

  Vi er interesseret i at finde så 

  $
  B = im(va(r)) = Set(va(r) (u,v), (u,v) in Gamma) 
  $

  Vi finder jacobimatricen for $va(r)$

  $
  J_va(r) (u,v) &= mat(3, 0; 0, -2) \ 
  det J_va(r) &= -6
  $


  Vi smider den ind i sætning 6.4.1


  $
  integral_B 1 d(x,y) \ 
  &= integral_0^1 integral_0^1 1 abs(-6) dd(v,u) \ 
  &= 6 dot integral_0^1 integral_0^1 1 dd(v,u) \ 
  &= 6 "areal"(Gamma) = 6 dot 1 = 6 
  $

  Vi antager at 
  $
  va(r)(u_1, v_1) &= va(r) (u_2, v_2)  "Vis at " u_1 = u_2, v_1 = v_2 \ 
  &= vec(3 u_1, -2 v_1) = vec(3 u_2, -2 v_1) \ 
  &=> cases(3 u_1 &= 3 u_2, -2v_1 &= -2v_2, delim: #none) => cases(u_1 &= u_2, v_1 &= v_2, delim: #none)
  $ 
]


#example[


  #canvas({
    import draw: *
    line((0,1), (1,2)   )
  })

  $z_0, z in RR^n $


]

