#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": * 
#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - March 13, 2026",
  date: datetime(year: 2026, month: 3, day: 13),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)

#show: super-T-as-transpose
#let vecrow = vecrow.with(delim: "[")
#let dmat = dmat.with(delim: "[")
#let dm = math.op("dm")

= Minima og Maxima i Enkelt Punkt

$
f: U -> RR quad  U subset.eq RR^n, f "glat" 
$

For at der skal være en lokal max/min $x_0$, skal der være en nødvendig betingelse. 

$
grad f(va(x_0)) = va(0)
$

$va(x_0)$ kaldes stationære punkter (s.p.) 


== Lokalt Maximum af Funktion

$f$ har lokalt maximum i $va(x_0)$, hvis der findes en kugle $B(va(x_0), epsilon)$, så hvis $x in B(va(x_0), epsilon)$ så gælder, $f(va(x)) <= f(va(x_0))$

#note-box[
  $ B(va(x_0), epsilon) =>  norm(va(x_0) - va(x)) < epsilon $
]

Det er et egentligt lokalt maximum hvis $f(va(x)) < f(va(x_0))$. 


== Lokalt Minimum af Funktion 


$f$ har lokalt minimum i $va(x_0)$ hvis. 

$
exists B (va(x_0), epsilon) forall x in B(va(x_0), epsilon) in  f(va(x)) >= f(va(x_0))
$

Tilsvarende er et egentligt lokalt minimum hvis $ f(va(x)) > f(va(x_0))$

= Stationære Punkter 

vi antager at $grad f (va(x_0)) = 0$. Så er taylor approksmationen præcis det samme som gradient


$
f(va(x)) &= f(va(x_0)) + (grad f(va(x_0)))^TT dot (va(x) - va(x_0)) + 1/2 (va(x) - va(x_0))^TT dot vb(H)_f (va(x) - va(x_0)) + epsilon_f (va(x) - va(x_0)) dot norm(va(x) - va(x_0))^2 
$

Vi kan omskrive denne funktion 

#let x= $va(x)$
#let x_0 = $va(x_0)$

Vi definere først en funktion $h$

$
va(h) &= #x - #x_0 \ 
$

Ifølge spektralsætningen så hvis $vb(Q)$ er ortogonal og $Lambda$ er diagnonal så er $vb(H)_f = vb(Q)^TT dot vb(Lambda) dot vb(Q)$


#let hv = $va(h)$
#let Qm = $vb(Q)$
#let Lm = $vb(Lambda)$

$
f(#x) - f(#x_0) &= 1/2 underbrace(#hv^TT #Qm^TT, (#Qm #hv)^TT) #Lm #Qm #hv + epsilon_f (#hv) norm(#hv)^2
$

Vi definere en nu funktion $tilde(va(h))$


#let hti = $tilde(va(h))$

$
f(#x) - f(#x_0) &= 1/2 #hti dmat(lambda_1, lambda_2,dots.down, lambda_n) #hti + epsilon_f (#Qm^TT #hti) \ 
&= 1/2 (sum_(k=1)^n lambda_k #hti _k^2) + tilde(epsilon)_f (#hti ) norm(#hti)^2
$


1. Vi antager at alle $lambda_i > 0$, $i in {1, dots, n}$, vi finder en minimum $lambda = min(lambda_1, dots, lambda_n)$, så tager vi $lambda$ og sætter ind på alle lambderes plads i ligning $8.$:

$
f(#x) - f(#x_0) &> 1/2 lambda (sum_(k=1)^n #hti^2_k  ) + tilde(epsilon)_f (#hti ) norm(#hti)^2  \ 
&= 1/2 lambda(#hti _1^2, dots, #hti _n^2 ) + tilde(epsilon)_f (#hti )  norm(#hti)^2 \ 
&= (1/2 lambda + tilde(epsilon)_f (#hti)) norm(#hti)^2 > 0 in B(#x_0, epsilon) \ 
&==> f(#x) - f(#x_0) > 0 <==> f(#x) > f(#x_0)
$

Egentligt lokalt i minimum $#x_0$


2. Vi prøver nu at finde et $lambda = max(lambda_1, dots, lambda_n)$


$
f(#x) - f(#x_0) &= 1/2 (sum^n_(k=1) lambda_k dot #hti _k^2) + tilde(epsilon)_f (#hti ) dot norm(#hti)^2
\ &<= 1/2 lambda(sum^n_(k=1) #hti _k^2) + tilde(epsilon)_f (#hti) dot norm(#hti)^2 \ 
&= (1/2 lambda + tilde(epsilon)_f (#hti) ) norm(#hti)^2 < 0 "for" x in B(#x_0, epsilon) \ &==> f(#x) - f(#x_0) < 0 <==> f(#x) < f(#x_0)
$

Er et egentlig max.

3. Men hvad nu hvis der findes mindst 2 egenværdier med forskellige fortegn. Så er der et saddelpunkt. 


4. Hvis mindst en egenværdi er nul, og resten har samme fortegn, så kan vi intet sige.



#example[
  $ f(x,y) = -(x-1)^2 + y^3 - 3/2 y^2 $

  Vi finder alle lokale ekstrema og afgør arten. (Lokalt maximum, saddelpunkt)

  Funktionen er glat, altså ugentligt differentiabelt indtil 4. orden.

  Vi finder nu s.p: 

  $
  pdv(f,x) = - 2 (x-1) &= 0 \
  pdv(f,y) = 3y^2 - 3y = 3y (y-1) &= 0 
  $


  Så vi har rødderne $x = 1, y = 1 or y = 0 $. Så vores s.p. er $(1,0), (1,1)$

  Vi finder nu hessematricen:

  $
  vb(H) (x,y) = mat(pdv(f,x,2), pdv(f,x,y,); pdv(f,x,y), pdv(f, y, 2)  ) &= mat(-2, 0; 0, 6y - 3) \ 
  vb(H)_f (1,0) &= mat(-2, 0; 0, -3), lambda_1 &= -2, lambda_2 &= -3  "egentlig lokal max" \ 
  vb(H)_f (1,1) &= mat(-2, 0; 0, 3) 
  $

  Saddelpunkt da $lambda_1 = -2, lambda_2 = 3$.
]
