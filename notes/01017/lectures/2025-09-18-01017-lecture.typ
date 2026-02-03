#import "@local/dtu-template:0.6.0":*

#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-venn:0.1.4": venn2, venn3

// Simple 2-set Venn with just labels
#let venn2-simple(a, b, caption: none) = {
  let diagram = canvas({
    venn2(name-a: a, name-b: b)
  })
  if caption != none {
    figure(diagram, caption: caption)
  } else {
    diagram
  }
}

// Simple 3-set Venn with just labels
#let venn3-simple(a, b, c, caption: none) = {
  let diagram = canvas({
    venn3(name-a: a, name-b: b, name-c: c)
  })
  if caption != none {
    figure(diagram, caption: caption)
  } else {
    diagram
  }
}

// 2-set with highlighted union
#let venn2-union(a, b, color: blue.transparentize(60%), caption: none) = {
  let diagram = canvas({
    venn2(
      name-a: a,
      name-b: b,
      a-fill: color,
      b-fill: color,
      ab-fill: color
    )
  })
  if caption != none {
    figure(diagram, caption: caption)
  } else {
    diagram
  }
}

// 2-set with highlighted intersection
#let venn2-intersection(a, b, color: green.transparentize(60%), caption: none) = {
  let diagram = canvas({
    venn2(
      name-a: a,
      name-b: b,
      ab-fill: color
    )
  })
  if caption != none {
    figure(diagram, caption: caption)
  } else {
    diagram
  }
}

// 2-set with one set highlighted
#let venn2-highlight(a, b, highlight: "a", color: red.transparentize(60%), caption: none) = {
  let diagram = canvas({
    if highlight == "a" {
      venn2(
        name-a: a,
        name-b: b,
        a-fill: color
      )
    } else if highlight == "b" {
      venn2(
        name-a: a,
        name-b: b,
        b-fill: color
      )
    } else {
      venn2(name-a: a, name-b: b)
    }
  })
  if caption != none {
    figure(diagram, caption: caption)
  } else {
    diagram
  }
}

// 3-set with highlighted union
#let venn3-union(a, b, c, color: blue.transparentize(60%), caption: none) = {
  let diagram = canvas({
    venn3(
      name-a: a,
      name-b: b,
      name-c: c,
      a-fill: color,
      b-fill: color,
      c-fill: color,
      ab-fill: color,
      ac-fill: color,
      bc-fill: color,
      abc-fill: color
    )
  })
  if caption != none {
    figure(diagram, caption: caption)
  } else {
    diagram
  }
}

// 3-set with center intersection highlighted
#let venn3-center(a, b, c, color: purple.transparentize(60%), caption: none) = {
  let diagram = canvas({
    venn3(
      name-a: a,
      name-b: b,
      name-c: c,
      abc-fill: color
    )
  })
  if caption != none {
    figure(diagram, caption: caption)
  } else {
    diagram
  }
}


#show: dtu-note.with(
  course: "01017",
  course-name: "Discrete Mathematics",
  title: "Lecture - September 18, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)


= Set Operations

== Cardinality

#definition(title: "Cardinality")[
  Let $A$ be a set. The _cardinality_ of the set $A$, denoted by $|A|$, is the number of elements in $A$.
] <def:cardinality>

#example[
  Let $A = {1, 3, 5}$ and $B = {1, 2, 3}$. Then
  $|A| = 3$ and $|B| = 3$.
]

The cardinality of the $emptyset$ is $0$.

$
  abs(emptyset) = 0
$

#example[
  Let set $B = { {1, 2}, 3, emptyset }$

  The cardinality of $B$ is $3$.

  That is because $B$ contains three elements: the set ${1, 2}$, the number $3$, and the empty set $emptyset$.
]

== Unions

#definition(title: "Union")[
  Let $A$ and $B$ be sets. The _union_ of the sets $A$ and $B$, denoted by $A union B$, is the set that contains those elements that are either in $A$ or in $B$, or in both.
] <def:union>

An element $x$ to the union of the sets $A$ and $B$ if and only if $x$ belongs to $A$ or $x$ belongs to $B$

$
  A union B = { x | x in A or x in B }
$

#example[
  Let $A = {1, 3, 5}$ and $B = {1, 2, 3}$. Then
  $A union B = {1, 2, 3, 4, 5}$.
]

The union of Set $A$ and $B$ can be shown as a venn diagram.

#venn2-union("Set A", "Set B", caption: $A union B$) <fig:set-union>

