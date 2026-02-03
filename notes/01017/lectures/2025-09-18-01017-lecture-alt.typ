#import "@preview/cetz:0.4.0"
#import "@preview/cetz-venn:0.1.4"

= Sets and Set Functions

$forall x in S (P(x))$ means $forall x (x in S arrow P(x))$

$forall x in RR (x^2 >= 0)$

$exists x in ZZ (x^2=2)$

== Union

=== Definition
Let A & B be sets.

The #underline[union] of A & B denoted $A union B$, is the set that contains every element that is in either A or B or both.

$ A union B = {x| x in A or x in B} $

#cetz.canvas({
  cetz-venn.venn2(
    name: "union-venn",
    a-fill: blue.lighten(60%),
    b-fill: blue.lighten(60%),
    ab-fill: blue.lighten(40%)
  )
  
  import cetz.draw: *
  content("union-venn.a", [A], text-size: 14pt)
  content("union-venn.b", [B], text-size: 14pt)
})

$ {1,3,5} union {1,2,3,5} = {1,2,3,5} $

== Interinterion

=== Definition
Let A & B be sets. The #underline[interinterion] of A & B denoted $A inter B$ is the set containing those elements that are BOTH in A AND B.

$ A inter B = {x| x in A and x in B} $

#cetz.canvas({
  cetz-venn.venn2(
    name: "interinter-venn",
    ab-fill: green.lighten(40%)
  )
  
  import cetz.draw: *
  content("interinter-venn.a", [A], text-size: 14pt)
  content("interinter-venn.b", [B], text-size: 14pt)
})

${1,3,5} inter {1,3} = {1,3}$

== Disjoint

=== Definition
A & B are #underline[Disjoint] if $A inter B = emptyset$

$ {1,3,5,7} inter {2,4,6,8} = emptyset $ 

Therefore those 2 sets are disjoint.

== Inclusion-Exclusion Principle

If A & B are finite sets then
$ |A union B| = |A| + |B| - |A inter B| $

This is called the "inclusion-exclusion" principle.

== Set Difference

=== Definition
Let A & B be sets. The #underline[difference] of A & B denoted $A - B$ is the set containing those elements that are in A but not in B.

$ A - B = {x| x in A and x in.not B} $ 

Sometimes written as $A \\ B$

#cetz.canvas({
  cetz-venn.venn2(
    name: "diff-venn",
    a-fill: red.lighten(60%)
  )
  
  import cetz.draw: *
  content("diff-venn.a", [A], text-size: 14pt)
  content("diff-venn.b", [B], text-size: 14pt)
  
  // Add label for the shaded region
  content("diff-venn.a", [$A - B$], anchor: "south-east", text-size: 14pt)
})

#underline[If $A - B = emptyset$, does $A = B$? No.] (A could just be a subset of B)

== Universal Set and Complement

=== Definition
Let $UU$ be the #underline[Universal set]. 

The complement of a set $A$, is the set containing all the elements of $UU$ that are not in $A$.

$macron(A) = UU - A$

#cetz.canvas({
  import cetz.draw: *
  
  // Draw universal set boundary (rectangle)
  rect((0, 0), (4, 3), fill: yellow.lighten(80%), stroke: black + 2pt, name: "universal")
  
  // Draw set A (circle) - unfilled since complement is everything BUT A
  circle((2, 1.5), fill: white, stroke: black + 1pt, name: "setA")
  
  // Labels
  content("setA", [A], text-size: 14pt)
  content((0.3, 2.7), [$UU$], text-size: 14pt, fill: black)
  content((3.5, 0.3), [$macron(A)$], text-size: 12pt, fill: black)
})

Examples:
$ UU = NN "  " A &= {1,3,5,7} \ macron(A) &= {0,2,4,6,8,9,10,...} $

$ UU = ZZ "  " A &= {1,3,5,7} \ macron(A) &= {...,-2,-1,0,2,4,6,8,9,...} $

=== Exercise: Show that $A - B = A inter macron(B)$

*Proof:* 
$A - B = {x | x in A and x in.not B}$

$A inter macron(B) = {x | x in A and x in macron(B)}$
$= {x | x in A and x in (UU - B)}$
$= {x | x in A and x in.not B}$

Therefore, $A - B = A inter macron(B)$ ∎

== Set Identities

