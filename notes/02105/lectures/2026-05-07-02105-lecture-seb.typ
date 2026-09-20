#import "@local/dtu-template:0.6.3":*
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)
#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.5.0"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#codly(fill: white, zebra-fill: black.lighten(95%), stroke: 1pt + black)
#show smallcaps: set text(font: "Liga SFMono Nerd Font")
#show raw: set text(font: "Liga SFMono Nerd Font")
#set text(font: "Helvetica")

#show: dtu-note.with(
  course: "02105",
  course-name: "Algorithms and Data Structures 1",
  title: "Exercises - May 07, 2026",
  date: datetime(year: 2026, month: 5, day: 7),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

#outline()

= Exercises

#programming-problem(
  number: 1,
  difficulty: [\[w\]],
)[
  Consider the array $A = [2, 7, 1, 8, 0, 6, 3, 6]$. Draw the segment tree for $A$ and write down the array corresponding to the segment tree. Show how the tree and the array look after the following operations: #smallcaps[Add]$(2, 5)$ and #smallcaps[Add]$(6, -2)$.

  #solution[
    #let seg-node(pos, lbl, range) = {
      node(pos, [#lbl #text(size: 0.6em, fill: gray)[$range$]], stroke: 0.5pt, inset: 4pt)
    }
    The original tree:

    #diagram(
      spacing: (6mm, 10mm),
      node-corner-radius: 2pt,
      edge-stroke: 0.5pt,
      // Level 0 — root
      seg-node((3.5, 0), $33$, $[0,7]$),
      // Level 1
      seg-node((1.5, 1), $18$, $[0,3]$),
      seg-node((5.5, 1), $15$, $[4,7]$),
      // Level 2
      seg-node((0.5, 2), $9$, $[0,1]$),
      seg-node((2.5, 2), $9$, $[2,3]$),
      seg-node((4.5, 2), $6$, $[4,5]$),
      seg-node((6.5, 2), $9$, $[6,7]$),
      // Level 3 — leaves
      seg-node((0, 3), $2$, $[0]$),
      seg-node((1, 3), $7$, $[1]$),
      seg-node((2, 3), $1$, $[2]$),
      seg-node((3, 3), $8$, $[3]$),
      seg-node((4, 3), $0$, $[4]$),
      seg-node((5, 3), $6$, $[5]$),
      seg-node((6, 3), $3$, $[6]$),
      seg-node((7, 3), $6$, $[7]$),
      // Edges — level 0→1
      edge((3.5, 0), (1.5, 1), "->"),
      edge((3.5, 0), (5.5, 1), "->"),
      // Edges — level 1→2
      edge((1.5, 1), (0.5, 2), "->"),
      edge((1.5, 1), (2.5, 2), "->"),
      edge((5.5, 1), (4.5, 2), "->"),
      edge((5.5, 1), (6.5, 2), "->"),
      // Edges — level 2→3
      edge((0.5, 2), (0, 3), "->"),
      edge((0.5, 2), (1, 3), "->"),
      edge((2.5, 2), (2, 3), "->"),
      edge((2.5, 2), (3, 3), "->"),
      edge((4.5, 2), (4, 3), "->"),
      edge((4.5, 2), (5, 3), "->"),
      edge((6.5, 2), (6, 3), "->"),
      edge((6.5, 2), (7, 3), "->"),
    )

    // Flat array representation (1-indexed BFS order):
    // Index: 1   2   3   4   5   6   7   8   9  10  11  12  13  14  15
    // Value: 33  18  15   9   9   6   9   2   7   1   8   0   6   3   6

    Adding $5$ to $A[2]$:

    // ── After Add(2, 5): A[2] += 5  →  leaf[2]=6, inner sums update ──
    #diagram(
      spacing: (6mm, 10mm),
      node-corner-radius: 2pt,
      edge-stroke: 0.5pt,
      seg-node((3.5, 0), $38$, $[0,7]$),
      seg-node((1.5, 1), $23$, $[0,3]$),
      seg-node((5.5, 1), $15$, $[4,7]$),
      seg-node((0.5, 2), $9$, $[0,1]$),
      node((2.5, 2), text(fill: red)[$14$ #text(size: 0.6em, fill: gray)[$[2,3]$]], stroke: 0.5pt + red, inset: 4pt),
      seg-node((4.5, 2), $6$, $[4,5]$),
      seg-node((6.5, 2), $9$, $[6,7]$),
      seg-node((0, 3), $2$, $[0]$),
      seg-node((1, 3), $7$, $[1]$),
      node((2, 3), text(fill: red)[$6$ #text(size: 0.6em, fill: gray)[$[2]$]], stroke: 0.5pt + red, inset: 4pt),
      seg-node((3, 3), $8$, $[3]$),
      seg-node((4, 3), $0$, $[4]$),
      seg-node((5, 3), $6$, $[5]$),
      seg-node((6, 3), $3$, $[6]$),
      seg-node((7, 3), $6$, $[7]$),
      edge((3.5, 0), (1.5, 1), "->"),
      edge((3.5, 0), (5.5, 1), "->"),
      edge((1.5, 1), (0.5, 2), "->"),
      edge((1.5, 1), (2.5, 2), "->"),
      edge((5.5, 1), (4.5, 2), "->"),
      edge((5.5, 1), (6.5, 2), "->"),
      edge((0.5, 2), (0, 3), "->"),
      edge((0.5, 2), (1, 3), "->"),
      edge((2.5, 2), (2, 3), "->"),
      edge((2.5, 2), (3, 3), "->"),
      edge((4.5, 2), (4, 3), "->"),
      edge((4.5, 2), (5, 3), "->"),
      edge((6.5, 2), (6, 3), "->"),
      edge((6.5, 2), (7, 3), "->"),
    )

    Adding $-2$ to $A[6]$:

    // ── After Add(6, -2): A[6] += -2  →  leaf[6]=1, inner sums update ─
    #diagram(
      spacing: (6mm, 10mm),
      node-corner-radius: 2pt,
      edge-stroke: 0.5pt,
      seg-node((3.5, 0), $36$, $[0,7]$),
      seg-node((1.5, 1), $23$, $[0,3]$),
      node((5.5, 1), text(fill: blue)[$13$ #text(size: 0.6em, fill: gray)[$[4,7]$]], stroke: 0.5pt + blue, inset: 4pt),
      seg-node((0.5, 2), $9$, $[0,1]$),
      seg-node((2.5, 2), $14$, $[2,3]$),
      seg-node((4.5, 2), $6$, $[4,5]$),
      node((6.5, 2), text(fill: blue)[$7$ #text(size: 0.6em, fill: gray)[$[6,7]$]], stroke: 0.5pt + blue, inset: 4pt),
      seg-node((0, 3), $2$, $[0]$),
      seg-node((1, 3), $7$, $[1]$),
      seg-node((2, 3), $6$, $[2]$),
      seg-node((3, 3), $8$, $[3]$),
      seg-node((4, 3), $0$, $[4]$),
      seg-node((5, 3), $6$, $[5]$),
      node((6, 3), text(fill: blue)[$1$ #text(size: 0.6em, fill: gray)[$[6]$]], stroke: 0.5pt + blue, inset: 4pt),
      seg-node((7, 3), $6$, $[7]$),
      edge((3.5, 0), (1.5, 1), "->"),
      edge((3.5, 0), (5.5, 1), "->"),
      edge((1.5, 1), (0.5, 2), "->"),
      edge((1.5, 1), (2.5, 2), "->"),
      edge((5.5, 1), (4.5, 2), "->"),
      edge((5.5, 1), (6.5, 2), "->"),
      edge((0.5, 2), (0, 3), "->"),
      edge((0.5, 2), (1, 3), "->"),
      edge((2.5, 2), (2, 3), "->"),
      edge((2.5, 2), (3, 3), "->"),
      edge((4.5, 2), (4, 3), "->"),
      edge((4.5, 2), (5, 3), "->"),
      edge((6.5, 2), (6, 3), "->"),
      edge((6.5, 2), (7, 3), "->"),
    )
  ]
]

#programming-problem(
  number: 2,
  difficulty: [\[w\]],
)[
  Which of the following arrays is a correct segment tree:

  $A_1 = [-, 0, 3, 0, 3, 6, 0, 2, 8, 3, 9, 6, 7, 0, 2, 5]$

  $A_2 = [-, 1, 1, 4, 1, 3, 4, 6, 1, 2, 3, 4, 5, 6, 7, 8]$

  $A_3 = [-, 1, 1, 1, 1, 1, 5, 7, 1, 4, 7, 4, 1, 5, 7, 7]$

  #solution[
    #let mn(pos, lbl, range) = node(pos, [#lbl #text(size: 0.6em, fill: gray)[$range$]], stroke: 0.5pt, inset: 4pt, corner-radius: 2pt)

    only $A_1$ is a valid segment tree. the others are invalid, because they do not satisfy the segment tree property; the parent node's value is not the sum of its children's values

    #diagram(
      spacing: (6mm, 10mm),
      edge-stroke: 0.5pt,
      mn((3.5, 0), $0$, $[0,7]$),
      mn((1.5, 1), $3$, $[0,3]$),
      mn((5.5, 1), $0$, $[4,7]$),
      mn((0.5, 2), $3$, $[0,1]$),
      mn((2.5, 2), $6$, $[2,3]$),
      mn((4.5, 2), $0$, $[4,5]$),
      mn((6.5, 2), $2$, $[6,7]$),
      mn((0, 3), $8$, $[0]$),
      mn((1, 3), $3$, $[1]$),
      mn((2, 3), $9$, $[2]$),
      mn((3, 3), $6$, $[3]$),
      mn((4, 3), $7$, $[4]$),
      mn((5, 3), $0$, $[5]$),
      mn((6, 3), $2$, $[6]$),
      mn((7, 3), $5$, $[7]$),
      edge((3.5, 0), (1.5, 1), "->"),
      edge((3.5, 0), (5.5, 1), "->"),
      edge((1.5, 1), (0.5, 2), "->"),
      edge((1.5, 1), (2.5, 2), "->"),
      edge((5.5, 1), (4.5, 2), "->"),
      edge((5.5, 1), (6.5, 2), "->"),
      edge((0.5, 2), (0, 3), "->"),
      edge((0.5, 2), (1, 3), "->"),
      edge((2.5, 2), (2, 3), "->"),
      edge((2.5, 2), (3, 3), "->"),
      edge((4.5, 2), (4, 3), "->"),
      edge((4.5, 2), (5, 3), "->"),
      edge((6.5, 2), (6, 3), "->"),
      edge((6.5, 2), (7, 3), "->"),
    )
  ]
]

#programming-problem(
  number: 3,
)[
  Solve the exercise "sums" from the weekplan on priority queues and heaps (no longer any $[*]$ or $[**]$ on the subexercises).

  #solution[
    // TODO
  ]
]

Bob lives on P Street in Algotown. There are $n$ buildings on the street, and each house has a pizzeria and an apartment. The pizza price in building $k$ is $p_k$, and the prices often change.

#programming-problem(
  number: 4.1,
)[
  Bob often visits his friends in the other buildings on the street, and when they meet, they always eat pizza. They are tired, so they don't want to walk too long. Help Bob by giving a data structure that supports the following operations:

  / #smallcaps[Update]$(k, v)$: Change the price $p_k$ to $v$.
  / #smallcaps[FindCheapPizza]$(k, w)$: Return the cheapest pizzeria within $w$ buildings of apartment $k$.

  #solution[
    we're looking for a min segment tree,

    - Update: O(log n), comes from segment tree update
    - FindCheapPizza: O(log n), comes from traversing the segment tree

  ]
]

#programming-problem(
  number: 4.2,
  difficulty: [\[\*\]],
)[
  It's the end of the month, and Bob and his friends are low on cash and need to find a pizza that costs no more than $p$. They still want to walk as little as possible. Help Bob by giving a data structure that can support the following operations:

  / #smallcaps[Update]$(k, v)$: Change the price $p_k$ to $v$.
  / #smallcaps[FindNearestPizza]$(k, p)$: Return the nearest pizzeria to apartment $k$ with a price of at most $p$. If no such pizzeria exists, return "No money, no pizza!".

  #solution[
    // TODO
  ]
]

== 5 Range Updates

#programming-problem(
  number: 5,
  difficulty: [\[\*\]],
)[
  In the _range update problem_, we want to preprocess an array $A$ to support the following operations efficiently:

  / #smallcaps[Add]$(i, j, k)$: Add $k$ to each of the entries $A[i] dots A[j]$.
  / #smallcaps[Lookup]$(i)$: Return the value $A[i]$.

  Give an efficient solution to solve the range update problem.

  #solution[
    // TODO
  ]
]

