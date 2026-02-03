#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01017",
  course-name: "Discrete Mathematics",
  title: "Lecture - September 11, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Discrete Math - Proof Methods

== Direct Proof

#proof()[
  Prove that $p -> q$ through several steps of reasoning
]

#definition("")[
  *Even Integer*: An integer $n$ is even *if* there exists $k in ZZ$, such taht $n = 2k$

  *Odd Integer*: An integer $n$ is odd *if* there exists $k in ZZ$ such that $n = 2k + 1$

]

#proof[
  ==== Example: If $n$ is odd, then $n^2$ is odd


  Assume $n$ is odd. Then there exists $k in ZZ$ such that:
  $ n = 2k + 1 $

  Therefore:
  $ n^2 &= (2k + 1)^2 \
       &= 4k^2 + 4k + 1 \
       &= 2(2k^2 + 2k) + 1 $

  Since $k in ZZ$, we have $2k^2 + 2k in ZZ$.

  Therefore, $n²$ is odd.
]


== Proof by Contraposition

#proof[


  *Method:* Prove $p arrow.r q$ by proving $not q arrow.r not p$ (the contrapositive)

  #example[
    ===== Example: For an integer $n$, if $n^2$ is odd, then $n$ is odd

    Instead of proving this directly, we prove the contrapositive:
    _If $n$ is even, then $n^2$ is even_

    *Proof:*

    Suppose $n$ is even. Then there exists $k in ZZ$ such that:
    $ n = 2k $

    Therefore:
    $ n^2 &= (2k)^2 \
         &= 4k^2 \
         &= 2(2k^2) $

    Since $2k^2 in ZZ$, we have that $n^2$ is even.

  ]



  By contraposition, if $n^2$ is odd, then $n$ is odd. $square$

]


== Proof by Contradiction

#proof[

  *Method:* To prove statement $p$, assume $not p$ and derive a contradiction

  #example[
  === Example: $sqrt(2)$ is irrational

  *Definition:* A real number $r$ is rational if there exist $a, b in ZZ$ with $b != 0$ such that $r = a/b$

  *Proof:*

  Assume (for contradiction) that $sqrt(2)$ is rational.

  Then there exist $a, b in ZZ$ with $b != 0$ such that $sqrt(2) = a/b$.

  We can assume that $gcd(a,b) = 1$ (i.e., $a$ and $b$ have no common factors).

  Squaring both sides:
  $ 2 = a^2/b^2 $

  Therefore:
  $ 2b^2 = a^2 $

  This means $a^2$ is even, which implies $a$ is even.

  Since $a$ is even, there exists $k in ZZ$ such that $a = 2k$.



  Substituting:
  $ 2b^2 &= (2k)^2 = 4k^2 \
  arrow.double b^2 &= 2k^2 $

  This means $b^2$ is even, which implies $b$ is even.

  ]

  *Contradiction:* We now have both $a$ and $b$ are even, meaning they share the common factor 2. This contradicts our assumption that $gcd(a,b) = 1$.

  Therefore, our assumption was false, and $sqrt(2)$ is irrational.
]
