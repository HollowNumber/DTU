#import "@local/dtu-template:0.4.3":*

#show: dtu-note.with(
  course: "01017",
  course-name: "Discrete Mathematics",
  title: "Lecture - October 09, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Key Concepts

== Solving congruences

Suppose we have the equation $a x = b$ and we want to solve for $x$, simply divide by $a$.

$
  a x &= b \
  x &= b/a
$

What if we have

$
  a x &equiv b mod m \

$

We cant just divide by $b slash a mod m$. We want to find some number $overline(a)$ such that

$
  a dot overline(a) equiv 1 mod m
$
We can then using $overline(a)$

$
 x equiv overline(a) dot a x equiv overline(a) b mod m
$

We call $overline(a)$ the inverse of $a mod m$. This inverse of $a$ may not exist.

+ Inverse of $3 mod 5 = 2$

+ Inverse of $2 mod 6$? It doesn't exist

If an inverse does exist, it is unique mod $m$


#theorem(name: "1")[
  If $a$ and $m$ are relatively prime then an inverse of $a mod m$ exists and is unique $mod m$.
]

#proof[
  Since the $gcd(a,m) = 1$, then $exists s,t in ZZ$ such that $a s + m t = 1$, so $a s equiv 1 mod m$.

  Uniqueness: Exercise 7


  To find the inverse of $a mod m$, consider $a, 2 a, 3 a, dots, n a$ until you find one that is $1 mod m$.


  Conversely if the $gcd(a, m) > 1$ then there is no inverse $a mod m$
]

We can use this idea of solving congruency to also solve equations like

$
  a x + b &equiv c x + d mod m \
  a x - c x &equiv d -b mod m \
  (a - c) x &equiv d -b mod m
$

== Chinese Remainder Theorem

Let a system of congruences be defined as

$
  x &equiv 2 mod 3 \
  x &equiv 3 mod 5 \
  x &equiv 5 mod 7
$

we want to find the solution to this system of congruences. For this we use the chinese remainder theorem

#theorem(name: "Chinese Remainder Theorem")[
  Let $m_1, m_2, dots, m_n$ be relatively prime positive integers $> 1$, then the system of congruences
  $
    x &equiv a mod m_1 \
    x &equiv a_2 mod m_2 \
    &dots.v \
    x &equiv a_n mod m_n
  $
  has a unique solution $mod m = m_1 m_2 dots m_n$, meaning there is a solution to this system such that $0 <= x < m$ and all solutions are congruent to this one $mod m$.
]


#proof[
  To prove this we have to prove the existence:

  Let $M_k = m slash m_k$ where $m$ is the product of all $m_i$ except for $m_k$ where $k =1,2, dots , n$.

  We can then find $gcd(m_k, M_k) = 1$ since $gcd(m_i, m_k) = 1$ for all $i != k$.
  Since $m_k$ and $M_k$ are relatively prime, this means that there exists an inverse $M_k mod m_k$ called $y_k$.

  $
    M_k dot y_k &equiv 1 mod m_k
  $

  So $a_k M_k y_k equiv a_k mod m_k$, we can then use the formula:
  $
    x &= sum_(k=1)^(n) a_k M_k y_k
  $

  Consider $M_j equiv 0 mod m_k$ for $j != k$, where

 $
   M_j &= m/m_j = (m_1 m_2 dots m_n)/m_j = m_1 m_2 dots cancel(m_j) dots m_n
 $

 We then have

 $
   a_j M_j y_j equiv 0 mod m_k "if" k != j
 $

 from that we have the sum

 $
   x &equiv a_1, M_1 y_1 + dots + a_n M_n y_n equiv 0 + 0 + dots + 0 + a_k M_k y_k + 0 dots + 0 \
   &equiv a_k M_k y_k equiv a_k mod m_k
 $

 So this particular solution is unique since any other solution would have to be congruent to $x$ modulo $m$.
 This proves the existence of a solution. We can now prove the uniqueness of a solution.

 Suppose $x$ and $y$ are solutions to the system. We must show $x equiv y mod m$ since $x equiv y mod m_i$ for all $i = 1, dots, n$

 By exercise 30 in the book $x equiv y mod m$.
]


== Back Substitution

$
  x &= 5(6 u +5) +1 = 30u + 26 \
  30 u + 26 &equiv 5 (mod 7) \
  2u - 2 &equiv 5 (mod 7) \
  2u &equiv 5 (mod 7) \
  u &equiv 20 equiv 6 (mod 7) \
  u &equiv 7 v + 6
$

Then we back substitute to find $x$

$
  x &= 30(7v +6) + 26 \
 &= 210v + 206 \
x &equiv 206 (mod 210)
$


=== Fermat's little theorem

#note-box[
  Fermats last theorem states that no three positive integers $a$, $b$, and $c$ satisfy the equation $a^n + b^n = c^n$ for any integer value of $n$ greater than $2$.
]

Fermat's little theorem states that if $p$ is a prime, and $a$ is an integer not divisible by $p$, then

