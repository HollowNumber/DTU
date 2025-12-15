#import "@local/dtu-template:0.4.3":*

#show: dtu-note.with(
  course: "01017",
  course-name: "Discrete Mathematics",
  title: "Lecture - October 02, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Prime numbers

or just _primes_

#definition("1")[
  given the numbers $a,b,c in ZZ$ and $a in ZZ_+$, if $a$ can be written as

  $
    underbracket(a = b dot c, b >= 0 "," c>= 2)
  $

  Then $a$ is a composite number. If $a$ is not a composite, then $a$ is prime.


  Example

  $18 = 3 dot 6$, ergo $18$ is a composite
  $17 = 3 dot ?$ No. $17 = 1 dot 17 = 17 dot 1 = (-17) (-1)$

  We can also further go on to say that

  $a in ZZ_+$ if and only if the only divisors in $ZZ$ are $a, -a, 1, -1$ #rect([and $a != 1$])
  ]


#theorem[
  Every possible integer can be factorized into primes in a unique way.

  $
    36 &= 6 dot 6 = 3 dot 2 dot 3 dot 2 \
    36 &= 2 dot 18 = 2 dot 2 dot 9 = 2 dot dot 2 dot 3 dot 3 \
  $

  Så $36$ can be factorized into primes in a unique way.
  This does not mean that the factorization process is unique, it just means that the factorization is unique up to the order of the factors.
]

#theorem[
  If $n = underbrace(p_1 dot p_2 dot dots.c p_k, "primes" k >= 2)$ then some $p_i <= sqrt(n)$
]


#theorem[
  There are infinitely many primes.

]

#proof[
  Proof by contradiction

  We assume that all primes: $p_1, p_2, dots p_n$

  Consider the following composite number

  $
    p_1 dot p_2 dot dots.c p_n + 1
  $

  We remember that every composite number can be factorized into primes.

  This can be written as

  $
    q_1 dot q_2, dot dots.c q_k
  $

  Where every $q_i$ is a prime. We can find $q_i$ in our factorization of $p_1 dot p_2 dot dots.c p_n + 1$.
  Meaning $q_1 = p_i$ for some $i$ so consider

  $
    1 = q_1 dots.c - p_1 dot p_2 dots.c p_i dots.c p_n = p_i (1 - p_1 dot p_2 dot dots.c cancel(p_i) dot dots.c p_n )
  $

  And $1$ can be written in a finite number of ways.

  $
    1 = (-1)(-1) or 1 dot 1
  $

  If we remember that the definition of primes is that they must be $p >= 2$, since it can't be $p = 1$.
  We have an infinite number of primes.
]

= GCD

#definition("2")[
  $d$ is a common divisor of $a, b$ if $d divides a and d divides b$, where $a,b,c in ZZ$.

  If $a > 0, b > 0$, and if $d$ is the greatest common divisor if $d$ is greater than $a$ and $b$. Therefore


  $
    d = gcd(a, b)
  $

  We can further go on to find the least common multiple of $a$ and $b$.
  Meaning the smallest number which is a multiple of both $a$ and $b$.

  $
    lcm(a, b) = (a dot b)/(gcd(a, b))
  $
]

#theorem[

  $
    gcd(a,b) dot lcm(a,b) = a dot b
  $


  Let

  $
    a &= p_1^(alpha_1) dot p_2^(alpha_1) dot dots.c p_n^(alpha_n) \
    b &= p_1^(beta_1) dot p_2^(beta_2) dot dots.c p_n^(beta_n)
  $

  Given $a = 2 dot 3^2 dot 5 dot 11^2$, and $b = 2^2 dot 5 dot 7 dot 11$

  Then

  $
    a &= 2 dot 3^2 dot 5 dot 7^0 dot 11^2 \
    b &= 2^2 dot 3^0 dot 5^1 dot 7^1 dot 11^2
  $

  Therefore $gcd$ and $lcm$ can be written as

  $
    gcd(a,b) &= p_1^(min(alpha_1, beta_1) ) dot p_2^(min(alpha_2, beta_2) ) dot dots.c p_n^(min(alpha_n, beta_n) ) "and" \
    lcm(a, b) &= p_1^(max(alpha_1, beta_1) ) dot p_2^(max(alpha_2, beta_2) ) dot dots.c p_n^(max(alpha_n, beta_n) ) \
  $

  Meaning if we can factorize $a$ and $b$ into their prime factors, we can find the greatest common divisor and the least common multiple by taking the minimum and maximum exponents of the common prime factors.

]

