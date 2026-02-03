#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01017",
  course-name: "Discrete Mathematics",
  title: "Lecture - November 13, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Inclusion Exclusion

== Hat Problem

Suppose there is a room of a $n$ people, every time a person enters a room they put their hat inside of a box, what is the probability that every person gets their own hat back?

$
  1/n!
$

Inversely what is the probability that someone will *not* get their hat back?

$
  1 - 1/n!
$

Going on what is the probability that *someone* will get or no one *will* get it back?

let $p$ be the probability that someone will get their hat back, then inversely $p^(-1)$ will be the probability that no one will get their hat back.

$

$

The answer to either is $37.8%$



#definition(title: "Inclusion Exclusion principle")[
  Given two sets $A, B$ we define the union of their cardinalities as

  $
    abs(A + B) = abs(A) + abs(B) - abs(A inter B)
  $

  Now what if we have three sets $A,B,C$?

 $
   abs(A union B union C) &= abs(A) + abs(B) + abs(C) \ &- abs(A inter B) - abs(A inter C) - abs(B - C)\ &+ abs(A inter B inter C)
 $
 This is because some elements in the sets aren't properly counted towards the sum of the three cardinalities of $A,B "and" C$
]


#definition(title: "Cardinality of many sets")[
  Suppose we want to find the cardinality of $abs(A_1 union A_2 union dots union A_n)$, how do we find this?

  We find this by taking the cardinality of each set, and subtract every set with each other

  $
    abs(A_1 union A_2 union dots union A_n) &= \ &abs(A_1) + abs(A_2) + dots.c + abs(A_n) \ &- abs(A_1 inter A_2) - abs(A_1 inter A_3) dots.c - abs(A_(n-1) inter A_n) \
    &+ abs(A_1 inter A_2 inter A_3) + abs(A_1 inter A_2 inter A_4) + dots.c + abs(A_(n-1) inter A_(n-1) inter A_n) \
    &+ abs(A_1 inter A_2 inter A_3 inter A_4 inter A_5) + dots.c (-1)^(n + 1) abs(A_1 inter A_2 inter dots inter A_n)
  $

  This can be expressed as a sum

  $
    &sum^n_(i = 1) abs(A_i) - \ &sum_(i <= i_1 < i_2 <= n) A_i_1 inter A_i_2 + dots.c  \ &(-1)^(k+1) sum_(i_1 < i_2 < i_n) abs(A_i_1 inter A_i_2 inter dots.c inter A_i_k) + dots (-1)^(n +1) abs(A_1 inter dots.c inter A_n)
  $
]

#proof[
  Focus on any $x in A_1 union A_2 union dots union A_n$ and see how many times it is counted.
  Let $k$ be the number of $i$ such that $x in A_i$, we can then write this as a binomial equation
  // Sometihng
  $
    underbrace(-binom(k,0)+binom(k, 1) - binom(k,2) + binom(k, 3) - binom(k, 4) + binom(k, 5) - dots.c (-1)^(k+1) binom(k,k), "Row of Pascal's Triangle") + 1 =  1
  $
]


#example[
  Condier a set $A$ with $N$ elements. The set has the properties $P_1, P_2, P_3, dots, P_n$.

  $N(P_3 P_5 P_6 P_9) = $ number of elements with each of the properties $P_3, P_5, P_6, P_9$. inversely:
  $N(P'_3 P'_5 P'_6 P'_9) =$ number of elements with none of the properties $P_3, P_5, P_6, P_9$.

  Using the inclusion/exclusion principle:

  $
    N(P'_1 P'_2 dots.c P'_n) = N - sum^n_(i=1) N(P_i) + sum_(i_1 < i_2) N(P_i_1 P_i_2) + dots.c (-1)^n N(P_1 P_2 dots P_n)
  $
]

#proof[
  Put $A_i = "the elements with property" P_i$
]


== Permutations

Let set $n = {1,2,3,4}$, a permutation of a set is the ways that a set can be arranged without changing the elements.
A permutation is a bijection from ${1,2,3,4} "to" {1,2,3,4}$. A permutation can have a fixed point, which is where an element is mapped to itself.

$
  mat(1, 2, 3, 4; 2,3,1,4)
$

Where $4$ maps to itself and is therefore a fixed point.

#definition(title: "Derangement")[
A derangement is a bijection $pi$ of a set $s$ onto $s$ with no fixed point. That is:
$
  pi(i) != i
$

Let $A$ be the set of all permutations of ${1,2,dots, n}$, let us denote the set of all permutations $pi$ such that $pi(i) = i$. Let the derangmenet be denoted as $D_n$, then the number of derangements is:

$
  D_n = abs(A backslash (union.big^n_(i=1) A_i )) &= abs(A) - sum^n_(i=1) - sum_(i_1 < i_2) abs(A_i_1 inter A_i_2) dots.c plus.minus (-i)^n abs(A_1 inter A_2 inter dots inter A_n) \
  &= n! - binom(n,1) (n-1)! + binom(n,2) (n-2)! + binom(n,3) (n-3)! \ &dots.c  (-1)^k binom(n, k) (n-k)!\
  &plus.minus abs(A_1 inter A_2 inter dots inter A_n)