#underline[Set Identities] (See Table 1 in interion 2.2)

*Identity Laws:*
$ A union A = A, quad A inter A = A $

*Domination Laws:*
$ A inter UU = A, quad A union emptyset = A $

*Complement Laws:*
$ macron(macron(A)) = A $

*De Morgan's Laws:*
$ overline(A union B) = macron(A) inter macron(B) $
$ overline(A inter B) = macron(A) union macron(B) $

=== Proof of De Morgan's Law: $overline(A union B) = macron(A) inter macron(B)$

$ 
x &in overline(A union B) arrow.l.r.double \ 
x &in.not (A union B) arrow.l.r.double \
x &in.not A and x in.not B arrow.l.r.double \
x &in macron(A) and x in macron(B) arrow.l.r.double \
x &in macron(A) inter macron(B)
$

Therefore, $overline(A union B) = macron(A) inter macron(B)$ ∎

== Distributive Laws

*Distributive Law:* $A union (B inter C) = (A union B) inter (A union C)$

#cetz.canvas({
  cetz-venn.venn3(
    name: "distrib-venn",
    a-fill: blue.lighten(60%),
    ab-fill: blue.lighten(50%),
    ac-fill: blue.lighten(50%),
    abc-fill: blue.lighten(40%),
    bc-fill: green.lighten(60%)
  )
  
  import cetz.draw: *
  content("distrib-venn.a", [A], text-size: 14pt)
  content("distrib-venn.b", [B], text-size: 14pt)  
  content("distrib-venn.c", [C], text-size: 14pt)
  
  // Label for the diagram
  content((0, -2.5), [$A union (B inter C)$], text-size: 12pt, anchor: "center")
})

This Venn diagram shows $A union (B inter C)$ where:
- The blue regions represent all elements in A
- The green region represents elements in both B and C (but not in A)
- Together, these shaded areas represent $A union (B inter C) = (A union B) inter (A union C)$

== Associative Law

$A union (B union C) = (A union B) union C$

$A union B union C = {x| x in A or x in B or x in C}$

== Indexed Families of Sets

For finite collections:
$union.big_(i=1)^n A_i = {x| exists i in {1,...,n} "such that" x in A_i}$

$inter.big_(i=1)^n A_i = {x| forall i in {1,...,n}, x in A_i}$

For infinite collections:
$union.big_(i=1)^infinity A_i = {x| exists i in ZZ^+ "such that" x in A_i}$

$inter.big_(i=1)^infinity A_i = {x| forall i in ZZ^+, x in A_i}$

=== Example
Let $A_i = {1,2,3,...,i}$ for $i in ZZ^+$

Then:
- $A_1 = {1}$
- $A_2 = {1,2}$  
- $A_3 = {1,2,3}$
- And so on...

*Union:* $union.big_(i=1)^infinity A_i = {1,2,3,4,...} = ZZ^+$

*Interinterion:* $inter.big_(i=1)^infinity A_i = {1}$

=== General Index Sets

For any index set $I$:
$union.big_(i in I) A_i = {x| exists i in I "such that" x in A_i}$

$inter.big_(i in I) A_i = {x| forall i in I, x in A_i}$

= Functions

== Basic Definition

=== Definition
Let A & B be nonempty sets. A #underline[function] $f$ from A to B is an assignment of exactly one element of B to each element of A. 

We write $f(a) = b$ if $b$ is the element of $B$ that $f$ assigns to $a$.

We write $f: A arrow B$ to denote that $f$ is a function from $A$ to $B$.

Note: $(a, f(a)) in A times B$ (this is an ordered pair in the Cartesian product)

=== Definition: Domain and Codomain
Let $f: A arrow B$:
- The #underline[domain] of $f$ is $A$
- The #underline[codomain] of $f$ is $B$
- If $f(a) = b$, then $b$ is the #underline[image] of $a$ under $f$, and $a$ is a #underline[preimage] of $b$

=== Example
Let:
- $A = {a, b, c, d}$
- $B = {1, 2, 3, 4}$

Define $f: A arrow B$ where:
$f(a) = 1, f(b) = 3, f(c) = 1, f(d) = 4$

---

=== Example: Common Function Types
$f: ZZ arrow ZZ$ where $f(x) = x^2$

*Terminology:*
- "Real-valued function": codomain = $RR$
- "Integer-valued function": codomain = $ZZ$

