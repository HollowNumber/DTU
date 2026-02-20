#import "@local/dtu-template:0.6.3":*

#import "@preview/cetz:0.4.2" 
#import "@preview/physica:0.9.8": *

#show: dtu-note.with(
  course: "01002",
  course-name: "Matematik 1b (Polyteknisk grundlag)",
  title: "Lecture - February 17, 2026",
  date: datetime(year: 2026, month: 2, day: 17),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)

== Indreprodukt og Norm


#note-box[
  Notation for $A in M_(n times n) CC = CC^(m times n) $ 

  Er

  $
  A^(*) in M_(n times m) CC "givet ved"
  $

  $
  A^* = (overline(A))^TT = overline((A^TT))
  $
    Specielt:

    $
    vb(x) in CC^(n times 1) &= CC^n \
    vb(x)^* &= mat(overline(x_1), overline(x_2), dots, overline(x)_n) \ 
    vb(A) &= mat(1 +i, 2 ,3 ; 3i, -i, 1) 
    \ vb(A)^* &= mat(1-i, -3i; 2, i; 3, i)
    $


    #example[
      $
      vb(x), vb(y) in RR^n, iprod(vb(x), vb(y)) &= vb(y)^TT vb(x) 
      \ &= x_1 y_1 + dots.c + x_n y_n \ 
      vb(A), vb(B) in CC^(m times n), iprod(vb(A), vb(B))_F &= underbracket(tr(vb(B)^* vb(A)), n times n) \
      p, q in P_n (mat(a,b)), iprod(p, q) &= integral^b_a p(x) overline(q(x)) d x
      $
    ]
 ]


 #definition(title: "2.1.2")[
   Vektorrum over $FF = RR or CC$ en funktion $iprod(*,*) V times V -> CC$ der opfylder:

   1. $iprod(vb(x), vb(x)) >= 0 "for" vb(x) in VV $
   2. $iprod(vb(x), vb(x)) = 0 <=> vb(x) = 0 $
   3. $iprod(vb(x), vb(y)) = overline(iprod(vb(x), vb(y)))$ 
   4. $iprod(c vb(x) + d vb(y), vb(z)) = c iprod(vb(x), vb(z)) + d iprod(vb(y), vb(z))$ for $vb(x), vb(y), vb(z) in V, c,d in FF$ kaldes et indreprodukt for $V$

 ]


 #proof[

   Man kan bevise at fx for $V = CC^n$ at 

   $
   iprod(vb(x), vb(y)) &= x_1 overline(y)_1 + x_2 overline(y)_2 + dots.c + x_n overline(y)_n \
   &= sum^n_(i = 1) x_i overline(y)_i
   $

   er et indreprodukt.

   1. 

   $
   iprod(vb(x), vb(x)) &= sum^n_(i=1) x_i overline(x)_i \
   $

   #note-box[husk $z overline(z) = abs(z)^2 $]

   $
   &= sum^n_(i = 1) underbracket(abs(x_i)^2, >= 0) >= 0
   $

   2. osv.
 ]


 #example[
   $v == CC^4$

   $
   vb(v)_1 = vec(0, i, 1, 1), vb(v)_2 = vec(3i, 1-i, -1, 2 + i), 
   vb(v)_2^* = mat(-3i, 1 + i, -1, 2 -i )
   $

   $
   iprod(vb(v)_1, vb(v)_2) &= vb(v)_2^* vb(v)_1 \ 
   &= mat(-3i, 1+i, -1, 2-1) vec(0,i,1,1) \ 
   &= cancel((-3)^0) 0 + (1+i) dot i + (-1) dot 1 + (2-i) dot 1 \
   &= i - 1 - 1 + 2 - 1 dot 0, "dvs" vb(v)_1 perp vb(v)_2
   $

   Så de er ortogonale. Er de dog ortonomale? 

   #note-box[
     Ortonomalitet betyder at de er både ortogonale $v_1 perp v_2$ og de har længden $1$ 
   ]

   Normen af $vb(v)_1$

   $
   norm(vb(v)_1 ) &= sqrt(abs(0)^2 + abs(i)^2 + abs(1)^2 + abs(1)^2 ) \ 
   &= sqrt(0 + 1 + 1 +1) = sqrt(3) + 1
   $

   Normen af $vb(v)_2$: 

   $
   norm(vb(v)_2) = sqrt(17) // TODO: Show the proof 
   $

   Vi kan gøre vektorerene ortonomale ved:

   $
   vb(u)_1 = 1/norm(vb(v)_1) vb(v)_1 = 1/sqrt(3) vec(0, i, 1,1), vb(u)_2 = 1/sqrt(39) vec(3i, 1-i, -1, 2+i)
   $

 ]

 == Norm

 #definition(title: "2.1.1")[
    Lad $V$ være et vektorrum over $FF$

    En funktion der opfylder $|| || : V -> RR $

    1. $norm(vb(x)) >= 0$ for alle $vb(x) in V $
    2. $norm(vb(x)) = 0 <=> vb(x) = vb(0)$ 
    3. $norm(c vb(x)) = abs(c) norm(x)$
    4. $norm(vb(x) + vb(y)) <= abs(vb(x)) + abs(vb(y))$ 