#example[
But how do we find the greatest common divisor?

Given $a, b$ we can find $gcd(a, b)$ and $lcm(a,b)$

Let $a = 2 dot 3^2 dot 5 dot 11^2$ and $b = 2^2 dot 5 dot 7 dot 11$, we can find all the divisors of $a$ and $b$ by looking at the prime factorization of $a$ and $b$.
You can't use numbers that are not in the factorization of $a$ and $b$.

The divisors of $a$ and $b$ can be written as

$
  d &= 2^n dot 3^m dot 5^p dot 7^q dot 11^r
$

We can then find the $gcd$ of $a$ and $b$

$

  cases(reverse: #true,
  a = 2 dot 3^2 dot 5 dot 11^2,
  b = 2^2 dot 5 dot 7 dot 11
  ) = gcd(a ,b) &= 2 dot 5 dot 11 "and" \
  lcm(a, b) &= 2^2 dot 3^2 dot 5 dot 7 dot 11^2
$
]


#example[
  Given $a, b in ZZ_+ a >= b$, we can find the $gcd(a,b)$

 Using the euclidean algorithm

$
  a = b dot q + r
$

Where $b > r$, we can actually call $r$ the second remainder

$
  a_(r_0) &= b_(r_1) dot q + r_2 \
  b &= r_2 dot q_2 + r_3 \
  r_2 &= r_3 dot q_3 + r_4 \
  &dots.v \
  r_(n - 3) &= r_(n - 2) dot q_(n -2) + r_n(n - 1) \
  r_(n -2) &= r_(n - 1) dot q_(n - 1) + r_n \
  r_(n - 1) &= r_n dot q_n + 0 \
$

So the remainders become smaller and smaller until we reach $0$. The last non-zero remainder is the greatest common divisor.
This can be proven by the fact that if we have a sequence of decreasing integers then we must reach $0$.



]
Why is $r_n$ the greatest common divisor? and is $r_n$ a common divisor?
Consider any divisor of $a, b$ say $k$. We will prove that $k divides r_n$ and $k divides "all" r_i$.

= Bezout's Identity

#note-box[
  $alpha a + beta b$ is a linear combination if $alpha, beta in RR$

]

Bezout's identity says that $d = r_n$ is an integer combination of $a$ and $b$. meaning

$
  d &= alpha dot a + beta b "where" alpha, beta in ZZ
$

Where $alpha, beta$ are called Bezout coefficients. So $r_n$ is an integer combination of $r_(n-1), r_(n-2)$

#figure(
  table(columns: 5, stroke: none,
  $j$,table.vline(),table.hline(),$r_2$,$r_1$,$q_(j+1)$,$r_2$,
  $0$,$662$,$414$,$1$,$248$,
  $1$,$414$,$248$,$1$,$166$,
  $1$,$248$,$166$,$1$,$82$,
  $2$,$166$,$82$,$2$,$2$,
  $41$,$82$,$2$,$41$,$0$
  )
)


The last non-zero remainder (row where $r_(j+1) = 2$) is the GCD.

#theorem()[
  $a | b dot c arrow.double a | c$ becomes true if $gcd(a,b) = 1$.

  $
  b dot c = q dot a \
  1 = alpha a + beta b \
  c = alpha a dot c + beta b dot c = alpha a c + beta q a = a dot (dots), "that is" a | c square
  $
]

#theorem()[
  $a dot b equiv a dot c (mod(m)) arrow.double^"?" b equiv c (mod(m))$ True if $gcd(a,m) = 1$
]

#proof[
  $ m divides a dot c - a b = a(c - b) $

  If $m$ and $a(c dot b)$ are relatively prime then $m divides c -b$. This means that $c equiv b mod m$


]




= Examples

#example[
  Find $gcd(662, 414)$

  $
    662 &= 414 dot 1 + 248 \
    414 &= 248 dot 1 + 166 \
    248 &= 166 dot 1 + 82 \
    166 &= 82 dot 2 + 2 <- "is the greatest common divisor"  \
    82 &= 2 dot 41 + 0
  $

  We can then find the Bezout coefficients

  $
    2 &= 166 - 82 dot 2 \
    &= 166 - (248-166) dot 2 \
    &= (-2)248 + 166 dot 3 \
    &= (-2)248 + (414 - 248) dot 3 \
    &= 414 dot 3 + 248(-5) \
    &= 414 dot 3 + (662 - 414)(-5) \
    &= (-5) 662 + 414 dot 8
  $

  Therefore we have $alpha = -5$ and $beta = 8$
]


