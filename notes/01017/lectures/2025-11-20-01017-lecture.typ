#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "01017",
  course-name: "Discrete Mathematics",
  title: "Lecture - November 20, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall",
)

= Section 9.5 + 9.6

Set $S$, relation $S$ on $S$, we write $(S,R)$

$
  a,b in S
$

We say "$a$ relates to $b$" or "$a$ is in relation to $b$" we write $a R b$ if $s$ is finite, for example $s = {1,2,3}$ $R$ true for the pairs

$
  R = {(1,2), (2,3), (3,2), (2,2)}
$

Important sets include:

$ ZZ, ZZ_+, NN, QQ, QQ_+, RR, CC $

Each set has a power set, denoted by $cal(P)$ which is the set of all subsets of $S$.

== Relations <sec:relations>

As mentioned before sets can have relations, these relations include:

$
  =, <=, <, >=, >, divides, equiv quad subset, subset.eq, supset, supset.eq
$

From this, we can define two different types of relations

=== Equivalence Relations <sec:equivalence-relations>

Let $R$ be an equivalence relation on $S$ if and only if $R$ satisfies:

#enum(
  numbering: "(i)",
  $forall a in S : a R a ("Relfexive")$,
  $forall a, b in S: a R B => b R a ("Symmetry")$,
  $forall a,b,c: a R b and b R c => a R c ("Transitive")$,
)

If $R$ is an equivalence relation we often write $~$ instead of $R$

#definition(
  title: "Equivalence Class",
)[

  The equivalence class containing some set $a$, is defined as

  $
    [a]_~ = {x | x ~ a}
  $

  We then take the congruent four of the containing set $a$

  $
    [0]_(equiv 4) = {dots,-12,-8,-4,0, 4, 8, 12, dots }
  $

  Similarly:

  $
    [1]_(equiv 4) = {dots,-3,1, 5, 9, dots }
  $

  Continuing...

  $
    [3]_(equiv 4) = {dots, -5, -1, 3, 7, dots}
  $

  $
    [2]_(equiv 4) = dots
  $

  This showcases the equivalence classes of the set $S$ under the relation $equiv 4$. Which are disjoint and cover the entire set $S$.

] <def:equivalence-class>

#proof[
  Let $~$ be an equivalence relation on $S$, then these three statements are equivalent:

  $
    a                 &~ b \
    [a]_~             &= [b]_~ \
    [a]_~ inter [b]_~ &= emptyset
  $

  Proving these three are equivalent granularly would mean we have to prove 6 different implications.
  There is however, a smarter way of doing this.

  We can prove that

  $
    (a ~ b) => ([a]_~ = [b]_~) => ([a]_~ inter [b]_~ = emptyset)
  $

  We can do this by proving the following implication

  $
    ([a]_~ inter [b]_~ = emptyset) => (a = b)
  $

  If this is true then all the implications follow.

  Assume that $a~b$, let $x in [a]$, we want to prove that $x in [b]$.
  We apply the transitive property of equivalence relations:
  $
    x in [a] \
    x ~ a \
    a ~ b \
    x ~ b \
    x in [b]
  $
]

=== Partially Ordered Sets <sec:posets>

$(S,R)$ is a partially ordered set (poset) if $R$ satisfies

#enum(numbering: "(i)",
  $a R a forall a ("Reflexive")$,
  $a R b and b R c => a R c ("Transitive") $

)


#example(title: "Partially ordered sets")[

  $
    =, <=, >=, subset.eq, supset.eq , divides "posed on" ZZ_+
  $
]
#let partord = math.prec.eq


If $R$ is a partial order, it can be denoted as $a partord b$ instead of $a R b$.
We say that $a, b$ comparable if either, $a partord b$ or $b partord a$


If any two elements are comparable, then ($S, prec.eq$) the relation is a total order also called a chain.

#note-box()[
  instead of $prec.eq$, some authors may use $<=$ or $subset.sq.eq$
]

If every subset of $S$ has a smallest element then, $(S, R)$ is a well-ordered set.

#import "@preview/cetz:0.4.2"