== Intersections

#definition(title: "Intersection")[
  Let $A$ and $B$ be sets. The _intersection_ of the sets $A$ and $B$, denoted by $A inter B$, is the set that contains those elements that are in both $A$ and $B$.
] <def:intersection>

An element $x$ belongs to the intersection of the sets $A$ and $B$ if and only if $x$ belongs to $A$ and $x$ belongs to $B$

$
  A inter B = { x | x in A and x in B }
$

#example[
  Let $A = {1, 3, 5}$ and $B = {1, 2, 3}$. Then
  $A inter B = {1, 3}$.
]

Likewise the intersection of Set $A$ and $B$ can be shown as a venn diagram.

#venn2-intersection("Set A", "Set B", caption: $A inter B$) <fig:set-intersection>


== Disjoint

#definition(title: "Disjoint")[
  Two sets are called _disjoint_ if their intersection is the empty set $emptyset$
] <def:disjoint>

#example[
  Let $A = {1, 3, 5, 7, 9}$ and $B = {2, 4, 6, 8, 10}$.

  $
   A inter B = {1, 3, 5, 7, 9} inter {2, 4, 6, 8, 10} = emptyset
  $

  Therefore, $A$ and $B$ are disjoint.
]

The generalization of this result to unions of an arbitrary number of sets is called the *principle of inclusion-exclusion*. The principle of inclusion-exclusion is an important technique used in enumeration.

Let $A$ and $B$ be finite sets. Then

$
  abs(A union B) = abs(A) + abs(B) - abs(A inter B)
$

== Difference

#definition(title: "Difference")[
  Let $A$ and $B$ be sets. The _difference_ of $A$ and $B$, denoted by $A - B$, is the set containing those elements that are in $A$ but not in $B$. The difference of $A$ and $B$ is also called the _complement of $B$ with respect to $A$_.
] <def:set-difference>

#note-box[
  The difference of sets $A$ and $B$ is sometimes denoted by $A backslash B$.
]

An element $x$ belongs to the difference of $A$ and $B$ if and only if $x in A$ and $x in.not B$.

$
  A - B = {x | x in A or x in.not B}
$

#venn2-highlight("Set A", "Set B", caption: [The difference of $A$ and $B$ is $A - B$]) <fig:set-difference>

#example[
  Let $A = {1 ,3 ,5}$ and $B = {1, 2, 3}$, the difference of $A - B$ would be

  $
    A - B = {1, 3, 5} - {1, 2, 3} = {5}
  $

  Where as the difference of $B - A$ would be

  $
    B - A = {1, 2, 3} - {1, 3, 5} = {2}
  $

  This shows that the difference of two sets is not commutative.
]


// insert complement venn-diagram here

#figure(
  canvas({
    import draw: *

    // Draw universal set boundary (rectangle)
    rect((0, 0), (4, 3), fill: yellow.lighten(80%), stroke: black + 2pt, name: "universal")

    // Draw set A (circle) - unfilled since complement is everything BUT A
    circle((2, 1.5), fill: white, stroke: black + 1pt, name: "setA")

    // Labels
    content("setA", [A], text-size: 14pt)
    content((0.3, 2.7), [$U$], text-size: 14pt, fill: black)
    content((3.5, 0.3), [$overline(A)$], text-size: 12pt, fill: black)
  }),
  caption: "Complement of Set A"

)

Once the universal set $U$ has been specified, the *complement* of a set can be defined.

== Complement

#definition(title: "Complement")[
  Let $U$ be the universal set. The _complement_ of the set $A$, denoted by $overline(A)$, is the complement of $A$ with respect to $U$.
  Therefore, the complement of the set $A$ is $U - A$
]

#note-box[
  The definition of the complement of $A$ depends on a particular universal set $U$. This definition makes sense for any superset $U$ of $A$.
  If we want to identify the universal set $U$, we would write "the complement of $A$ with respect to the set $U$."
]

An element belongs to $overline(A)$ if and only if $x in.not A$.

$
  overline(A) = {x in U | x in.not A}
$

#example[
  Let $A$ be the set of positive integers greater than 10
 $
   A &= {x in ZZ^+ | x > 10} \
   &= {11, 12, 13, 14, ...}
 $

 Then the complement of $A$ with respect to the universal set would be

 $
   overline(A) &= {x in ZZ^+ | x <= 10} \
   &= {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
 $
]

= Set Identities