$
  a^(p-1) equiv 1 (mod p)
$

moreover for any integer $a$

$
  a^p equiv a (mod p)
$

#proof[
  proof is in exercise 19.
]


== Pseudo primes

#definition("1")[
  Let $b$ be a positive integer, if $n$ is a composite positive integer and $b^(n-1) equiv 1 (mod n)$ then $n$ is called a pseudoprime to the base b.
]

There exists $455,05,512$ primes $< 10^10$, where only $14,884$ pseudoprimes exist for base $2$.

#definition("")[
  A composite integer $n$ that is a pseudoprime for all $b$ such that $gcd(b, n) = 1$ is a carmichael number.
]

= Examples

== Solving congruences


#example[
  Solving $3x equiv 4 mod 7$

  We can start by multiplying both sides by $5$.

  $
    x equiv 5 dot 4 mod 7 equiv 20 mod 7 equiv 6 mod 7
  $

  Because $5$ is the inverse of $3 mod 7$.

]

== Solving systems of congruences

#example[
  Given a system of congruences
  $
    x &equiv 2 mod 3 \
    x &equiv 3 mod 5 \
    x &equiv 5 mod 7
  $

  We can then solve for $x$ using the chinese remainder theorem. First we find $m$ which is the product of all modules $m_i$.

  $
    m = 3 dot 5 dot 7 = 105
  $

  then we can find $M_i$

  $
    M_1 &= 35 \
    M_2 &= 21 \
    M_3 &= 15
  $

  Now we can find the inverse of $M_i$ modulo $m_i$

  $
    M_1 equiv 35 equiv 2 mod 3 \
    y_1 equiv 2 \
    M_2 equiv 21 equiv 1 mod 5 \
    y_2 equiv 1 \
    M_3 equiv 15 equiv 1 mod 7 \
    y_3 equiv 1 \
  $

  then we can find $x$

  $
    x &equiv 2 dot 35 dot 2 + 3 dot 21 dot 1 + 5 dot 15 dot 1 \
    &equiv 140 + 63 + 75 \
    &equiv 278 \
    &equiv 68 (mod 105)
  $

  So if $x$ is a number which satisfies the system of congruences, then $x$ is congruent to $68$ modulo $105$.

]

=== Fermat's little theorem

#example[
  Find $7^222 mod 11$

  Using Fermat's little theorem we know that $7^222 = (7^10)^22 dot 7^2$

  $
    &equiv (1)^22 dot 7^2 (mod 11) \
    &equiv 49 (mod 11) \
    &equiv 5 (mod 11)
  $

  Thusly $7^222 mod 11 = 5 $.
]


=== Carmichael Numbers

#example[

  $
    561 = 3 dot 11 dot 17
  $

  if $gcd(b, 561) = 1$, then $gcd(b,3)=gcd(b,11)=gcd(b,17)=1$.

  Using Fermat's little theorem (FLT) we know that

  $
    b^2  &equiv 1 (mod 3) \
    b^10 &equiv 1 (mod 11) \
    b^16 &equiv 1 (mod 17)
  $

  Let $b = 561 - 1$ then

  $
    b^560 &= (b^2)^280 equiv 1 (mod 3) \
    b^560 &= (b^10)^56 equiv 1 (mod 11) \
    b^560 &= (b^16)^35 equiv 1 (mod 17)
  $

  By exercise 29, if $b^560 equiv 1 (mod 561)$, meaning that this is a Carmichael number because it satisfies the conditions of Fermat's little theorem for all prime factors of $561$.
]


== Induction

Sometimes we want to prove a statement $P(n)$ for all natural numbers $n$. We can do this by induction.

#example[
  $P(n)$ is the statement the sum of the first $n$ natural numbers is $(n(n+1))/2$.

  $
    1 + 2 + 3 + ... + n = (n(n+1))/2
  $

  We want to prove this for all natural numbers $n$. Firstly we take our base case $n=1$. We know that $P(1)$ is true because $1 = (1(1+1))/2$.
  The next step the _inductive step_ is to prove $P(n) -> P(n + 1)$ for all $n >= 1$, suppose that $P(n)$ holds for some $n in ZZ^+$

  $
    1 + 2 + 3 + dots + n + (n + 1) &= (n(n+1))/2 + (n+1) \
    &= (n(n+1) + 2(n+1))/2 \
    &= ((n+1)(n+2))/2 \
    &= ((n+1)(n+2))/2 = ((n+1)((n+1) + 1))/2 \
  $


]

= Exercises
ddd

== Exercise 5

Find an inverse of $a op("modulo") m $ for each of these pairs of relatively prime integers using the method followed in example 2.

+ $a = 4, m = 9$
+ $a = 19, m = 141$
+ $a = 55, m = 89$
+ $a = 89, m = 232$

#example[
  Example 2:

  Find an inverse of $101 op("modulo") 4620$, we use the extended euclidean algorithm
]


#solution[

]