== Function Operations

=== Definition: Addition and Multiplication of Functions
Let $f_1$ and $f_2$ be real-valued functions from $A$. Then $f_1 + f_2$ and $f_1 f_2$ are functions from $A$ to $RR$ defined as:

$(f_1 + f_2)(x) = f_1(x) + f_2(x)$

$(f_1 f_2)(x) = f_1(x) f_2(x)$

=== Example
Let $f_1, f_2: RR arrow RR$ where:
- $f_1(x) = x^2$
- $f_2(x) = x - x^2$

Then:
$(f_1 + f_2)(x) = x^2 + (x - x^2) = x$

$(f_1 f_2)(x) = x^2(x - x^2) = x^3 - x^4$

== Image of a Set

=== Definition
Let $f: A arrow B$. If $S subset.eq A$, then the #underline[image] of $S$ under $f$, denoted $f(S)$, is the set:

$f(S) = {b in B | exists a in S "such that" f(a) = b}$

=== Example
Let $f: ZZ arrow ZZ$ where $f(x) = x^2$

If $S = {-1, 0, 1}$, then:
$f(S) = {0, 1}$

(Note: Both $f(-1) = 1$ and $f(1) = 1$, so 1 appears once in the image)

== Special Properties of Functions

=== Definition: One-to-One (Injective)
A function $f: A arrow B$ is #underline[one-to-one] (or #underline[injective]) if:

$f(x) = f(y) arrow.double x = y, quad forall x, y in A$

Equivalently: $x eq.not y arrow.double f(x) eq.not f(y)$

=== Definition: Increasing Functions
Let $f: A arrow B$ where $A, B subset.eq RR$.

Then $f$ is #underline[increasing] if:
$x < y arrow.double f(x) < f(y), quad forall x, y in A$

(Note: Some definitions use $x eq.lt y arrow.double f(x) eq.lt f(y)$ for "non-decreasing")

=== Definition: Onto (Surjective)
A function $f: A arrow B$ is #underline[surjective] (or #underline[onto]) if:

$forall b in B, exists a in A "such that" f(a) = b$

In other words, every element in the codomain $B$ has at least one preimage in $A$.

=== Example: Surjective Function
$f: ZZ arrow ZZ$ where $f(x) = x - 1$

*Proof that $f$ is surjective:*
Let $k in ZZ$. We need to show there exists $a in ZZ$ such that $f(a) = k$.

Choose $a = k + 1$. Then $a = k + 1 in ZZ$ and:
$f(k + 1) = (k + 1) - 1 = k$

Therefore, $f$ is surjective.

=== Example: Another Surjective Function
$f: RR arrow RR$ where $f(x) = 2x$

*Proof that $f$ is surjective:*
Let $y in RR$. Choose $x = y/2 in RR$. Then:
$f(y/2) = 2(y/2) = y$

Therefore, $f$ is surjective.

=== Definition: Bijection
A function $f: A arrow B$ is a #underline[bijection] (or #underline[one-to-one correspondence]) if it is both injective and surjective.

*Properties of bijections:*
- Every element in $A$ maps to a unique element in $B$ (injective)
- Every element in $B$ has exactly one preimage in $A$ (surjective)
- Bijections establish a perfect "pairing" between sets $A$ and $B$

=== Example: Identity Function
$f: A arrow A$ where $f(x) = x$ is a bijection.

*Proof:*
- *Injective:* If $f(x) = f(y)$, then $x = y$ by definition
- *Surjective:* For any $a in A$, we have $f(a) = a$, so every element maps to itself

== Visual Examples of Function Properties

=== Example 1: Not Onto (Not Surjective)
$A = {a, b, c}$, $B = {1, 2, 3, 4}$