#dtu-table(
  columns: 2,
  caption: "Set Identities",
  [Identitiy], [Name],
  $A inter U &= A \ A union emptyset &= A$, "Identity laws",
  $A union U &= U\ A inter emptyset &= emptyset$, "Domination laws",
  $A union A &= A\ A inter A &= A$, "Idempotent laws",
  $overline((overline(A))) = A$, "Complementation law",
  $A union B &= B union A\ A inter B &= B inter A$, "Commutative laws",
  $A union (B union C) &= (A union B) union C \ A inter (B inter C) &= (A inter B) inter C$, "Associative laws",
  $A union (B inter C) &= (A union B) inter (A union C)\ A inter (B union C) &= (A inter B) union (A inter C)$, "Distributive laws",
  $overline(A inter B) &= overline(A) union overline(B)\ overline(A union B) &= overline(A) inter overline(B)$, "De Morgan's laws",
  $A union (A inter B) &= A\ A inter (A union B) &= A$, "Absorption laws",
  $A union overline(A) &= U\ A inter overline(A) &= emptyset$, "Complement laws"
)

= Generalized Unions and Intersections

#definition(title: "Union of a collection of sets")[
  The _union_ of a collection of sets is the set that contains those elements that are members of at least one set in the collection.
]

We use the notation

$
  A_1 union A_2 union dots.c A_n = union.big^n_(i=1) A_i
$

to denote the union of the sets $A_1, A_2, ..., A_n$.

#definition(title: "Intersection of a collection of sets")[
  The _intersection_ of a collection of sets is the set that contains those elements that are members of all sets in the collection.
]

We use the notation

$
  A_1 inter A_2 inter dots.c A_n = inter.big^n_(i=1) A_i
$

to denote the intersection of the sets $A_1, A_2, ..., A_n$.


#example[
  Let $A_i = {1, 2, 3, ..., 4}$ for $i = 1, 2, 3, ...$ Then

  $
    union.big^infinity_(i = 1) A_i = union.big^infinity_(i = 1) {1, 2, 3, ..., i} = {1,2,3,...} = ZZ^+
  $

  and

  $
    inter.big^infinity_(i = 1) A_i = inter.big^infinity_(i = 1) {1, 2, 3, ..., i} = {1}
  $
]



= Functions

#definition(title: "Function")[
Let $A$ and $B$ be nonempty sets. A _function_ $f$ from $A$ to $B$ is an assignment of exactly one element of $B$ to each element of $A$. We write $f(a) = b$ if $b$ is the unique element of $B$ assigned by the function $f$ to the element of $a$ of $A$. If $f$ is a function from $A$ to $B$, we write $f: A -> B$.
]

#note-box[
  Functions are sometimes also called *mappings* or *transformations*.
]

#note-box[
  $
    (a, f(a)) in A times B
  $

  Is the ordered pair $(a, f(a))$ in the Cartesian product
]


== Domains and Codomains

#definition(title: "Domains")[
  If $f$ is a function from $A$ to $B$, we say that $A$ is the _domain_ of $f$ and $B$ is the _codomain_ of $f$.
  If $f(a) = b$, we say that $b$ is the _image_ of $a$ and $a$ is a _preimage_ of $b$. The _range_, or _image_, of $f$ is the set of all images of elements of $A$. Also, if $f$ is a function from $A$ to $B$, we say that $f$ _maps_ $A$ to $B$
]

#example[
  Let $A = {a, b, c, d}, B = {1, 2, 3, 4}$

  Then we define
  $ f: A -> B $
  where $f(a) = 1, f(b) = 2, f(c) = 3, f(d) = 4$
]

#example[
  Let the function $f$ be defined as
  $
    f: ZZ -> ZZ "where" f(x) = x^2
  $

  The function $f$ is a mapping from the set of integers to itself, where each integer is mapped to its square.

  So
  $
    f(1) &= 1^2 = 1 \
    f(2) &= 2^2 = 4 \
    f(3) &= 3^2 = 9 \
    f(4) &= 4^2 = 16 \
  $
]

#note-box[
  Terminology

  If a function is "Real-valued" then its codomain is the set of real numbers.

  If a function is "Integer-valued" then its codomain is the set of integers.

  Two real-valued functions or two integer-valued functions with the same domain can be added, as well as multiplied.
]

#definition(title: "Addition and Multiplication of functions with the same codomain")[
  Let $f_1$ and $f_2$ be function from $A -> RR$. Then $f_1 + f_2$ and $f_1 f_2$ are also functions from $A$ to $RR$ defined for all $x in A$

  $
    (f_1 + f_2)(x) &= f_1(x) + f_2(x) \
    (f_1 f_2)(x) &= f_1(x) f_2(x)
  $
]

