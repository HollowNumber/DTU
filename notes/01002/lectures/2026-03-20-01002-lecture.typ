#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": * 

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - March 20, 2026",
  date: datetime(year: 2026, month: 3, day: 20),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)

= Integrationsteknikker

== Stamfunktioner

#definition(title: "6.2.1")[

  Betragt  $f : I -> RR, I: "interval i" RR$

  $
  F: I -> RR 
  $

  Kaldes en stamfunktion hvis den kan opfylde to ting:

  1.  Den skal være differentiabel 
  2. $F'(x) = f(x)$


  $
  F(x) = integral f(x) dd(x) = integral_(x_0)^x f(x) dd(x)  
  $
]

Diff kvotienter 


$
(x^alpha)' &= alpha x^(alpha-1), (x != 0 "hvis"  alpha < 0) \ 
(ln x)' &= 1/x, x > 0,  \ 
(e^( alpha x ))' &= alpha e^(alpha x) \
(sin x)' &= cos x
$

Produktreglen: 

$
(f(x) dot g(x))' &= f'(x) dot g(x) + f(x) dot g'(x)
$

Produktreglen af stamfunktioner 


$
(F(x) dot g(x))' &= f(x) g(x) + F(x) g'(x) \ 
F(x) g(x) &= integral f(x) g(x) dd(x)  + integral  F(x) g'(x) dd(x) \ 
integral_a^b f(x) g(x) dd(x) &= [F(x) g(x)]_a^b - integral_a^b F(x) g'(x) dd(x)  "partielle integration"
$


#example[
  $
  (x dot sin x)' &= 1 dot sin x + x dot cos x \ 
  &= sin x + x dot cos x
  $
]


=== Standard stamfunktioner 


$
integral alpha x^(alpha-1) dd(x) &= x^alpha   \ 
integral 1/x dd(x) &= ln(x)  \ 
integral e^(alpha x) dd(x) &=  1/alpha e^(alpha x) \ 
integral x cos x dd(x) &= x dot sin x - integral sin x dd(x) =x dot sin x + cos x  \ 
integral x^n dd(x) &= 1/(n+1) x^(n+1)   \ 
integral 1/(sqrt(1-x^2)) dd(x) &= arcsin x, -1 < x < 1
$

#example[
find  $
    integral x e^(3 x) dd(x)
  $

  $
  g(x) &= x, f(x) = e^(3 x)
  $


  Så 

  $
  g'(x) &= 1, F(x) &= 1/3 e^(3 x)
  $


  $
  integral e^(3 x) x dd(x) &= 1/3 e^(3 x) dot x - integral 1/3 e^(3 x) dot 1 dd(x) \ 
  &= 1/3 x e^(3 x) - 1/3 dot  1/3 e^( 3 x) = 1/3 e^(3 x)(x - 1/3) + c, c in RR
  $
]


#example[
  $
  integral x cos x dd(x)
  $


  $
  g(x) &= x \ 
  g'(x) &= 1 \ 
  f(x) &= cos x \ 
  F(x) &= sin x 
  $


  $
  integral x cos x dd(x) &= sin x - integral sin x dot 1 dd(x) \ 
  &= x sin x - (-cos x) \ 
  &= x sin x + cos x
  $
]


#example[
  $
  integral x^2 e^(3 x) dd(x)
  $


  $
  g(x) &= x^2, g'(x) &= 2x \ 
  f(x) &= e^(3 x), F(x) &= 1/3 e^(3 x)
  $

  $
  integral x^2 e^(3 x) dd(x) &= 1/3 e^(3x) dot x^2 - integral 1/3 e^(3 x) dot 2x dd(x) \ 
  &= 1/3 x^2 e^(3 x) - 2/3 integral x e^(3 x) dd(x) \ 
  &= 1/3 x^2 e^(3x) - 2/3 dot 1/3 e^(3 x) (x - 1/3) \ 
  &= 1/3 x^2 e^(3 x) - 2/9 x e^(3 x) + 2/27 e^(3 x)
  $
]


#example[
  $ integral (ln abs(x)^2 )/x dd(x)     $



  $
  g(x) &= ln abs(x)^2 \ 
  f(x) &= 1/x, F(x) &= ln (x)
  $


  #note-box[
    Kædereglen: 


    $
    f compose g &= g'(x) f'(g(x))
    $
  ]


  $
  g'(x) &= 1/x 2 ln x \ 
  $


  $ integral (ln abs(x)^2 )/x dd(x)  &=  ln(x) ln(x)^2 - integral ln(x) 1/x 2 ln x dd(x) \ 
  &= ln(x)^3 - 2 integral ln(x)^2/x dd(x) \ 
  &=  3 integral ln(x)^2/x dd(x) = ln(x)^3  \ 
  &= integral ln(x)^2/x dd(x) = 1/3 ln(x)^3


  $

]



#theorem(title: "6.2.3")[

  $
  integral f(g(x)) g'(x) dd(x) &= F(g(x)) 
  $

  Hvor 

  $
  u &= g(x) \ 
  dv(u,x)  &= g'(x) quad  dd(u) &= g'(x) dd(x) 
  $


  $
  integral f(u) dd(u) &= F(u)
  $
]


#example[
  $u &= ln(x)$

  $
  dv(u,x) &= 1/x \ 
  dd(u) &= 1/x dd(x)
  $



  $
  integral ln(x)^2/x dd(x) &= integral u^2 1/x dd(u) \ 
  &= 1/3 u^3 \ 
  &= 1/3 ln(x)^3 
  $
]


#example[
  
  $
  integral 6x^2 cos(overbrace(x^3 + 5, u)) dd(x)  
  $


  $
  dv(u,x) &= 3x^2  \ 
  dd(u) &= 3x^2 dd(x)
  $

  $
  integral 2 cos (x^3 + 5) dot  3x^2 dd(x) &= \
  integral 2 cos(u)  dd(u) &= 2 sin(u) \ 
  &= 2 sin (x^3 + 5)
  $

]

== Talfølger 


#let __integral_display(f, vars, ranges) = {

  assert(type(vars) == array, message: "Expected array")


  let ints = $$

  if vars.len() >= 2 {
    for integral in vars {
      ints = ints + math.integral
    }

  } else {
    ints = ints + math.integral
  }


  ints = ints + f + math.space

  for var in vars {
    ints = ints + var
  }




ints
}

#let __combine_var_order(order) = {

  

}



/// (f, x, y)
#let integrate(f, ..args, d: none, style: none ) = {
  if f == [] { f = none }
  
  let args = args.pos()

  let d = if d == none { $upright(d)$ } else { d }

  let var_num = args.len()

  let vars = ()
  let ranges = ()

  if var_num >= 1 {
    for i in range(args.len()) {

     
      if type(int(args.at(i).text)) == int {

        let next = i  + 1

        //assert(next == none, message: "Riemann integrals require upper bound")
        ranges.push((i, next) ) 
        

      }

      vars.push($#d #i$ )

    }
  } else {
    vars.push($#d x$)
  }


  [#ranges]
  


  //__integral_display(f, vars, ranges)


}

#let Int = integrate 




$
Int(x^4 dot 1, 1, 2)
$



