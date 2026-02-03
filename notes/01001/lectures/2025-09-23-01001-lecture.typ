#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - September 23, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Komplekse tal

== Rektangulær form

$
  z = a + b i (a, b in RR )
$

hvor
$
  a = Re(z), b = Im(z)
$

Altså talparret $(a,b)$ (koordinater)

== Polære koordinater

Afstanden fra $z$ til origo. Betegnet ved $abs(z)$


- $arg(z)$ argumentet af $z$
- $op("Arg")(z)$ hovedargument af $z$ (ligger i intervallet $]-pi, pi]$)

Talparret

$
  (abs(z), op("Arg")(z))
$ kaldes $z$'s polære koordinater


== Polære form
Den polære form er bygget op af intervallet fra den Komplekse eksponentielle funktion


#definition(title: "4.4.1")[
  givet $z = a + b i$ givet på rektangulær form, da defineres

  $
    e^z = e^a dot (cos(b) + sin(b) i)
  $

  Så realdelen og imaginærdelen ville være

  $
    Re(e^z) &= e^a dot cos(b)\
    Im(e^z) &= e^a dot sin(b)
  $
]

#example[
  $
    e^(i pi) &= e^0 dot (cos(pi) + sin(pi) i) \
    &= 1 (-1 + 0 dot i) \
    &= -1 ("Mona lisa formlen")
  $
]

#example[
  $
    z &= a + 0 dot i (a in RR) \
    e^z &= e^a (cos(0) + sin(0) i ) = e^a
  $

  - exp: $RR -> RR_(>0)$ "gamle" eks. funktion.
  - exp: $CC -> CC backslash {0}$ "nye" eks. funktion.

  Den komplekse eksponentiel funktion er surjektiv og ikke injektiv
 ]


#example[
  Rent imaginær tal

  $
    z &= 0 + b dot i \
    e^z &= e^0 dot (cos(b) + sin(b)) i \
    &= cos(b) + sin(b) i
  $

  $
    i &= e^(pi/2 dot i) \
    e^(0 dot i) &= e^(2pi i) = 1
  $

  Derfor er det ikke injektiv
]

#theorem[
  #set enum(numbering: "i.")
  1. $e^z != 0$
  2. $1/e^z = e^(-z)$
  3. $e^(z_1) dot e^(z_2) = e^(z_1 + z_2)$
  4. $e^(z_1) slash e^(z_2) = e^(z_1 - z_2)$
  5. $(e^z)^n = e^(n z)$

]

#example[
  Vi har set at $e^(i b) = cos(b) + sin b dot i$

  Bruges 5. for $z = i b$ og $n = 2$

  $
    e^(2 b i) &= cos(2 b) + sin(2 b) i \
    (e^z)^2 &= (cos b + sin b dot i)^2 = cos( b )^2 cancel(+)- sin(b^2) cancel(i^2) "da" i^2 = -1 \
    &= 2 cos(b) dot sin(b) i
  $

  Derfor
  $
    cos(2b) &= cos(b)^2 - sin(b)^2 \
    sin(2b) &= 2 cos(b) dot sin(b)
  $
]

Vi kan nu vende tilbage til den polære form af et komplekst tal.

#definition(title: "Polæreform")[
  givet $z in CC$, så gælder
  $
    z = abs(z) dot e^(i dot arg(z))
  $
  dette kaldes dermed $z$'s polæreform
]

Kendes $abs(z)$ og $arg(z)$, så gælder

$
  Re(z) &= abs(z) dot cos(arg(z)) \
  Im(z) &= abs(z) dot sin(arg(z))
$

På den anden side, gælder det også at

$
  abs(z) dot e^(i arg(z)) &= abs(z) dot (cos(arg(z)) + sin(arg(z)) i \
 &= abs(z) dot cos(arg(z) ) + abs(z) dot sin(arg(z)) i
$

Derfor
$
  z = abs(z) dot e^(i arg(z))
$


#theorem[
  #set enum(numbering: "i.")
  Hvor $z, z_1, z_2 in CC backslash {0}, n in ZZ$

  1. $ abs(z_1 dot z_2) &= abs(z_1) dot abs(z_2) \ arg(z_1 dot z_2 ) &= arg(z_1) + arg(z_2) $
  2. $ abs(z_1 slash z_2) &= abs(z_1) slash abs(z_2) \ arg(z_1 slash z_2) &= arg(z_1) - arg(z_2)  $
  3. $ abs(z^n) &= abs(z)^n \ arg(z^n) &= n dot arg(z) $

]