#example[
  let $f_1, f_2: RR -> RR$ where

  $
    f_1(x) &= x^2 \
    f_2(x) &= x - x ^2
  $

  Then the addition of functions $f_1,f_2$ would be

  $
    (f_1 + f_2)(x) = x^2 + (x - x^2) = x
  $

  and the multiplication

  $
    (f_1 f_2)(x) = x^2(x - x^2) = x^3 - x^4
  $
]

== Image of a Set

#definition(title: "Image of a Set")[
  Let $f$ be a function from $A$ to $B$ and let $S$ be a subset of $A$. The _image_ of $S$ under the function $f$ is the subset of $B$ that consists of hte images of the elements of $S$. We denote the image of $S$ by $f(S)$

 $
   f(S) = {t | exists s in S (t = f(s))}
 $

 We also use the shorthand ${f(s) | s in S}$ to denote this set
]

#example[
  Let
  $ f : ZZ -> ZZ "where" f(x) = x^2 $

  if
  $
    S = {-1, 0, 1}
  $
  then
  $
    f(S) = {0, 1}
  $

  Because $f(x) = x^2$, the image of $S$ under $f$ consists of the squares of the elements of $S$. Since $(-1)^2 = 1$, $0^2 = 0$, and $1^2 = 1$, the image of $S$ is ${0, 1}$.
]

== Properties of Functions

=== One-to-One (Injective)

#definition(title: "Injection")[
  A function $f$ is said to be _injective_, if and only if $f(a) = f(b)$ implies that $a = b$ for all $a$ and $b$ in the domain of $f$. A function is said to be _injective_ if it is one-to-one
]

#note-box[
  We can express that $f$ is one-to-one using quantifiers as $forall a forall b (f(a) = f(b) => a = b)$ or equivalently $forall a forall b (a != b => f(a) != f(b)$, where the universe of discourse is the domain of the function.
]

#example[
  Let a function $f : RR -> RR$ where $f(x) = x + 1$

  Given two real numbers $x,y$. We can prove that $f$ is one-to-one by showing that $f(x) = f(y)$ implies $x = y$. Suppose $f(x) = f(y)$. Then $x + 1 = y + 1$. Subtracting 1 from both sides gives $x = y$. Therefore, $f$ is one-to-one.
]


#example[
  Visual representation of injection

  $A = {a, b, c}$, $B = {1, 2, 3, 4}$

  #figure(
    canvas({
      import draw: *

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
      line("a", "3", mark: (end: ">"))
      line("b", "4", mark: (end: ">"))
      line("c", "1", mark: (end: ">"))

      // Note
      content((1.5, -0.5), [One-to-one (Injection)], size: 10pt)
    })
  )

]

=== Increasing and Decreasing Functions

#definition(title: "Increasing Function")[
  A function $f$ whose domain and codomain are subsets of the set of real numbers is called _increasing_ if $f(x) <= f(y)$, and _strictly_ increasing if $f(x) < f(y)$, whnever $x < y$ and $x$ and $y$ are in the domain of $f$.
  Similarly, $f$ is called _decreasing_ if $f(x) >= f(y)$, and _strictly_ decreasing if $f(x) > f(y)$, whenever $x < y$ and $x$ and $y$ are in the domain of $f$.
 (Where "strictly" defines a strict inequality)
]

#example[
  Let $f: A -> B "where" A, B subset.eq RR$

  Then $f$ is _increasing_ if $x < y => f(x) < f(y), forall x, y in A$

  Inversly $f$ is _decreasing_ if $x < y => f(x) > f(y), forall x, y in A$
]

=== Onto (Surjective)

#definition(title: "Surjective")[
  A function $f$ from $A$ to $B$ is called _onto_, or a surjection, if and only if for every element $b in B$ there is an element $a in A$ with $f(a) = b$.
  A function $f$ is called _surjective_ if it is onto.

  In other words

  $
    forall b in B, exists a in A, f(a) = b
  $
]

#example[
  Let $f : ZZ -> ZZ "where" f(x) = x - 1$

  We can prove that $f$ is surjective by showing that for any $b in ZZ$, there exists an $a in ZZ$ such that $f(a) = b$.

  Let $b in ZZ$. Then $a = b + 1$ is an integer, and $f(a) = f(b + 1) = (b + 1) - 1 = b$. Therefore, $f$ is surjective.
]