#cetz.canvas({
  import cetz.draw: *
  
  // Domain A
  circle((0, 3), radius: 0.1, fill: blue, name: "a")
  circle((0, 2), radius: 0.1, fill: blue, name: "b") 
  circle((0, 1), radius: 0.1, fill: blue, name: "c")
  content((-0.5, 3), [a])
  content((-0.5, 2), [b])
  content((-0.5, 1), [c])
  content((-0.5, 4), [A], size: 14pt)
  
  // Codomain B  
  circle((3, 3.5), radius: 0.1, fill: red, name: "1")
  circle((3, 2.5), radius: 0.1, fill: red, name: "2")
  circle((3, 1.5), radius: 0.1, fill: red, name: "3") 
  circle((3, 0.5), radius: 0.1, fill: red, name: "4")
  content((3.5, 3.5), [1])
  content((3.5, 2.5), [2])
  content((3.5, 1.5), [3])
  content((3.5, 0.5), [4])
  content((3.5, 4), [B], size: 14pt)
  
  // Function arrows
  line("a", "1", mark: (end: ">"))
  line("b", "4", mark: (end: ">"))
  line("c", "2", mark: (end: ">"))
  
  // Note
  content((1.5, -0.5), [Not onto: element 3 has no preimage], size: 10pt)
})

#pagebreak()
=== Example 2: Onto but Not One-to-One
$A = {a, b, c, d}$, $B = {1, 2, 3}$

#cetz.canvas({
  import cetz.draw: *
  
  // Domain A
  circle((0, 3.5), radius: 0.1, fill: blue, name: "a2")
  circle((0, 2.5), radius: 0.1, fill: blue, name: "b2") 
  circle((0, 1.5), radius: 0.1, fill: blue, name: "c2")
  circle((0, 0.5), radius: 0.1, fill: blue, name: "d2")
  content((-0.5, 3.5), [a])
  content((-0.5, 2.5), [b])
  content((-0.5, 1.5), [c])
  content((-0.5, 0.5), [d])
  content((-0.5, 4.2), [A], size: 14pt)
  
  // Codomain B  
  circle((3, 3), radius: 0.1, fill: red, name: "12")
  circle((3, 2), radius: 0.1, fill: red, name: "22")
  circle((3, 1), radius: 0.1, fill: red, name: "32")
  content((3.5, 3), [1])
  content((3.5, 2), [2])
  content((3.5, 1), [3])
  content((3.5, 3.7), [B], size: 14pt)
  
  // Function arrows
  line("a2", "12", mark: (end: ">"))
  line("b2", "22", mark: (end: ">"))
  line("c2", "32", mark: (end: ">"))
  line("d2", "22", mark: (end: ">"))
  
  // Note
  content((1.5, -0.5), [Onto but not one-to-one: both b and d map to 2], size: 10pt)
})

=== Example 3: Bijection
$A = {a, b, c}$, $B = {1, 2, 3}$

#cetz.canvas({
  import cetz.draw: *
  
  // Domain A
  circle((0, 3), radius: 0.1, fill: blue, name: "a3")
  circle((0, 2), radius: 0.1, fill: blue, name: "b3") 
  circle((0, 1), radius: 0.1, fill: blue, name: "c3")
  content((-0.5, 3), [a])
  content((-0.5, 2), [b])
  content((-0.5, 1), [c])
  content((-0.5, 3.7), [A], size: 14pt)
  
  // Codomain B  
  circle((3, 3), radius: 0.1, fill: red, name: "13")
  circle((3, 2), radius: 0.1, fill: red, name: "23")
  circle((3, 1), radius: 0.1, fill: red, name: "33")
  content((3.5, 3), [1])
  content((3.5, 2), [2])
  content((3.5, 1), [3])
  content((3.5, 3.7), [B], size: 14pt)
  
  // Function arrows
  line("a3", "23", mark: (end: ">"))
  line("b3", "33", mark: (end: ">"))
  line("c3", "13", mark: (end: ">"))
  
  // Note
  content((1.5, 0.2), [Bijection: one-to-one and onto], size: 10pt)
})

=== Example 4: Neither One-to-One nor Onto
$A = {a, b, c}$, $B = {1, 2, 3, 4}$