#figure(
  cetz.canvas({
    import cetz.draw: *

    let y = 0 // Same y-coordinate for all lines

    // First number line: 1, 2, 3, ...
    line((0, y), (5, y), stroke: black + 1pt, mark: (end: ">", fill: black))

    // Nodes on first line
    circle((0.5, y), radius: 0.15, fill: black)
    content((0.5, y - 0.4), [1])

    circle((1.5, y), radius: 0.15, fill: black)
    content((1.5, y - 0.4), [2])

    circle((2.5, y), radius: 0.15, fill: black)
    content((2.5, y - 0.4), [3])

    content((5.3, y), [$dots.c$])

    // Second number line: ω, ω+1, ω+2, ...
    line((6, y), (11, y), stroke: black + 1pt, mark: (end: ">", fill: black))

    // Nodes on second line
    circle((6.5, y), radius: 0.15, fill: black)
    content((6.5, y - 0.4), [$omega$])

    circle((7.5, y), radius: 0.15, fill: black)
    content((7.5, y - 0.4), [$omega + 1$])

    circle((8.5, y), radius: 0.15, fill: black)
    content((8.5, y - 0.4), [$omega + 2$])

    content((11.3, y), [$dots.c$])

    // Third number line: 2ω, 2ω+1, ...
    line((12, y), (17, y), stroke: black + 1pt, mark: (end: ">", fill: black))

    // Nodes on third line
    circle((12.5, y), radius: 0.15, fill: black)
    content((12.5, y - 0.4), [$1w$])

    circle((13.5, y), radius: 0.15, fill: black)
    content((13.5, y - 0.4), [$2u + 1$])

    circle((14.5, y), radius: 0.15, fill: black)
    content((14.5, y - 0.4), [$dots.c$])

    content((17.3, y), [$dots.c$])
  }),
  caption: [Well-ordered set showing natural numbers, ordinals with $omega$, and extended ordinals],
) <fig:ordinals>


==== Minimal element

A minimal element of $S$ is an element $a in S$ such that there is no $b in S$ with $b < a$.

So if some $x$ satisfies $x partord a$ and $x plus.minus a$ then $x$ is a minimal element of $S$.

$
  exists x &: x partord a "and" x plus.minus a \
  forall x &: a partord x
$

Every finite partial ordered set has a minimal element.

#proof[
  Let $S$ be a partially ordered set, we can then pick any element, denoted by $x_1$.
  If $x_1$ is a minimal element, we are done.
  Otherwise, there exists an element $x_2$ in $S$ such that $x_2 < x_1$.
  We repeat this process until we find a minimal element.

  If we reach a point where no such $x_i$ exists, then $S$ must be finite and we have found a minimal element.

  By the transitive property, if $x_i < x_(i+1)$ for all $i$, then $x_1 < x_2 < dots < x_n$ for some $n$, which implies that $x_1$ is a minimal element.
]

== Sorting <sec:sorting>

For sets, there are different ways of ordering sets.

Sorting is the process of arranging elements in a specific order, such as ascending or descending.

=== Topological Sorting

Topological sorting is a linear ordering of vertices in a directed acyclic graph (DAG) such that for every directed edge $u v$, vertex $u$ comes before vertex $v$ in the ordering.

Topological sorting is useful for scheduling tasks that have dependencies on each other.


=== Lexicographic Sorting

Lexicographic sorting is a method of sorting elements based on their lexicographical order, similar to how words are sorted in a dictionary.

Lexicographic sorting is useful for organizing data in a way that reflects the natural order of the elements.

Let $A,B,C,D$ be some sets. Given the sorting $A < B < C < D$, we can sort the elements of $A,B,C,D$ in lexicographical order.


$
  cases(reverse: #true,
    (S_1, partord_1) "partial order",
    (S_2, partord_2) "partial order"
  )
$

We define a total order $partord$ on $S_1 times S_2$

$
  (a_1, a_2) partord (b_1, b_2)
$

if either $a_1 < b_1$ or $a_2 partord b_2$ or $a_1 = b_1$


== Hasse Diagram

A Hasse Diagram is a graphical representation of a partially ordered set, where elements are represented as vertices and the order relation is represented by edges.

// TODO: make some diagrams
