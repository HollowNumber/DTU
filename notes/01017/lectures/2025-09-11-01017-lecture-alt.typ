= Discrete Math - Proof Methods

== Direct Proof

*Goal:* Prove that $p arrow.r q$ through several steps of reasoning

=== Definitions

*Even Integer:* An integer $n$ is even *if* there exists $k in ZZ$ such that $n = 2k$

*Odd Integer:* An integer $n$ is odd *if* there exists $k in ZZ$ such that $n = 2k + 1$

=== Example: If $n$ is odd, then $n^2$ is odd

*Proof:*

Assume $n$ is odd. Then there exists $k in ZZ$ such that:
$ n = 2k + 1 $

Therefore:
$ n^2 &= (2k + 1)^2 \
     &= 4k^2 + 4k + 1 \
     &= 2(2k^2 + 2k) + 1 $

Since $k in ZZ$, we have $2k^2 + 2k in ZZ$.

Therefore, $n^2$ is odd. $square$

== Proof by Contraposition

*Method:* Prove $p arrow.r q$ by proving $not q arrow.r not p$ (the contrapositive)

=== Example: For an integer $n$, if $n^2$ is odd, then $n$ is odd

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

By contraposition, if $n^2$ is odd, then $n$ is odd. $square$

== Proof by Contradiction

*Method:* To prove statement $p$, assume $not p$ and derive a contradiction

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

*Contradiction:* We now have both $a$ and $b$ are even, meaning they share the common factor 2. This contradicts our assumption that $gcd(a,b) = 1$.

Therefore, our assumption was false, and $sqrt(2)$ is irrational. $square$

= Sets

== Definition

A set is an unordered collection of objects called elements (or members) of the set.

We say a set _contains_ its elements.

- $a in A$ means $a$ is an element of the set $A$
- $a in.not A$ means $a$ is NOT an element of $A$

We call this *naive set theory*, which leads to some paradoxes:
- Russell's paradox (exercise 50 in 2.1)

=== Examples of Sets

$ A &= {1, 2, 3, 4} \
  B &= {a, b, c, d} \
  C &= {"apple", 7, "Mike", "Tivoli"} $

=== Set Builder Notation

$ {x | x "has property" P} $

*Example:*
$ O &= {x | x "is an odd integer"} \
    &= {x in ZZ | x "is odd"} $

== Important Sets

$NN = {0, 1, 2, 3, 4, ...}$ — set of natural numbers
#h(1fr) _(no universal agreement on whether 0 is in $NN$)_

$ZZ = {..., -2, -1, 0, 1, 2, ...}$ — set of integers

$QQ = {a/b | a, b in ZZ, b != 0}$ — set of rational numbers

$RR$ — set of real numbers

$CC$ — set of complex numbers

=== Note on Set Containment

A set can contain other sets as elements:
$ {NN, ZZ, QQ, RR} $

This set doesn't contain numbers like 2; it specifically contains the sets $NN$, $ZZ$, $QQ$, and $RR$ as elements.

== Set Equality

=== Definition

Two sets $A$ and $B$ are equal if and only if they contain exactly the same elements.

Another way of saying this:
$ A = B "iff" forall x (x in A arrow.l.r.double x in B) $

*Examples:*
- ${1, 3, 5} = {1, 5, 3} = {1, 3, 3, 5, 5, 5, 5}$
  _(The number of identical elements in a set is irrelevant)_
- For ${a, b, c, d, e}$ with variables, you'd still have to write all elements down, not knowing if two variables were the same.

=== The Empty Set

The empty set $emptyset$ is the set with no elements.

*Note:* ${emptyset} != emptyset$

=== Singleton Sets

A *singleton set* is a set with exactly one element.

*Examples of singleton sets:*
- ${emptyset}$
- ${{emptyset}}$

*Not a singleton:*
- ${emptyset, {emptyset}}$ _(contains two elements)_

== Subsets

=== Definition

$A$ is a _subset_ of $B$ (and $B$ is a _superset_ of $A$) if and only if every element of $A$ is an element of $B$.

Notation: $A subset.eq B$ or $B supset.eq A$

*To prove $A subset.eq B$:* Show that if $x in A$, then $x in B$

*To prove $A subset.eq.not B$:* Find some $x in A$ such that $x in.not B$

=== Examples

$ NN subset.eq ZZ subset.eq QQ subset.eq RR subset.eq CC $

$ {x in ZZ | x "is odd"} subset.eq.not {x in ZZ | x "is even"} $

$ {1, 2, 3} &subset.eq {1, 2, 3, 4} \
  {1, 2, 3} &subset.eq.not {2, 3, 4, 5} $

=== Theorem

For any set $S$, both $emptyset$ and $S$ are subsets of $S$:
$ emptyset subset.eq S "and" S subset.eq S $

The statement $forall x (x in emptyset arrow.double x in S)$ is vacuously true.

---

*Important:* $A = B$ if and only if $A subset.eq B$ and $B subset.eq A$

== The Size of a Set (Cardinality)

=== Definition

Let $S$ be a set. If there are exactly $n$ distinct elements in $S$ where $n in NN$, then we say that $S$ is a _finite set_ with *cardinality* $n$.

Notation: $|S| = n$

=== Examples

$ A &= {x in ZZ | x "is odd and" x <= 10} \
  |A| &= 5 \
  |emptyset| &= 0 $

A set is *infinite* if it is not finite.

== The Power Set

=== Definition

Let $S$ be a set. The _power set_ of $S$, denoted $cal(P)(S)$, is the set of all subsets of $S$.

=== Example

$ cal(P)({0, 1, 2}) = {emptyset, {0}, {1}, {2}, {0, 1}, {0, 2}, {1, 2}, {0, 1, 2}} $

*Important formula:* If $|S| = n$, then $|cal(P)(S)| = 2^n$

*Special case:* $cal(P)(emptyset) = {emptyset}$

== Cartesian Products

=== Definition: Tuples

The (ordered) $n$-tuple $(a_1, a_2, ..., a_n)$ is the ordered collection that has $a_i$ as its $i$-th element.

$ (a_1, a_2, ..., a_n) = (b_1, b_2, ..., b_n) "iff" a_i = b_i "for all" i = 1, 2, ..., n $

*Note:* 2-tuples are called _ordered pairs_

$(a, b) != (b, a)$ in general

=== Definition: Cartesian Product of Multiple Sets

The Cartesian product of sets $A_1, A_2, ..., A_n$, denoted by $A_1 times A_2 times ... times A_n$, is the set of $n$-tuples $(a_1, a_2, ..., a_n)$ such that $a_i in A_i$ for all $i = 1, 2, ..., n$.

=== Important Notes

$A times (B times C) != (A times B) times C != A times B times C$

*Notation for powers:*
- $A^2 = A times A$
- $A^3 = A times A times A$
- $A^n = {(a_1, ..., a_n) | a_i in A "for all" i}$

== Relations

=== Definition

A subset $R$ of $A times B$ is a _relation_ from $A$ to $B$.

A relation from $A$ to itself is called a _relation on $A$_.

=== Example

Let $A = {0, 1, 2, 3}$

Define $R = {(a, b) | a, b in A "and" a <= b}$

Then $R = {(0, 0), (0, 1), (0, 2), (0, 3), (1, 1), (1, 2), (1, 3), (2, 2), (2, 3), (3, 3)}$
