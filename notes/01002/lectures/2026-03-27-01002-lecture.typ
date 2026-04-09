#import "@local/dtu-template:0.6.3":*
#import "@local/cetz:0.4.2": canvas, draw
#import "@preview/physica:0.9.8": *


#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - March 27, 2026",
  date: datetime(year: 2026, month: 3, day: 27),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)
#show math.phi: math.phi.alt

#let integrate(func, args, bounds) = {
  let idx = 0 
  
  for arg in args {
    let lower
    let upper 

      lower  = bounds.at(idx)
      upper =  bounds.at(idx+1)



    
 $integral_(#lower)^#upper $ 
   idx = idx + 2
 } 

 $#func.at(0) quad$
   
 for arg in args {
   $upright(d) #arg space.hair$
 }
}

= Integration i $RR^n$

Hvad er massen af // Insert kugle


$
f(x,y,z) &= 1 "kg"/"m"^3 \ 
f(x,y,z) &= A - B frac(x^2 + y^2 + z^2, R^2)
$

Hvad er massemidtpunktet?

#math-hint()[
  Volumen af en kugle er $ V = 4/3 pi R^3 $
]


Vi kan bruge transformationssætnings (thm. 6.6.2)


#theorem(title: "6.6.2")[

  Lad $Gamma$ være et begrænset område i $RR^n (Gamma = [a_1, b_1] times [a_2, b_2] times dots.c times [a_n, b_n])$ med "pæn rand". Lad $va(r): Gamma -> RR^n$ være en stykkevis $C^1$ vektor-funktion. 


  $
  integrate(f(va(r)(va(u))) dot abs(det J_va(r) (va(u)) ); va(u); Gamma,,,) &=

  $


  Hvor 

  - $f: B -> RR$ er kontinuert 
  - $va(r)$ er injektiv på $Gamma^circle$ 
  - $det J_va(r) (va(u)) != 0 $ for alle $va(u) in Gamma^circle$
  - $"areal"(B) = integrate(1; x,y; B,,,,), n = 2$  
  - $"vol"(B) = integrate(1; x,y,z; B,,,,,,) , n = 2$
]


#example[
  $f(x,y,z) = x^2, x in [0,1], y in [0,2], z in [0,3] $

  $
  B = [0,1] times [0,2] times [0,3]
  $


  $
  integrate(f(x); x; B,,) &= integrate(x^2; x,y,z; 0,3,0,2,0,1)
  $


  Først parametisere vi $B = va(r)(Gamma)$ 

  Så finder vi $J_va(r)(u_1, u_2, u_3)$ og ser om $va(r)$ er injektiv på $Gamma^circle$ og $det J_va(r)(va(u)) != 0$ på $Gamma^0$


  Så udregner vi 

  $
  integrate(f(r(u)) abs(det J_r (u) ); u; Gamma,,  )
  $


  $
  Q = Set(u + h, 0 <= h <= Delta x ) 
  $

  $
  va(r)(va(u) + va(h)) &= va(r) (u) + J_r (va(u)) dot h + epsilon(h) norm(h) \ 
  r(Q) &approx r(u) + underbrace(J_r (u), = A) dot  [0, Delta x]^h
  $


  Så $"vol"(A - [1,1]^h)) = abs(det A)$ // Opgave 2 


  Med polære koordinater har vi at 

  #canvas({

    import draw: * 


   line((-1.5, 0), (1.5, 0), name: "x")
   line((0, -1.5), (0, 1.5), name: "y")


   mark("x.end", 0deg, symbol: ">", fill: black )
  })


  $
  det J_rho (r, theta) = r
  $
  

]


#example[
  $
  B &= Set((x,y,z) in RR^3, x^2 + y^2 + z^2 <= a^2 and  z >= 0  ) \ 
  (r, theta, phi) &in underbrace([0,a] times [0, pi/2] times [0, 2 pi], Gamma)
  $



  $
  "vol"(B) &= integral_B 1 dd(x,y,z) = integrate(1 dot r^2 sin theta; phi, theta, r; 0, a, 0, pi/2, 0, 2pi)  \ 
  &= 2 pi integral_0^a r^2 integral_0^(pi/2) sin theta  dd(theta, r) \ 
  &= 2 pi [1/3]^(r=a)_(r=0) = 2 pi 1/3 a^3 = 2/3 pi a^3 \ 

  f(x,y,z) &= 1 \ 
  M &= "vol"(B) = 4/3 pi a^3
  $



Man kan finde massemidtpunktet ved at udregne integralet 


$
va(x)^(c m)  = 1/M integral va(x) dot f(va(x)) dd(va(x)), space va(x) &= vec(x,y,z)
$

$
x^(c m) &= 1/M integral_B x  f(x,y,z) dd(va(x)) = 0 \ 
y^(c m) &= 1/M integral_B y f (x,y,z) dd(va(x))  = 0\ 
z^(c m) &= 1/M integral_B z f(x,y,z) dd(va(x))

$



Vi udregner $z^(c m)$


$
integral_B z dd(x,y,z) &=   integrate(z dot r^2 dot sin theta; phi, theta, r; 0,a, 0, pi/2, 0, 2pi) \ 
&= integral_0^a r^3 integral_0^(pi/2) sin theta cos theta integral_0^(2pi) 1 dd(phi.alt, theta, r) \ 
&= ( pi )/ 4 a^4 \ 
z^(c m) &= frac(( pi)/4  a^4, (2 pi)/3 a^3   ) = frac( 1/4, 2/3) = frac(1/4, 2/3) = frac(3,8)
$
]


$
jmat(1/2 u^2 - v^2, - u dot v, w; u,v,w)
$

$
mat(u, -v, 0; -2v, -u, 0; 0,0,1)
$