#example[

  $
    (1 + i)^2 = 1^2 + i^2 + 2i = 2i
  $

  Vi kan beregne det på den polære form

  $
    (1 + i)^2 &= (sqrt(2) dot e^(i pi/4))^2= (sqrt(2))^2 dot (e^(i pi/4) )^2 \
    &= 2 dot e^(pi/n i) = 2 i
  $


  Eller

  $
    (1 + i)^200 &= (sqrt(2))^200 (e^(i pi/4))^200\
    &= 2^100 dot e^(50 dot pi dot i ) = 2^100 dot 1 = 2^100 \
  $
]

#lemma[
  Givet $w in CC backslash {0}$, så har ligningen
 $
   e^z &= w
 $ i den ubekendte $z$ præcist

 Følgende løsninger:
 $
   z = ln(abs(w)) + (op("Arg")(w) + p dot 2pi) i "hvor" p in ZZ
 $
]

#proof[
  Vi skriver $e^z$ og $w$ på polær form
  $
    e^z = e^(Re(z) + Im(z) dot i) = underbracket(underbracket(e^(Re(z)), "Positivt reelt tal ") dot underbracket(e^(Im(z) dot i), "Eksponent er \n ren imaginært tal"), "Polær form af" e^z)

  $

  $
    w &= abs(w) dot e^(op("Arg")(w) dot i ) \
    &"Derfor": abs(w) = e^(Re(z)) \
    &"og": Im(z) = op("Arg")(w) + p dot 2 pi "for" p in ZZ
  $

  Vi konkludere:
  $
    Re(z) &= ln(abs(w)) \
    &"og": Im(z) = op("Arg")(w) + p dot 2 pi "hvor" (p in ZZ)
  $

  Så fås

  $
    z = ln(abs(w)) + (op("Arg") + p dot 2 pi ) i "hvor" (p in ZZ )
  $
]

#example[
  Løs ligningen $e^z = 1 + i$

  Svar

  $
    1 + i = sqrt(2) dot e^(i pi/4)
  $

  Derfor er løsningerne præcist

  $
    z &= ln(abs(sqrt(2) ) ) +(pi/4 + p dot 2 pi) "hvor" p in ZZ
   $
]

= Polynomier

#definition(title: "5.1.1")[
  Et udtryk på formen

  $
    a_0 Z^0 + a_1 Z^n + dots + a_n Z^n "hvor" n in ZZ_(>= 0)
  $

  Kaldes et polynomium i den ubekendte $Z$

  Hvis $a_0, a_1, dots, a_n$ er i $CC$, kaldes polynomiet et komplekst polynomium.
  Hvis $a_0, a_1, dots, a_n$ er i $RR$, kaldes polynomiet reelt.


  Hvis $a_n != 0$, kaldes $n$ polynomiets grad og $a_n$ kaldes polynomiets førende koefficient.

  #example[
    $
      p_1(z) = z + (3 + i ) z^2
    $ hvor grad $2$ og førende koefficient $3 + i$

    $
      p_2(z) = z + 2 z^2 cancel(+ 0 z^3)
    $ har grad $2$ og førende koefficient er $2$
  ]

]

Man kan gange polynomier

$
  p_1(z) dot p_2(z) &= (z + (3 + i) z^2) dot (z + 2 z^2) \
  &= z dot z + z dot 2 z^2 + (3+ i) z^2 dot z^2 + (3+i)z^2 dot 2 dot z^2 \
  &= z^2 + 2z^3 + (3 + i)dot z^3 + (3+ i)dot 2 dot z^4 \
  &= 2^2 + (5 + i)z^3 + (6 + 2i) dot z^4
$

Så polynomiet har grad $4$ og førende koefficient $6 + 2i$

#definition(title: "5.1.2")[
  $p(z)$ er givet komplekst polynomium. Hvis $lambda in CC$ opfylder

  $
    p(lambda) &= 0
  $ så kaldes $lambda$ er en rod i $p(z)$.
]

#example[
  $p(z) = 2 + (1 - i) Z$

  Rødder i $p(z)$ er løsningerne til ligningen

  $
    2+(1-i) dot Z &= 0
  $, dvs.
  $
    Z &= (-2)/(1- i) \
    &= (-2 (1 + i) )/(2) \
    &= -1-i
  $
]