for alle $vb(x), vb(y) in V, c in FF$ kaldes en norm på $V$.

#figure(image("image.png"))

 ]


 #theorem(title: "2.1.1")[
  $
  norm(vb(x)) &= sqrt(iprod(vb(x), vb(x)) ) \ 
  $


  #example[
    $V = CC^4$

     $
     norm(vb(x)) &= sqrt(iprod(vb(x), vb(x))) = sqrt(x_1 overline(x)_1 + dots.c + x_4 overline(x)_4) \ 
     &= sqrt(abs(x_1)^2 + dots.c + abs(x_4)^2)
     $

     For $V = CC^n$ 

     $
     norm(vb(x)) &= sqrt(sum^n_(i=1) abs(x_i)^2 )
     \ norm(vb(2)) &= sum^n_(i = 1) abs(x_i)^2  
     
     $

  ]
 ]


 #example(title: "2.1.4")[

   $a = -1, b = 1, x in [-1, 1]$


   $
   p(x) = 1, q(x) = x
   $


   #figure(
     image("billed2-17feb.png")
   )
   $
   iprod(p, q) &= integral^1_(-1) p(x) overline(q(x) ) d x \
   &= integral^1_(-1) 1 dot x d x \ 
   &= mat(1/2 x^2)^(x = 1)_(x = -1) \
   &= 1/2 1^2 - 1/2 (-1)^2 = 1/2 -1/2 \ 
   &= 0 "dvs" p perp q
   $
 ]

== Projektioner


$
V = RR^2
$


#figure(
cetz.canvas({
  import cetz.draw: *

  let scale = 1.5
  // Vectors
  let vx = (1 * scale, 2 * scale)       // x = (1,2)
  let vy = (2 * scale, 1 * scale)       // y = (2,1)
  // proj_y(x) = (x·y / y·y) * y = 4/5 * (2,1)
  let vp = (1.6 * scale, 0.8 * scale)

  // --- Coordinate axes ---
  set-style(mark: (fill: black, scale: 0.5))
  line((-0.5, 0), (4.5, 0), stroke: gray.darken(10%) + 0.6pt, mark: (end: ">"))
  line((0, -0.5), (0, 4), stroke: gray.darken(10%) + 0.6pt, mark: (end: ">"))
  content((4.5, 0), [$x_1$], anchor: "south-west", padding: 0.1)
  content((0, 4), [$x_2$], anchor: "south-west", padding: 0.1)

  // --- Span line Y = span(y), dotted, extended ---
  let t-max = 2.0
  let t-min = -0.3
  line(
    (2 * t-min * scale, 1 * t-min * scale),
    (2 * t-max * scale, 1 * t-max * scale),
    stroke: (paint: gray, dash: "dotted", thickness: 1pt),
  )
  content(
    (rel: (0.1, 0.25), to: (2 * t-max * scale, 1 * t-max * scale)),
    text(fill: gray.darken(30%), size: 0.85em)[$Y = op("span")(bold(y))$],
  )

  set-style(mark: (fill: black, scale: 0.7))

  // --- Vector y (blue) ---
  line((0, 0), vy, stroke: blue + 1.5pt, mark: (end: ">"))
  content((rel: (0.15, -0.25), to: vy), text(fill: blue)[$bold(y)$])

  // --- Vector x (red) ---
  line((0, 0), vx, stroke: red + 1.5pt, mark: (end: ">"))
  content((rel: (-0.3, 0.1), to: vx), text(fill: red)[$bold(x)$])

  // --- Projection vector (teal) ---
  line((0, 0), vp, stroke: eastern + 2pt, mark: (end: ">"))
  content(
    (rel: (0.05, -0.4), to: vp),
    text(fill: eastern, size: 0.85em)[$"proj"_bold(y)(bold(x))$],
  )

  // --- Dashed perpendicular from x tip to projection tip ---
  line(vx, vp, stroke: (paint: gray.darken(20%), dash: "dashed", thickness: 1pt))

  // --- Right angle mark at projection point ---
  let uy-len = calc.sqrt(4 + 1)
  let uy = (2 / uy-len, 1 / uy-len)
  let up = (-1 / uy-len, 2 / uy-len)
  let s = 0.22
  line(
    (vp.at(0) + up.at(0) * s, vp.at(1) + up.at(1) * s),
    (vp.at(0) + up.at(0) * s - uy.at(0) * s, vp.at(1) + up.at(1) * s - uy.at(1) * s),
    (vp.at(0) - uy.at(0) * s, vp.at(1) - uy.at(1) * s),
    stroke: gray.darken(20%) + 0.7pt,
  )

  // --- Angle arc θ ---
  let angle-y = calc.atan2(vy.at(0), vy.at(1))
  let angle-x = calc.atan2(vx.at(0), vx.at(1))
  arc(
    (0, 0),
    start: angle-y,
    stop: angle-x,
    radius: 0.8,
    stroke: black + 0.8pt,
    anchor: "origin",
  )
  let mid-a = (angle-x + angle-y) / 2
  content(
    (calc.cos(mid-a) * 1.15, calc.sin(mid-a) * 1.15),
    [$theta$],
  )

  // --- Origin ---
  content((0, 0), [$O$], anchor: "north-east", padding: 0.15)
}), caption: [Projektion af $vb(x)$ på $vb(y)$ i $RR^2$])