#example[
A visual example of a surjective function:

$A = {a, b, c, d}$, $B = {1, 2, 3}$

#figure(
  canvas({
    import draw: *

    // Domain A
    circle((0, 4), radius: 0.1, fill: blue, name: "a")
    circle((0, 3), radius: 0.1, fill: blue, name: "b")
    circle((0, 2), radius: 0.1, fill: blue, name: "c")
    circle((0, 1), radius: 0.1, fill: blue, name: "d")
    content((-0.5, 4), [a])
    content((-0.5, 3), [b])
    content((-0.5, 2), [c])
    content((-0.5, 1), [d])
    content((-0.5, 5), [A], size: 14pt)

    // Codomain B
    circle((3, 3.5), radius: 0.1, fill: red, name: "1")
    circle((3, 2.5), radius: 0.1, fill: red, name: "2")
    circle((3, 1.5), radius: 0.1, fill: red, name: "3")
    content((3.5, 3.5), [1])
    content((3.5, 2.5), [2])
    content((3.5, 1.5), [3])
    content((3.5, 4), [B], size: 14pt)

    // Function arrows
    line("a", "2", mark: (end: ">"))
    line("b", "1", mark: (end: ">"))
    line("c", "3", mark: (end: ">"))
    line("d", "2", mark: (end: ">"))

    // Note
    content((1.5, -0.5), [Surjective], size: 10pt)
  })
  )
]


=== Bijection

#definition(title: "Bijection")[
  A function $f$ from $A$ to $B$ is called _bijective_, or a bijection, if and only if it is both injective and surjective.
]

#example[
  Let $f : ZZ -> ZZ "where" f(x) = x - 1$

  We can prove that $f$ is bijective by showing that it is both injective and surjective.

  To prove that $f$ is injective, suppose $f(x) = f(y)$ for some $x, y in ZZ$. Then $x - 1 = y - 1$, so $x = y$. Therefore, $f$ is injective.

  To prove that $f$ is surjective, let $b in ZZ$. Then $a = b + 1$ is an integer, and $f(a) = f(b + 1) = (b + 1) - 1 = b$. Therefore, $f$ is surjective.

  Since $f$ is both injective and surjective, it is bijective.
]

#example[
  Visual example of bijection

  $A = {a, b, c}$, $B = {1, 2, 3}$

  #figure(
    canvas({
      import draw: *

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
  )
]

=== Inverse Functions

#definition(title: "Inverse Function")[
  Let $f$ be a one-to-one correspondence from the set $A$ to the set $B$. the _inverse function_ of $f$ is the function that assigns to an element $b$ belonging to $B$ the unique element $a$ in $A$ such that $f(a) = b$. The inverse function of $f$ is denoted by $f^(-1)$. Hence $f^(-1)(b) = a$ when $f(a) = b$
]

#example[
Let the function $f: A -> B "where" A = {a, b, c}, B = {1,2,3}$ such that $f(a) = 2$, $f(b) = 3$, and $f(c) = 1$.

We can then show that $f^(-1)$ is a function from $B$ to $A$ such that $f^(-1)(1) = c$, $f^(-1)(2) = a$, and $f^(-1)(3) = b$.
]

=== Function Composition

#definition(title: "Composition")[
  Let $g$ be a function from the set $A$ to the set $B$ and let $f$ be a function from the set $B$ to the set $C$.
  The _composition_ of the function $f$ and $g$. denoted for all $a in A$ by $f compose g$, is the function from $A$ to $C$ defined by

  $
    (f compose g)(a) = f(g(a))
  $
]

#note-box[
  The function $g compose f$ is read as "$g$ composed with $f$" and means "apply $f$ first, then apply $g$"
]

#example[
  Given the functions $f(x) = x^2$ and $g(x) = x + 1$, we can find the composition $g compose f$ as follows:

  $
    (g compose f)(x) = g(f(x)) = g(x^2) = x^2 + 1
  $
]


= Examples

#example[
  Prove that $overline(A inter B) = overline(A) union overline(B)$

  $
    overline(A inter B) &= {x in U | x in.not A inter B}  \
    &= {x in U | x in.not A or x in.not B} \
    &= {x in U | x in overline(A) or x in overline(B)} \
    &= overline(A) union overline(B)
  $

  This proof demonstrates the De Morgan's laws, which state that the complement of the intersection of two sets is equal to the union of their complements, and vice versa.
]