== Andengrads polynomium

Rødder i et andengrads reelt polynomium

$
  p(z) &= a dot z^2 + b z + c "hvor" a,b,c in RR "og" a != 0
$

Rødderne i $p(z)$ opfylder ligningen $p(z) = 0$

$
  p(z) = 0 &<=> a z^2 + b z + c = 0 <=> z^2 + b/a z + c/a = 0 \
  &<=> (z + 1/2 b/a)^2 - (1/2 b/a)^2 + c/a = 0 \
  &<=> (z + b/(2a))^2 = (b/(2a))^2 - c/a <=> (z + b/(2a) )^2 = (b^2 - 4 a c)/(4a^2) \
$

Hvor diskriminanten
$
  D = b^2 - 4 a c
$

$
  p(z) &= 0 <=> (z+ b/(2a))^2 = D/(4 a^2) \
  &<=> z + b/(2a) = plus.minus sqrt(D)/(2a) \
  &=(-b plus.minus sqrt(D))/(2a)
$

Men hvad hvis diskriminanten er negativ?

#definition(title: "Diskriminant")[


  $
    sqrt(D) = cases(
      sqrt(D) quad "hvis" D>= 0 quad (D in RR),
      i sqrt(abs(D)) quad "hvis" D < 0
    )
  $
  Er $D > 0$, så har $a z^2 + b z + c$ to reelle rødder

 $
   cases(z_1, z_2, reverse: #true) = (-b plus.minus sqrt(D))/(2a )
 $

 Er $D = 0$, så har polynomiet én rod $z = (-b)/(2a)$


 Er $D < 0$, så har $a z^2 + b z + c$ to ikke reelle rødder

 $
   cases(z_1, z_2, reverse: #true) = (-b plus.minus i sqrt(abs(D) ))/(2a )
 $
]

#note-box[
  At finde en rød kan være noget rod, men er graden lig med $2$ skal det hele nok gå
]

#import "@preview/cetz:0.4.2": canvas, draw

#figure(
  canvas(length: 1.2cm, {
    import draw: *

    let real_part = 3
    let imag_part = 5

    // Set up coordinate system with focus on first quadrant
    set-style(stroke: gray + 0.4pt)


    // Main axes
    set-style(stroke: black + 1.5pt)
    line((0, 0), (real_part + 1, 0))
    line((0, 0), (0, imag_part + 1))

    // Axis labels


    // Origin
    content((-0.2, -0.2), text(size: 10pt, "0"), anchor: "north-east")
    arc((rel: (1, 0.2)), start: 0deg, stop: 45deg, radius: 1, stroke: black + 0.5pt, mark: (end: ">>"), name: "angle" )
    //set-origin("angle.center")
    content((rel: (0.25, -0.25)), $arg(z)$, anchor: "west")


    // The complex number point
    circle((real_part, imag_part), radius: 0.05, fill: red, stroke: red + 1.5pt, name: "z-point")
    content((real_part, imag_part+0.2), text(size: 10pt, fill: white, $z$), anchor: "center")


    // 1. Real part (horizontal leg)
    //line((0, 0), (real_part, 0), name: "real-leg")
    on-layer(-1, {
      content((real_part/2, -0.5), text(size: 11pt, fill: blue, $Re(z)$), anchor: "north")

      // 2. Imaginary part (vertical leg)
      line((real_part, 0), (real_part, imag_part), name: "imag-leg", stroke: (dash: "dashed"))
      content((real_part + 0.7, imag_part/2), text(size: 11pt, fill: green, $Im(z)$), anchor: "west")

      // 3. Complex number (hypotenuse)
      line((0, 0), (real_part, imag_part), name: "hypotenuse", anchor: "north", stroke: (dash: "dashed"))

      content("hypotenuse.mid", text(size: 10pt, fill: white, $|z|$), anchor: "south")
    })

    // Magnitude calculation

    // Right angle indicator (larger)


    // Angle theta

    // Triangle area shading (optional - makes it more visual)
    //line((0, 0), (real_part, 0), (real_part, imag_part), close: true)

    // Labels for triangle sides

  }),
  caption: [Complex number $z$ in the complex plane showing real part, imaginary part, magnitude, and argument]
) <fig:complex-plane>