$
"proj"_Y (vb(x)) = "proj"_(vb(y))(vb(x)) = underbrace(norm(vb(x)) cos theta, "et tal") 1/norm(vb(y)) vb(y)
$

Hvor $vb(y)$ er en vektor retning, og 

$
cos theta = iprod(vb(x), vb(y))/(norm(vb(x))  norm(vb(y))) 
$

Så:

$
"proj"_Y (vb(x)) =  iprod(vb(x), vb(y)) dot 1/norm(vb(y))^2 vb(y)
$


Vi kan indføre en normaliserings vektor:

$
vb(u) = 1/norm(vb(y)) vb(y)
$


Dette er det generelle det. af proj af $vb(x)$ på en vektor $vb(y) in V$. 

$
"proj"_Y (x) &= iprod(vb(x), vb(u)) vb(u), vb(u) = 1/norm(vb(y)) vb(y)
\ &= iprod(vb(x), 1/norm(vb(y)) vb(y) ) 1/norm(vb(y)) vb(y) \ 
&= iprod(vb(x), vb(y)) 1/norm(vb(y))^2 vb(y)
$

#example(title: $V = CC^4$)[

  $
  Y = "span"_CC (vb(y)) = {c dot vb(y) | underbrace(c, "underrum af " CC^4) in CC}
  $

  $vb(y) = vec(0, i, 1, 1)$

  $
  norm(vb(y))^2 &= abs(0)^2 + abs(i)^2 + abs(1)^2 + abs(1)^2 
  \ &= 3
  $

  $

  vb(x) &= vec(1,1,0,0),
  $

  $
  "proj"_Y (vb(x)) &= 1/3 iprod(vb(x), vb(y))  vb(y) = 1/3 iprod(vb(x), vec(0,i,1,1)) vec(0,i,1,1) \ 
  &= iprod(vec(1,1,0,0), vec(0,i,1,1)) \ 
  &= 0 + 1 (-i) + 0 dot 1 + 0 dot 1 \ 
  &= -i
  $

  Så:

  $
  "proj"_Y (vb(x)) &= 1/3 (-i) vec(0,i,1,1) = vec(0, 1/3, - i/3, - i/3) in Y 
  $
]

== Gram-Schmidt og ONB

