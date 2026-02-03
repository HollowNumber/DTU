#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01017",
  course-name: "Discrete Mathematics",
  title: "Lecture - December 04, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Polynomials

$
  f(x) &= x^2 -4x + 3 \
  g(x) &= 2x - 3 \
  h(x) &= 7 \
  k(x) &= 0
$

These are all examples of polynomials. They can be denoted as a polynomial of the 2nd degree, first degree, zeroth degree, and $-infinity$ degree. $0$ is known as the zero polynomia.

If we remember a polynomial is a function that can be expressed as a sum of terms, each of which is a constant multiplied by a variable raised to a non-negative integer power. The degree of a polynomial is the highest power of the variable in the polynomial.

In general

$
  cal(P)(x) = a_0 + a_1 x + a_2 x^2 + dots.c + a_n x^n "where" a_n != 0 "and" a_i in RR "or" CC
$

Where $a_0$ is a constant term, and $a_n$ is a leading term.

== Addition of polynomials

$
  cal(P)(x) + cal(Q)(x) = (a_0 + b_0) + (a_1 + b_1)x + (a_2 + b_2)x^2 + dots.c + (a_n + b_m)x^n
$

How can we represent the degree?

$
  deg(cal(P) + cal(Q)(x)) <= n
$

The degree of the sum of two polynomials is less than or equal to the maximum of their degrees.
With equality if $m < n$.

== Product of polynomials

Using the same polynomials as before, the product of two polynomials is a polynomial of degree $m + n$.

$
  cal(P)(x) cal(Q)(x) = a_0 dot b_0 &+ (a_0 dot b_1 + a_1 dot b_0 )x\ &+ (a_0 dot b_2 + a_1 dot b_1 + a_2 dot b_0 )x^2 + dots.c + a_n dot b_m dot x^(n + m)
$

From this we can express the degree of the product of the two polynomials

$
  deg(cal(P) dot cal(Q) ) = n + m = deg cal(P) + deg cal(Q)
$

where $M(x) divides N(x)$ if $N(x) = Q(x) dot M(x) $

If $M(x) divides N(x)$ and $N(x) divides M(x)$ then $deg N = deg M$ moreover, $exists alpha in RR : N(x) = alpha M(x) $

$D(x)$ is a common division of $M(x), N(x) $ if $D(x) divides M(x) $ and $D(x) divides N(x)$. $D(x)$ is a greatest common divisor (gcd) of $M(x)$ and $N(x)$ if $D$ is a common divisor,
and $D(x)$ also satisfies:
$
  (D_1(x) divides M(x) and D_1(x) divides N(x)) => D_1(x) divides D(x)
$

Suppose $D_2(x)$ is also a $gcd(M(x), N(x))$ then $D_2 divides D_1$ so $D_2 = alpha D_1$

== Euclid

$
  n &= q_1 dot m + r_1 "where" r_1 < r_0 = m \
  r_0 &= q_2 r_1 + r_2 \
  r_1 &= q_3 dot r_2 + r_3 \
  r_(k -2) &= q_k r_(k-1) + r_k \
  r_(k -1) &= q_(k+1) r_k + 0
$



== GCD of Polynomials

Let $M(x), N(x)$ be two polynomials defined as:

$
  N(x) &= x^4 + x^3 - 2x ^2 + 2x - 2 \
  M(x) &= x^2 + 2x -3
$

To find a $gcd$ of these two polynomials, we have to use the Euclidean algorithm.

// Insert euclidean algorithm

$
  gcd(N(x),M(x)) = -7x + 7
$

#grid(
  columns: 3,
  column-gutter: 2em,
  row-gutter: 1em,
  $2 + 3$,$2Z^2 + 3Z - 9$,rect(pad: 0em ) )[$2Z-3$],
  [], $2Z^2 +6Z$, [],
  [], $-3Z - 9$, []
)

= Questions & Follow-up