$


This can be expressed as a sum

$
  sum^n_(k=0) (-1)^k binom(n,k) (n-k)! &= sum (-1)^k n!/(n! (n-k)! ) (n-k)! \  &= n! sum^n_(k=0) (-1)^k/k! \
  &= n! [1 - 1/1! + 1/2! - 1/3! + dots.c + (-1)^n 1/n! ] \
  &=   m! dot 1/e \ &= n! 1/2.718281828  \
  &= 0.378 n! \
$
]

The number of primes $<= 100$. The same as saying $100-"not primes"$

Put $ A&={1,2,dots,100}\ A_2 &="The numbers divisible by 2"\ A_3&="The numbers divisible by 3"\ A_5&="The numbers divisible by 5"\ A_7&="The numbers divisible by 7" $

Number of primes
$ &=100-|A_2 union A_3 union A_5 union A_7|-1+4 - |A_2|-|A_3|-|A_5|-|A_7|+|A_2 inter A_3|+dots\
&=103-50-33-20-14+16+14+6+dots=25
$
($-1$ because 1 is not a prime, and $+4$ because else we're excluding $2,3,5,7$)

= Opgaver


#math-problem(number: 5)[
  Find the number of elements in $A_1 union A_2 union A_3$ if there are 100 elements in each set and if

  + The sets are pairwise disjoint.
  + There are $50$ common elements in each pair of sets and no elements in all three sets.
  + There are $50$ common elements in each pair of sets and 25 elements in all three sets.
  + The sets are equal
]

#solution[
  1.

  Since the sets are pairwise disjoint, the number of elements in $A_1 union A_2 union A_3$ is simply the sum of the number of elements in each set, which is $100 + 100 + 100 = 300$.

  2.

  Since there are $50$ common elements in each pair of sets and no elements in all three sets, the number of elements in $A_1 union A_2 union A_3$ is $100 + 100 + 100 - 50 - 50 - 50 = 150$.

  3.

  Since there are $50$ common elements in each pair of sets and $25$ elements in all three sets, the number of elements in $A_1 union A_2 union A_3$ is $100 + 100 + 100 - 50 - 50 - 50 + 25 = 175$.

  4.
  Since the sets are equal, the number of elements in $A_1 union A_2 union A_3$ is simply the number of elements in one set, which is $100$.
]


#math-problem(number: 11)[
Find the number of positive integers not exceeding $1000$ that are not divisible by 3, 17, or 35.
]

#solution[
  We can express the number of positive integers not exceeding $1000$ that are not divisible by 3, 17, or 35 as $1000 - |A_3 union A_17 union A_35|$, where $A_3$, $A_17$, and $A_35$ are the sets of positive integers not exceeding $1000$ that are divisible by $3$, $17$, and $35$, respectively.

  So we can use the principle of inclusion-exclusion to find the number of elements in $A_3 union A_17 union A_35$:

  $abs(A_3 union A_17 union A_35) = abs(A_3) + abs(A_17) + abs(A_35) - abs(A_3 inter A_17) - abs(A_3 inter A_35) - abs(A_17 inter A_35) + abs(A_3 inter A_17 inter A_35)$

  Since $abs(A_3) = 1000/3 = 333$, $abs(A_17) = 1000/17 = 58$, and $abs(A_35) = 1000/35 = 28$, we have:

  $abs(A_3 union A_17 union A_35) = 333 + 58 + 28 - 17 - 14 - 10 + 6 = 390$

  Therefore, the number of positive integers not exceeding $1000$ that are not divisible by 3, 17, or 35 is $1000 - 390 = 610$.
]



#math-problem(number: 15)[
  How many bit strings of length eight do not contain six consecutive $0$s?
]


#solution[

]


#math-problem(number: 23)[
  Write out the explicit formula given by the principle of inclusion-exclusion for hte number of elements in the union of six sets when it is known that no three of these sets havea  common intersection.
]


#solution[
  Let the sets $A_1, A_2, A_3, A_4, A_5, A_6$ be the sets of elements in the union of six sets when it is known that no three of these sets have a common intersection.

  We find the ansawer to be:
]


#math-problem(number: "8.6.5")[
  Find the number of primes less than $200$ using the principle of inclusion-exclusion.
]


#solution[
  We can find the number of primes less than $200$

  Let $P$ be the set of primes less than $200$. Then $abs(P)$ is the number of primes less than $200$.

  We can express $abs(P)$ as $abs(P) = |P inter A_3| + |P inter A_17| + |P inter A_35| - |P inter A_3 inter A_17| - |P inter A_3 inter A_35| - |P inter A_17 inter A_35| + |P inter A_3 inter A_17 inter A_35|$.

  Since $|P inter A_3| = abs(P)/3$, $|P inter A_17| = abs(P)/17$, and $|P inter A_35| = abs(P)/35$, we have:

  $abs(P) = abs(P)/3 + abs(P)/17 + abs(P)/35 - abs(P)/51 + abs(P)/105 - abs(P)/595 + abs(P)/1785$

  Therefore, the number of primes less than $200$ is $abs(P) = 46$.
]