#definition(title: "2.4.1 (ONB)")[
  Lad $V$ være et indreproduktrum over $FF$. En liste af vektorer $beta = vb(u)_1, vb(u)_2, dots, vb(u)_n$ kaldes en ortonomal basis (ONB) for $V$ hvis:

  $
  "span" beta &= V \ 
  $

  og $beta$ er lineært uafhængigt.


  // smth

  $
  iprod( vb(u)_i, vb(u)_j) &= 0, i != j \
  &= 1, i = j
  $
]




#example(title: $V=  CC^4$)[

  $
  vb(v)_1 &= vec(2 i, 0,0,0), vb(v)_2 = vec(i,1,1,0), vb(v)_3 = vec(0,i,1,1)
  $

  $
  U= "span"_CC (vb(v_1), vb(v_2), vb(v_3))  
  $

  er et 3 dim underrum af $CC^4$ med Gram-Schmidt kan vi finde en ONB $vb(u_1), vb(u_2), vb(u_3)$

  $
  "Init"  vb(w_1) = vb(v_1), vb(u_1) = 1/norm(vb(w_1)) vb(w_1)
  $


  $
  vb(w_1) = vec(2i,0,0,0), norm(vb(w_1)) &= sqrt(abs(2i)^2 + abs(0)^2 + abs(0)^2 + abs(0)^2) \ 
  &= sqrt(2^2 + 0) - sqrt(4) = 2 
  $


  $
  vb(u_1) &= 1/2 vec(2i,0,0,0) = vec(i,0,0,0), "span" (vb(v_1)) = "span" (vb(y_1))
  $

  Ortogonalisering og normalisering: 

  $
  vb(w_2) = vb(v_2) - "proj"_vb(u_1) (vb(v_2)) = vb(v_2) - iprod(vb(v_2), vb(u_1)) vb(u_1)
  $

  #figure(
    cetz.canvas(
      {
        import cetz.draw: *

        let sc = 1.2

        // Points: u_1 direction (2,1), v_2 at (1, 2.5)
        // proj_{u_1}(v_2) = (v_2·u_1 / |u_1|²) u_1 = (4.5/5)(2,1) = (1.8, 0.9)
        let u1 = (2 * sc, 1 * sc)
        let v1 = (3.4 * sc, 1.7 * sc) // v_1 same dir as u_1, longer (∝ 2·u_1)
        let v2 = (1 * sc, 2.5 * sc)
        let proj = (1.8 * sc, 0.9 * sc)

        // --- Coordinate axes ---
        set-style(mark: (fill: black, scale: 0.5))
        line((-0.5, 0), (5.5, 0), stroke: gray.darken(10%) + 0.6pt, mark: (end: ">"))
        line((0, -0.5), (0, 4.2), stroke: gray.darken(10%) + 0.6pt, mark: (end: ">"))

        // --- span(u_1) dotted line ---
        line((-0.4 * sc, -0.2 * sc), (4 * sc, 2 * sc), stroke: (paint: gray, dash: "dotted", thickness: 1pt))
        content((rel: (0.1, 0.25), to: (4 * sc, 2 * sc)), text(fill: gray.darken(30%), size: 0.85em)[$op("span")(bold(u)_1)$])

        set-style(mark: (fill: black, scale: 0.7))

        // --- v_1 (light blue, same direction as u_1) ---
        line((0, 0), v1, stroke: (paint: blue.lighten(40%), thickness: 1.2pt), mark: (end: ">"))
        content((rel: (0.15, -0.3), to: v1), text(fill: blue.lighten(30%))[$bold(v)_1$])

        // --- u_1 (blue) ---
        line((0, 0), u1, stroke: blue + 1.5pt, mark: (end: ">"))
        content((rel: (-0.15, -0.35), to: u1), text(fill: blue)[$bold(u)_1$])

        // --- v_2 (red) ---
        line((0, 0), v2, stroke: red + 1.5pt, mark: (end: ">"))
        content((rel: (-0.35, 0.1), to: v2), text(fill: red)[$bold(v)_2$])

        // --- proj_{u_1}(v_2) (teal) ---
        line((0, 0), proj, stroke: eastern + 2pt, mark: (end: ">"))
        content((rel: (0.05, -0.45), to: proj), text(fill: eastern, size: 0.85em)[$"proj"_(bold(u)_1)(bold(v)_2)$])

        // --- w_2 from proj tip to v_2 tip (green) ---
        line(proj, v2, stroke: green.darken(20%) + 1.5pt, mark: (end: ">"))
        let w2-mid = ((proj.at(0) + v2.at(0)) / 2, (proj.at(1) + v2.at(1)) / 2)
        content((rel: (0.3, 0.1), to: w2-mid), text(fill: green.darken(20%))[$bold(w)_2$])

        // --- Right angle mark at projection point ---
        let uy-len = calc.sqrt(5)
        let uy = (2 / uy-len, 1 / uy-len)
        let up = (-1 / uy-len, 2 / uy-len)
        let s = 0.22
        line(
          (proj.at(0) + up.at(0) * s, proj.at(1) + up.at(1) * s),
          (proj.at(0) + up.at(0) * s - uy.at(0) * s, proj.at(1) + up.at(1) * s - uy.at(1) * s),
          (proj.at(0) - uy.at(0) * s, proj.at(1) - uy.at(1) * s),
          stroke: gray.darken(20%) + 0.7pt,
        )

        // --- Decomposition label ---
        content((rel: (0.6, 0.6), to: v2), text(size: 0.8em)[$ bold(v)_2 = bold(w)_2 + "proj"_(bold(u)_1)(bold(v)_2)$])

        // --- Origin ---
        content((0, 0), [$bold(0)$], anchor: "north-east", padding: 0.15)
      },
    ),
    caption: [Gram-Schmidt: ortogonalisering af $bold(v)_2$ mod $bold(u)_1$],
  )
  
  $
  iprod(vb(v_2), vb(u_2)) &= vb(u_1)^* vb(v_2), vb(u_1)^* = mat(-i,0,0,0)
  \ &= mat(-i,0,0,0) vec(i,1,1,0) = -i^2 = 1
  $


  $
  vb(w_2) &= vb(v_2) - 1 dot vb(u_1) \ 
  &= vec(i,1,1,0) = vec(i,0,0,0) = vec(0,1,1,0)
  $

  Vi ser nu om $vb(w_1)$ er vinkelret med $vb(v_1)$ // Det er den men verificering

  $
  iprod(vb(w_2), vb(v_1)) = 0 // Gør det færdigt
  $


  $
  norm(vb(w_2)) = sqrt(abs(0)^2 + abs(1)^2 + abs(1)^2 + abs(0)^2 ) = sqrt(2)
  $


  $
  vb(u_2) &= 1/norm(vb(w_2)) vb(w_3) = 1/sqrt(2) vec(0,1,1,0) = vec(0, 1/sqrt(2), 1/sqrt(2), 0 )
  $

  #note-box[
    Altid tjek om hver vektor er vinkelret, hvis ikke så har du nok lavet fejl.
  ]

  Vi ser nu på $vb(u_3)$


  // Drawing 
  

  $
  vb(w_3) &= vb(v_3) - "proj"_vb(u_1) (vb(v_3)) - "proj"_vb(u_2) (vb(v_3)) \ 
  &= vb(v_3) - iprod(vb(v_3), vb(u_1)) vb(u_1) - iprod(vb(v_3), vb(u_2)) vb(u_2) 
  $

  Reon først:

  $
  iprod(vb(v_3), vb(u_1)) &= vb(u_1)^* vb(v_3) = mat(-i, 0,0,0) vec(0,i,1,1) = 0 \ 
  iprod(vb(v_3), vb(u_2)) &= vb(u_2)^* vb(v_3) \ 
  &= mat(0, 1/sqrt(2), 1/sqrt(2), 0 ) vec(0,i,1,1) = i/sqrt(2) + 1/sqrt(2) \ 
  
  vb(w_3) &= vec(0,i,1,1) - 0 vec(i,0,0,0) - (i+1)/sqrt(2) vec(0, 1/sqrt(2), 1/sqrt(2), 0)

  $


  Vi regner koordinater:

  $
  1&: 0 \  
  2&: i - (i + 1)/2 = -1/2 + i/2 \ 
  3&: 1 - (i + 1)/2 = 1/2 - i/2  \
  4&: 1
  $


  $
  &= vec(-0, - 1/2 + i/2, 1/2 - i/2, 1), 
  $

  $
 vb(u_3) &= 1/norm(vb(w_3)) vb(w_3) \ 
norm(vb(w_3))^2 &= 0 + 1/2 + 1/2 + 1 = 2 \ 

 vb(w_3) &= 1/sqrt(2) vec(0, - 1/2 + i/2, 1/2 - i/2, 1)
  $
]
