#import "@local/dtu-template:0.6.3":*

#show: dtu-physics-note.with(
  course: "10060",
  course-name: "Fysik (Polyteknisk grundlag)",
  title: "Lecture - February 23, 2026",
  date: datetime(year: 2026, month: 2, day: 23),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)

= Experiments

== Naturlige skalaer

$
mu &= m quad ("masse") \ 
lambda &= l quad ("længde") \
tau &= sqrt(l slash g ) quad ("tidsdimension")

$

== Sammenligning af to målinger

Vi definerer en standard score der måler hvor mange usikkerheder man er væk fra den værdi der optrder i hypotesen: 

$
"std"_"score" = (g_"measured"-g)/(par g_"measured")
$
Elller 

$
"std"_"score" &= abs(z)/(par z) \
z &= x -y  \ 
par z &= sqrt(par x ^2 + par y ^2 )
$


Hvor 

$
"std"_"score" &< 2 "Good" \ 
2 < "std"_"score" &<3 "Grey zone" \ 
3 &< "std"_"score" "reject"
$


#example[
  Hvordan bestemmer man tyngdeaccelerationen?

  Vi har problemet:

  $
  g = f(t,h)
  $

  Hvad er de naturlige skalaer?

  #solution[
  $
  t &= "tid" = tau  \ 
  h &= "længde" = lambda
  $



 ]


  Hvordan omformuleres problemet, så vi kan finde $F$?

  #solution[
$
g/(lambda/tau^2) &= f (t/tau, h/lambda) = f(1,1) = k \ 
g/(h/t^2) &= k <=> g = k dot h/t^2 
$
  ]

]

== Regressionsanalyse

Givet måledata $(x_1, y_2),(x_2, y_2), dots, (x_n, y_n)$. det antages at usikkerheden på $x$ værdien kan negliceres. $y$ usikkerhederne antages ens. 

$
y &= A + B x \ 
A &= (sum x^2 sum y - sum x sum x y)/(N sum x^2 - (sum x)^2) \ 
B &= (N sum x y - sum x sum y)/(N sum x^2 - (sum x)^2) \ 
par y &= sqrt( 1/(N-2) dot sum^N_(i=1) (y_i - A - B x_i)^2  ) \ 
par A &= par y sqrt((sum x^2)/(N sum x^2 - (sum x)^2)  ) \ 
par B &= par y sqrt(N/(N sum x^2 - (sum x)^2))
$


#example[
  Modellem vi ønsker at bestemme er 

  $
  v_2 = f(v_1, a ,x)
  $

  #solution[
    $
    lambda &= x \ 
    tau &= x/v_1 = m/(m/s) = s    \ 
    $
  ]

  Hvordan omformuleres problemet, så vi kan finde $F$

  #solution[

$
v_2/(lambda/tau) &= f(v_1/(lambda/tau), a/(lambda/tau^2), x/lambda) \ 
v_2/(x/(x/v_1)) &= underbrace(v_2/v_1, pi_1) = f(v_1/v_1, (a dot x)/v_1, x/x) = F (underbrace((a dot x)/v_1, pi_2)) 
$

  ]
]

== Dimensions matricen

#example[

  Vi betragter en model af faldtiden for et legeme der påvirkes af luftmodstand. 

  $
  t = f(m,g,h,k)
  $

  $t$ er faldtiden, $m$ er massen, $g$ er tyngdeaccelerationen, $h$ er højden og $k$ er en luftmodstandkoefficient. Luftmodstand antages at have størrelse $F = k v$.

  $
  [k] = [F]/[v] = (M L T^(-2))/(L T^(-1)) = M T^(-1)
  $

Dimensionsmatricen viser eksponenter for dimensionen af grundenhederne for de fysiske størrelser. Denne matrix viser sig at være meget brugbar når vi skal finde karakteristiske størrelser for system

$
mat(delim: #none,, m, g, h, k; M, 1, 0 ,0 , 1; L, 0, 1, 1, 0; T, 0, -2, 0, -1)
$
]