#cetz.canvas({
  import cetz.draw: *
  
  // Domain A
  circle((0, 3), radius: 0.1, fill: blue, name: "a4")
  circle((0, 2), radius: 0.1, fill: blue, name: "b4") 
  circle((0, 1), radius: 0.1, fill: blue, name: "c4")
  content((-0.5, 3), [a])
  content((-0.5, 2), [b])
  content((-0.5, 1), [c])
  content((-0.5, 3.7), [A], size: 14pt)
  
  // Codomain B  
  circle((3, 3.5), radius: 0.1, fill: red, name: "14")
  circle((3, 2.5), radius: 0.1, fill: red, name: "24")
  circle((3, 1.5), radius: 0.1, fill: red, name: "34") 
  circle((3, 0.5), radius: 0.1, fill: red, name: "44")
  content((3.5, 3.5), [1])
  content((3.5, 2.5), [2])
  content((3.5, 1.5), [3])
  content((3.5, 0.5), [4])
  content((3.5, 4.2), [B], size: 14pt)
  
  // Function arrows
  line("a4", "24", mark: (end: ">"))
  line("b4", "24", mark: (end: ">"))
  line("c4", "14", mark: (end: ">"))
  
  // Note
  content((1.5, -0.5), [Neither: not one-to-one (a,b→2) and not onto (3,4 unused)], size: 10pt)
})

=== Example 5: Not a Function
$A = {a, b, c}$, $B = {1, 2, 3}$

#cetz.canvas({
  import cetz.draw: *
  
  // Domain A
  circle((0, 3), radius: 0.1, fill: blue, name: "a5")
  circle((0, 2), radius: 0.1, fill: blue, name: "b5") 
  circle((0, 1), radius: 0.1, fill: blue, name: "c5")
  content((-0.5, 3), [a])
  content((-0.5, 2), [b])
  content((-0.5, 1), [c])
  content((-0.5, 3.7), [A], size: 14pt)
  
  // Codomain B  
  circle((3, 3), radius: 0.1, fill: red, name: "15")
  circle((3, 2), radius: 0.1, fill: red, name: "25")
  circle((3, 1), radius: 0.1, fill: red, name: "35")
  content((3.5, 3), [1])
  content((3.5, 2), [2])
  content((3.5, 1), [3])
  content((3.5, 3.7), [B], size: 14pt)
  
  // Multiple arrows from a
  line("a5", "15", mark: (end: ">"))
  line("a5", "25", mark: (end: ">"))
  line("b5", "35", mark: (end: ">"))
  // c has no arrow
  
  // Note
  content((1.5, 0.2), [Not a function: a maps to both 1 and 2; c maps nowhere], size: 10pt)
})

== Proving Function Properties

=== How to Prove a Function is Injective
*Method:* Show that if $f(x) = f(y)$, then $x = y$ (for arbitrary $x, y in A$)

*NOT:* Find particular $x, y in A$ such that $x eq.not y$ and $f(x) = f(y)$

=== How to Prove a Function is Surjective  
*Method:* Consider arbitrary $b in B$, and show $exists a in A$ such that $f(a) = b$

*NOT:* Find a particular $b in B$ such that $exists.not a in A$ with $f(a) = b$

== Inverse Functions

=== Definition: Inverse Function
Let $f: A arrow B$ be a bijection. The #underline[inverse function] of $f$, denoted $f^(-1)$, is the function from $B$ to $A$ that assigns to $b in B$ the unique element $a in A$ such that $f(a) = b$.

*Important Note:* $f^(-1) eq.not 1/f$ (inverse function ≠ reciprocal)

=== Examples of Inverse Functions

*Example 1:*
$f: ZZ arrow ZZ$ where $f(x) = x + 1$

$f^(-1): ZZ arrow ZZ$ where $f^(-1)(x) = x - 1$

*Verification:*
- $(f compose f^(-1))(x) = f(f^(-1)(x)) = f(x-1) = (x-1) + 1 = x$
- $(f^(-1) compose f)(y) = f^(-1)(f(y)) = f^(-1)(y+1) = (y+1) - 1 = y$

*Example 2:*
$f: RR arrow RR$ where $f(x) = 2x$

$f^(-1): RR arrow RR$ where $f^(-1)(x) = x/2$

== Special Functions

=== Floor and Ceiling Functions
- *Floor function:* $floor(x) = ⌊x⌋$ = largest integer $≤ x$
- *Ceiling function:* $ceil(x) = ⌈x⌉$ = smallest integer $≥ x$

== Function Composition

=== Definition: Composition
Let $f: A arrow B$ and $g: B arrow C$. The #underline[composition] of $g$ and $f$, denoted $g compose f$, is the function from $A$ to $C$ defined by:

$(g compose f): A arrow C$

$(g compose f)(a) = g(f(a))$

*Note:* The function $g compose f$ is read as "$g$ composed with $f$" and means "apply $f$ first, then apply $g$".