= Excercises

== Exercise 4.3: 3

Find the prime factorizations of each of these integers.


#let greatest_common(a, b, show-steps: true, format: "math") = {
  // Ensure a >= b for cleaner presentation
  let (larger, smaller) = if a >= b { (a, b) } else { (b, a) }

  // Store steps for display
  let steps = ()
  let current-a = larger
  let current-b = smaller

  // Perform the Euclidean algorithm
  while current-b != 0 {
    let quotient = calc.quo(current-a, current-b)
    let remainder = calc.rem(current-a, current-b)

    // Store this step
    steps.push((current-a, current-b, quotient, remainder))

    // Update for next iteration
    current-a = current-b
    current-b = remainder
  }

  let result = current-a

  if not show-steps {
    result
  } else if format == "math" {
    // Compact math mode with alignment
    let math-lines = steps.map(step =>
      $#str(step.at(0)) &= #str(step.at(1)) dot #str(step.at(2)) + #str(step.at(3))$
    ).join($ \ $)

    [
      Finding $gcd(#str(a), #str(b))$:

      $ #math-lines $

      Therefore, $gcd(#str(a), #str(b)) = #str(result)$
    ]
  } else {
    // Original verbose format
    [
      Finding $gcd(#str(a), #str(b))$:

      #for (i, step) in steps.enumerate() [
        Step #(i + 1): $#str(step.at(0)) = #str(step.at(1)) dot #str(step.at(2)) + #str(step.at(3))$

        #if step.at(3) == 0 [
          Since the remainder is 0, $gcd(#str(step.at(0)), #str(step.at(1))) = #str(step.at(1))$
        ] else [
          So $gcd(#str(step.at(0)), #str(step.at(1))) = gcd(#str(step.at(1)), #str(step.at(3)))$
        ]

      ]

      Therefore, $gcd(#str(a), #str(b))$ = #str(result)
    ]
  }
}


== Exercise 4.3: 31

Show that if $a$ and $b$ are positive integers, then $a b = gcd(a, b) dot lcm(a, b).$

#math-hint[
  use the prime factorizations of $a$ and $b$ and the formulae for $gcd(a,b)$ and $lcm(a,b)$ in terms of these factorizations.
]


#let extended_gcd(a, b, show-steps: true, format: "verbose") = {
  // Store original values for final display
  let orig-a = a
  let orig-b = b

  // Ensure a >= b for cleaner presentation
  let (larger, smaller) = if a >= b { (a, b) } else { (b, a) }
  let swapped = a < b

  // Initialize variables for extended algorithm
  let steps = ()
  let current-a = larger
  let current-b = smaller

  // Coefficients: we maintain old_r = old_s*a + old_t*b and r = s*a + t*b
  let old-s = 1; let s = 0
  let old-t = 0; let t = 1

  // Perform the Extended Euclidean algorithm
  while current-b != 0 {
    let quotient = calc.quo(current-a, current-b)
    let remainder = calc.rem(current-a, current-b)

    // Store this step with coefficients
    steps.push((
      current-a,    // r_i
      current-b,    // r_{i+1}
      quotient,     // q_i
      remainder,    // r_{i+2}
      old-s,        // s_i
      s,            // s_{i+1}
      old-t,        // t_i
      t             // t_{i+1}
    ))

    // Update remainders
    current-a = current-b
    current-b = remainder

    // Update coefficients
    let new-s = old-s - quotient * s
    let new-t = old-t - quotient * t
    old-s = s; s = new-s
    old-t = t; t = new-t
  }

  let gcd = current-a
  let x = old-s
  let y = old-t

  // If we swapped inputs, we need to swap the coefficients back
  if swapped {
    let temp = x
    x = y
    y = temp
  }

  if not show-steps {
    (gcd: gcd, x: x, y: y)
  } else if format == "math" {
    // Compact math mode
    let division-lines = steps.map(step =>
      $#str(step.at(0)) &= #str(step.at(1)) dot #str(step.at(2)) + #str(step.at(3))$
    ).join($ \ $)

    [
      Finding $op("gcd")(#str(orig-a), #str(orig-b))$ and Bézout coefficients:

      *Division steps:*
      $ #division-lines $

      *Back-substitution:*

      Working backwards to express $#str(gcd)$ as a linear combination:

      $#str(orig-a) dot (#str(x)) + #str(orig-b) dot (#str(y)) = #str(gcd)$

      *Result:* $gcd(#str(orig-a), #str(orig-b)) = #str(gcd)$, where $x = #str(x)$, $y = #str(y)$
    ]
  } else if format == "table" {
    // Table format showing the algorithm step by step
    [
      Finding $op("gcd")(#str(orig-a), #str(orig-b))$ using Extended Euclidean Algorithm:

      #figure(
        table(
        columns: 6,
        align: center,
        [index $i$], $r$, $q$, $r'$, $s$, $t$,
        ..steps.enumerate().map(((i, step)) => (
          str(i + 1),
          str(step.at(0)),
          str(step.at(2)),
          str(step.at(3)),
          str(step.at(4)),
          str(step.at(6))
        )).flatten()
      ))

      *Result:*
      - $op("gcd")(#str(orig-a), #str(orig-b)) = #str(gcd)$
      - $#str(orig-a) dot (#str(x)) + #str(orig-b) dot (#str(y)) = #str(gcd)$
    ]
  } else {
    // Verbose format
    [
      Finding $gcd(#str(orig-a), #str(orig-b))$ using Extended Euclidean Algorithm:

      #for (i, step) in steps.enumerate() [
        *Step #(i + 1):*

        Division: $#str(step.at(0)) = #str(step.at(1)) dot #str(step.at(2)) + #str(step.at(3))$

        Coefficients: $s_#i = #str(step.at(4))$, $t_#i = #str(step.at(6))$, $s_#(i+1) = #str(step.at(5))$, $t_#(i+1) = #str(step.at(7))$

      ]

      *Final Result:*
      - $gcd(#str(orig-a), #str(orig-b)) = #str(gcd)$
      - Bézout coefficients: $x = #str(x)$, $y = #str(y)$
      - Verification: $#str(orig-a) dot (#str(x)) + #str(orig-b) dot (#str(y)) = #str(gcd)$
    ]
  }
}


#solution[
  Let $a = 677$, $b = 322$. Then $ 677 dot 322 = #calc.abs(677 * 322) $

  We can then prove that $gcd(a,b) dot lcm(a,b) = a b$

  Firstly we will find the $gcd(a,b)$

  $
    677 &= 322 dot 2 + 33 \
    322 &= 33 dot 9 + 25 \
    33 &= 25 dot 1 + 8 \
    25 &= 8 dot 3 + 1 \
    8 &= 1 dot 8 + 0
  $


  Therefore we have that the gcd is $1$. We can use the relation between $gcd$ and $lcm$ to find the $lcm$

  $
    lcm(a,b) = (abs(a dot b) )/(gcd(a,b))
  $

  We then solve this

  $
    lcm(677, 322) &= (abs(677 dot 322))/(gcd(677, 322)) \
    &= (abs(217994))/(1) \
    &= 217994/1 \
    &= 217994
  $

  Therefore we have the equality that
  $ 677 dot 322 &= gcd(677, 322) dot lcm(677, 322) $


]


== Exercise 4.3: 49

Prove that the product of any three consectutive integers is divisible by $6$.

#solution[
  We have the claim that the product of three consecutive integers is divisible by 6.
  We can write this as

  Therefore we can write
  $
    n (n + 1) (n + 2) mod 6 = 0
  $

  where $n in ZZ$, and the rest the integers $mod 6$ is $0$.
  We can prove this by induction. Let $P(n)$ be the statement that $n (n + 1) (n + 2) mod 6 = 0$.

  We have the base case of $P(0)$ this is true since

  $
    P(0) = 0(0 + 1) (0 + 2) mod 6 = 0 mod 6 = 0
  $

  Induction hypothesis: Assume that $P(k)$ is true for some $k in ZZ$. If $P(k)$ is true then it holds that $P(k + 1)$ is true.
  Where for a particular $k$, the single case $k = n$ holds.

  $
    k dot (k + 1) dot (k + 2) mod 6 = 0
  $

  We can show that $P(k + 1)$ is true by induction.

  $
    P(k + 1) - P(k) &= (k + 1)(k + 1)(k + 2) mod 6 - k(k + 2)(k + 3) mod 6 \
    &= (k + 1)(k+ 2)[(k + 3) - k] \
    &= (k + 1)(k+ 2)[3] \
    &= 3(k + 1)(k+ 2) \
    &= 3(k^2 + 3k + 2) \
    &= 3(k^2 + 3k + 2) mod 6 \
    &= 0 mod 6 \
    &= 0
  $

]
