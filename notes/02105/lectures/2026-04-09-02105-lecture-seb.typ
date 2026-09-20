#import "@local/dtu-template:0.6.3":*
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)
#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/fletcher:0.5.8"
#codly(fill: white, zebra-fill: black.lighten(95%), stroke: 1pt + black)

#show: dtu-note.with(
  course: "02105",
  course-name: "Algorithms and Data Structures 1",
  title: "Lecture - April 09, 2026",
  date: datetime(year: 2026, month: 4, day: 9),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

#outline()

= Exercises

#programming-problem(
  number: 1,
)[
==== Run Union Find by Hand
Look at the following sequence of operations: `INIT(7)`, `UNION(3, 4)`, `UNION(5, 0)`, `UNION(4, 5)`, `UNION(4, 3)`, `UNION(0, 1)`, `UNION(2, 6)`, `UNION(0, 4)` and `UNION(6, 0)`.

#programming-problem(
  number: 1.1,
  difficulty: [\[w\]],
)[
Run the sequence of operations using quick find by hand. Show the contents of the $"id"$ array after every step. Assume the UNION$(i, j)$ operation always updates $"id"$ for the set given by $i$.

#solution()[
Starting with the array:

`INIT(7)`: `[0,1,2,3,4,5,6]`

`UNION(3,4)`: `[0,1,2,4,4,5,6]`

`UNION(5,0)`: `[0,1,2,4,4,0,6]`

`UNION(4,5)`: `[0,1,2,0,0,0,6]`

`UNION(4,3)`: `[0,1,2,0,0,0,6]`

`UNION(0,1)`: `[1,1,2,1,1,1,6]`

`UNION(2,6)`: `[1,1,6,1,1,1,6]`

`UNION(0,4)`: `[1,1,6,1,1,1,6]`

`UNION(6,0)`: `[1,1,1,1,1,1,1]`

]
]

#programming-problem(
  number: 1.2,
  difficulty: [\[w\]],
)[
  Run the sequence using quick union by hand. Show the trees after every step. Assume UNION$(i, j)$ always sets the root of the tree given by $i$ to be a child of the root of the tree given by $j$.

  #solution()[

    *INIT(7):* Each node is its own root.
    #cetz.canvas({
      import cetz.draw: *
      for i in range(7) {
        circle((i * 1.2, 0), radius: 0.3, name: str(i))
        content((i * 1.2, 0), str(i))
      }
    })

    *UNION(3,4):* root(3)=3, root(4)=4 → parent[3]=4
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "4")
      circle((0, -1), radius: 0.3); content((0, -1), "3")
      line((0, -0.3), (0, -0.7))
    })

    *UNION(5,0):* root(5)=5, root(0)=0 → parent[5]=0

    *UNION(4,5):* root(4)=4, root(5)=0 → parent[4]=0
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "0")
      circle((-0.8, -1), radius: 0.3); content((-0.8, -1), "5")
      circle((0.8, -1), radius: 0.3); content((0.8, -1), "4")
      circle((0.8, -2), radius: 0.3); content((0.8, -2), "3")
      line((0, -0.3), (-0.8, -0.7))
      line((0, -0.3), (0.8, -0.7))
      line((0.8, -1.3), (0.8, -1.7))
    })

    *UNION(4,3):* root(4)=0, root(3)=0 → same set, no-op

    *UNION(0,1):* root(0)=0, root(1)=1 → parent[0]=1
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "1")
      circle((0, -1), radius: 0.3); content((0, -1), "0")
      circle((-0.8, -2), radius: 0.3); content((-0.8, -2), "5")
      circle((0.8, -2), radius: 0.3); content((0.8, -2), "4")
      circle((0.8, -3), radius: 0.3); content((0.8, -3), "3")
      line((0, -0.3), (0, -0.7))
      line((0, -1.3), (-0.8, -1.7))
      line((0, -1.3), (0.8, -1.7))
      line((0.8, -2.3), (0.8, -2.7))
    })

    *UNION(2,6):* root(2)=2, root(6)=6 → parent[2]=6
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "6")
      circle((0, -1), radius: 0.3); content((0, -1), "2")
      line((0, -0.3), (0, -0.7))
    })

    *UNION(0,4):* root(0)=1, root(4)=1 → same set, no-op

    *UNION(6,0):* root(6)=6, root(0)=1 → parent[6]=1
    #cetz.canvas({
      import cetz.draw: *
      // root
      circle((0, 0), radius: 0.3); content((0, 0), "1")
      // depth 1
      circle((-1.2, -1), radius: 0.3); content((-1.2, -1), "0")
      circle((1.2, -1), radius: 0.3); content((1.2, -1), "6")
      // depth 2
      circle((-2, -2), radius: 0.3); content((-2, -2), "5")
      circle((-0.4, -2), radius: 0.3); content((-0.4, -2), "4")
      circle((1.2, -2), radius: 0.3); content((1.2, -2), "2")
      // depth 3
      circle((-0.4, -3), radius: 0.3); content((-0.4, -3), "3")
      // edges
      line((0, -0.3), (-1.2, -0.7))
      line((0, -0.3), (1.2, -0.7))
      line((-1.2, -1.3), (-2, -1.7))
      line((-1.2, -1.3), (-0.4, -1.7))
      line((1.2, -1.3), (1.2, -1.7))
      line((-0.4, -2.3), (-0.4, -2.7))
    })
  ]
]

#programming-problem(
  number: 1.3,
)[
  Run the sequence using weighted quick union by hand. Show the trees after every step. Assume UNION$(i, j)$ sets the root of the tree given by $i$ to be a child of the root of the tree given by $j$ when the sizes of two trees are equal.

  #solution(
    )[
    Starting with $"size" = [1,1,1,1,1,1,1]$, every node is its own root.

    *UNION(3,4):* $"size"[3]=1, "size"[4]=1$ --- equal, attach 3 under 4. $"size"[4]=2$
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "4")
      circle((0, -1), radius: 0.3); content((0, -1), "3")
      line((0, -0.3), (0, -0.7))
    })

    *UNION(5,0):* $"size"[5]=1, "size"[0]=1$ --- equal, attach 5 under 0. $"size"[0]=2$
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "0")
      circle((0, -1), radius: 0.3); content((0, -1), "5")
      line((0, -0.3), (0, -0.7))
    })

    *UNION(4,5):* $"root"(4)=4, "root"(5)=0$, $"size"[4]=2, "size"[0]=2$ --- equal, attach 4 under 0. $"size"[0]=4$
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "0")
      circle((-0.8, -1), radius: 0.3); content((-0.8, -1), "5")
      circle((0.8, -1), radius: 0.3); content((0.8, -1), "4")
      circle((0.8, -2), radius: 0.3); content((0.8, -2), "3")
      line((0, -0.3), (-0.8, -0.7))
      line((0, -0.3), (0.8, -0.7))
      line((0.8, -1.3), (0.8, -1.7))
    })

    *UNION(4,3):* $"root"(4)=0, "root"(3)=0$ --- same set, no-op.

    *UNION(0,1):* $"root"(0)=0, "root"(1)=1$, $"size"[0]=4, "size"[1]=1$ --- 0 larger, attach 1 under 0. $"size"[0]=5$
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "0")
      circle((-1.6, -1), radius: 0.3); content((-1.6, -1), "5")
      circle((-0.0, -1), radius: 0.3); content((-0.0, -1), "1")
      circle((1.6, -1), radius: 0.3); content((1.6, -1), "4")
      circle((1.6, -2), radius: 0.3); content((1.6, -2), "3")
      line((0, -0.3), (-1.6, -0.7))
      line((0, -0.3), (0, -0.7))
      line((0, -0.3), (1.6, -0.7))
      line((1.6, -1.3), (1.6, -1.7))
    })

    *UNION(2,6):* $"size"[2]=1, "size"[6]=1$ --- equal, attach 2 under 6. $"size"[6]=2$
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "6")
      circle((0, -1), radius: 0.3); content((0, -1), "2")
      line((0, -0.3), (0, -0.7))
    })

    *UNION(0,4):* $"root"(0)=0, "root"(4)=0$ --- same set, no-op.

    *UNION(6,0):* $"root"(6)=6, "root"(0)=0$, $"size"[6]=2, "size"[0]=5$ --- 0 larger, attach 6 under 0. $"size"[0]=7$
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "0")
      circle((-2.4, -1), radius: 0.3); content((-2.4, -1), "5")
      circle((-0.8, -1), radius: 0.3); content((-0.8, -1), "1")
      circle((0.8, -1), radius: 0.3); content((0.8, -1), "6")
      circle((2.4, -1), radius: 0.3); content((2.4, -1), "4")
      circle((0.8, -2), radius: 0.3); content((0.8, -2), "2")
      circle((2.4, -2), radius: 0.3); content((2.4, -2), "3")
      line((0, -0.3), (-2.4, -0.7))
      line((0, -0.3), (-0.8, -0.7))
      line((0, -0.3), (0.8, -0.7))
      line((0, -0.3), (2.4, -0.7))
      line((0.8, -1.3), (0.8, -1.7))
      line((2.4, -1.3), (2.4, -1.7))
    })
  ]
]

#programming-problem(number: 1.4)[
  Show the result of path compression after a FIND$(x)$ operation, where $x$ is
  respectively a leaf, an internal node of depth 1, and an internal node of height 1.

  #solution()[
    We use the final tree from exercise 1.2:
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "1")
      circle((-1.6, -1), radius: 0.3); content((-1.6, -1), "0")
      circle((1.6, -1), radius: 0.3); content((1.6, -1), "6")
      circle((-2.4, -2), radius: 0.3); content((-2.4, -2), "5")
      circle((-0.8, -2), radius: 0.3); content((-0.8, -2), "4")
      circle((1.6, -2), radius: 0.3); content((1.6, -2), "2")
      circle((-0.8, -3), radius: 0.3); content((-0.8, -3), "3")
      line((0, -0.3), (-1.6, -0.7))
      line((0, -0.3), (1.6, -0.7))
      line((-1.6, -1.3), (-2.4, -1.7))
      line((-1.6, -1.3), (-0.8, -1.7))
      line((1.6, -1.3), (1.6, -1.7))
      line((-0.8, -2.3), (-0.8, -2.7))
    })

    *Case 1 --- leaf:* $x = 3$. Path: $3 -> 4 -> 0 -> 1$. After #smallcaps[FIND(3)],
    nodes 3, 4, and 0 all point directly to root 1.
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "1")
      circle((-2.4, -1), radius: 0.3); content((-2.4, -1), "0")
      circle((-0.8, -1), radius: 0.3); content((-0.8, -1), "4")
      circle((0.8, -1), radius: 0.3); content((0.8, -1), "3")
      circle((2.4, -1), radius: 0.3); content((2.4, -1), "6")
      circle((-2.4, -2), radius: 0.3); content((-2.4, -2), "5")
      circle((2.4, -2), radius: 0.3); content((2.4, -2), "2")
      line((0, -0.3), (-2.4, -0.7))
      line((0, -0.3), (-0.8, -0.7))
      line((0, -0.3), (0.8, -0.7))
      line((0, -0.3), (2.4, -0.7))
      line((-2.4, -1.3), (-2.4, -1.7))
      line((2.4, -1.3), (2.4, -1.7))
    })

    *Case 2 --- internal node of depth 1:* $x = 0$. Path: $0 -> 1$. Node 0 already
    points directly to root 1, so path compression causes *no change*.

    *Case 3 --- internal node of height 1:* $x = 4$. Node 4 has height 1 (it has
    child 3) and depth 1 (parent is 0... wait, after case 1 it is now depth 1 directly
    under 1). Path: $4 -> 1$. Already points to root, *no change*. To show a
    non-trivial example, consider #smallcaps[FIND(4)] _before_ case 1: path is
    $4 -> 0 -> 1$. After compression, 4 points directly to 1:
    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 0.3); content((0, 0), "1")
      circle((-2.4, -1), radius: 0.3); content((-2.4, -1), "0")
      circle((-0.8, -1), radius: 0.3); content((-0.8, -1), "4")
      circle((1.6, -1), radius: 0.3); content((1.6, -1), "6")
      circle((-2.4, -2), radius: 0.3); content((-2.4, -2), "5")
      circle((-0.8, -2), radius: 0.3); content((-0.8, -2), "3")
      circle((1.6, -2), radius: 0.3); content((1.6, -2), "2")
      line((0, -0.3), (-2.4, -0.7))
      line((0, -0.3), (-0.8, -0.7))
      line((0, -0.3), (1.6, -0.7))
      line((-2.4, -1.3), (-2.4, -1.7))
      line((-0.8, -1.3), (-0.8, -1.7))
      line((1.6, -1.3), (1.6, -1.7))
    })
    Node 0 still has child 5; only 4's pointer was updated, not 0's.
  ]
]

#programming-problem(number: 1.5)[
  Give a sequence of operations that results in a tree of maximal depth using quick union.

  #solution()[
    With $n$ nodes, quick union can produce a chain of depth $n-1$ by always calling
    #smallcaps[UNION] on the current root:

    $ "INIT"(n), "UNION"(0,1), "UNION"(1,2), dots, "UNION"(n-2, n-1) $

    Each #smallcaps[UNION]$(i, i+1)$ sets $"root"(i) = i$ as child of $i+1$, extending
    the chain by one. For $n=4$:
    #cetz.canvas({
      import cetz.draw: *
      for i in range(4) {
        circle((0, -i * 1.0), radius: 0.3)
        content((0, -i * 1.0), str(3 - i))
        if i < 3 { line((0, -i * 1.0 - 0.3), (0, -i * 1.0 - 0.7)) }
      }
    })
    This gives depth $n - 1 = 3$, which is the worst case for quick union.
  ]
]

#programming-problem(number: 1.6)[
  Give a sequence of operations that results in a tree of maximal depth using weighted quick union.

  #solution()[
    Weighted quick union guarantees depth $<= floor(log_2 n)$, so the worst case depth
    $k$ requires exactly $n = 2^k$ nodes. The only way to increase depth is to merge two
    trees of *equal size* --- otherwise the smaller tree attaches under the larger without
    increasing its depth. This forces a doubling strategy:

    For $n = 8$ (achieving depth 3):
    #pseudocode-list[
      + #smallcaps[INIT(8)]
      + // Round 1: 4 trees of size 2, depth 1
      + #smallcaps[UNION(0, 1)], #smallcaps[UNION(2, 3)], #smallcaps[UNION(4, 5)], #smallcaps[UNION(6, 7)]
      + // Round 2: 2 trees of size 4, depth 2
      + #smallcaps[UNION(0, 2)], #smallcaps[UNION(4, 6)]
      + // Round 3: 1 tree of size 8, depth 3
      + #smallcaps[UNION(0, 4)]
    ]

    Final tree (depth $= log_2 8 = 3$):
    #cetz.canvas({
      import cetz.draw: *
      // root
      circle((0, 0), radius: 0.3); content((0, 0), "1")
      // depth 1
      let d1 = ((-2.8, -1), (2.8, -1))
      circle((-2.8, -1), radius: 0.3); content((-2.8, -1), "3")
      circle((2.8, -1), radius: 0.3); content((2.8, -1), "7")
      // depth 2
      circle((-4.2, -2), radius: 0.3); content((-4.2, -2), "0")
      circle((-1.4, -2), radius: 0.3); content((-1.4, -2), "2")
      circle((1.4, -2), radius: 0.3); content((1.4, -2), "4")
      circle((4.2, -2), radius: 0.3); content((4.2, -2), "6")
      // depth 3
      circle((-4.9, -3), radius: 0.3); content((-4.9, -3), "0")
      circle((-3.5, -3), radius: 0.3); content((-3.5, -3), "1")
      circle((-2.1, -3), radius: 0.3); content((-2.1, -3), "2")
      circle((-0.7, -3), radius: 0.3); content((-0.7, -3), "3")
      circle((0.7, -3), radius: 0.3); content((0.7, -3), "4")
      circle((2.1, -3), radius: 0.3); content((2.1, -3), "5")
      circle((3.5, -3), radius: 0.3); content((3.5, -3), "6")
      circle((4.9, -3), radius: 0.3); content((4.9, -3), "7")
      // edges depth 0->1
      line((0, -0.3), (-2.8, -0.7))
      line((0, -0.3), (2.8, -0.7))
      // edges depth 1->2
      line((-2.8, -1.3), (-4.2, -1.7))
      line((-2.8, -1.3), (-1.4, -1.7))
      line((2.8, -1.3), (1.4, -1.7))
      line((2.8, -1.3), (4.2, -1.7))
      // edges depth 2->3
      line((-4.2, -2.3), (-4.9, -2.7))
      line((-4.2, -2.3), (-3.5, -2.7))
      line((-1.4, -2.3), (-2.1, -2.7))
      line((-1.4, -2.3), (-0.7, -2.7))
      line((1.4, -2.3), (0.7, -2.7))
      line((1.4, -2.3), (2.1, -2.7))
      line((4.2, -2.3), (3.5, -2.7))
      line((4.2, -2.3), (4.9, -2.7))
    })

    In general, achieving depth $k$ requires $2^k$ nodes and $2^k - 1$ union operations
    structured as $k$ rounds of pairwise merges.
  ]
]

#programming-problem(number: 1.7)[
Write pseudo code for an algorithm to do path compression. _Hint:_ traverse the path twice.

#solution()[
#pseudocode-list[
#smallcaps[`FIND(x)`]:
+ // First pass: find root
+ root = x
+ while parent[root] $!=$ root:
  + root = parent[root]
+ // Second pass: path compress
+ while parent[x] $!=$ root:
  + next = parent[x]
  + parent[x] = root
  + x = next
+ return root
]
]
]
]

#programming-problem(
  number: 2,
)[
==== Alternative to the Quick Find Algorithm
One of your fellow students suggests the following intuitive variant of quick find UNION. Does it work?

#pseudocode-list[
#smallcaps[`UNION(i, j)`]:
+ if FIND$(i) != $ FIND$(j)$ then
  + for $k = 0$ to $n - 1$ do
    + if $"id"[k] == "id"[i]$ then
      + $"id"[k] = "id"[j]$

]

#solution(
  )[
  The algorithm does not work. The problem is that the condition $"id"[k] == "id"[i]$ is checked before any updates to $"id"$ are made. This means that if $i$ and $j$ are in different sets, the algorithm will only update the entries of the set containing $i$, but not the entries of the set containing $j$. As a result, after the first UNION operation, the sets will not be merged correctly, and subsequent UNION operations may not work as intended.
]
]

#programming-problem(
  number: 3,
)[
  ==== Dynamic Connected Components and Graph Search
  Using graph search (DFS or BFS) we can find the connected components of a graph. Give a simple solution for dynamic connected component using graph search and compare the complexity with the solutions based on union find.

  #solution()[
    // TODO
  ]
]

#programming-problem(
  number: 4,
  difficulty: [\[†\]],
)[
==== Computer Network
Josefine is setting up a new computer network at The University of Algorithms. The network consists of $N$ computers numbered from 0 to $N - 1$ that are initially not connected at all. She builds the network by adding network cables between pairs of computers one at a time. Two computers, $A$ and $B$, are connected if there is at least one series of cables that leads from computer $A$ to computer $B$. We want to support the following operations:

- ADDCABLE$(A, B)$: Add a cable between computers $A$ and $B$.
- CONNECTED$(A, B)$: Return "Yes" if there is a series of cables that leads from computer $A$ to computer $B$ and "No" otherwise.

Give a data structure for this problem and implement it.

*Input* Line 1 contains integers $N$ and $M$, where $N$ is the number of computers and $M$ is the total number of ADDCABLE/CONNECTED operations. Lines $2 dots M + 1$ can be either an ADDCABLE operation indicated by the letter `A` followed by two integers specifying the two computers, or a CONNECTED operation indicated by the letter `C` also followed by two integers specifying two computers.

*Output* Line $i$ is result of the $i$th CONNECTED operation.

#solution()[
  Here's the implementation in C:
  #raw(read("code/week8/network.c"), block: true, lang: "c")
]
]

#programming-problem(
  number: 5,
  difficulty: [\[\*\]],
)[
  ==== Zombie Invasion
  In the post apocalyptic zombie world you and a small group of survivors have barricaded yourself in a small building. The fortification consists of a $k times k$ grid of walls. In the top of the grid the zombies are waiting to come in, and you and your group is located in the bottom. The walls collapse regularly. If a path of walls between the top and the bottom of the grid is collapsed, the zombies can get in. Give a data structure that can efficiently keep track of whether there currently is a path through the fortification (from top to bottom) while the walls are collapsing one by one.

  #solution()[
    // TODO
  ]
]

#programming-problem(
  number: 6,
  difficulty: [\[\*\]],
)[
==== Recursive Path Compression
Write pseudo code for a _recursive_ algorithm for path compression. _Hint:_ it can be done with only few lines of code.

#solution()[
#pseudocode-list[
#smallcaps[`FIND(x)`]:
+ if parent[x] $!=$ x:
  + parent[x] = FIND(parent[x])
+ return parent[x]
]
]
]

#programming-problem(
  number: 7,
)[
  ==== Union Find using Linked Lists and Weights
  Each set is represented by a singly linked list. The representative is the first element, each element has a pointer to the representative, and we maintain a pointer to the tail.

  #programming-problem(
    number: 7.1,
  )[
    Using the representation, show how to implement INIT$(n)$ in $O(n)$ time, FIND$(i)$ in $O(1)$ time and UNION$(i, j)$ in $O(|S(i)|)$ time, where $S(i)$ is the set containing $i$.

    #solution()[
      // TODO
    ]
  ]

  #programming-problem(
    number: 7.2,
  )[
    Show how to extend the solution such that INIT and FIND run in the same time, but UNION$(i, j)$ runs in $O(min(|S(i)|, |S(j)|))$ time. _Hint:_ maintain a little extra information.

    #solution()[
      // TODO
    ]
  ]

  #programming-problem(
    number: 7.3,
    difficulty: [\[\*\]],
  )[
    Show that for $p$ FIND and $m$ UNION operations on $n$ elements the above solution gives running time $O(p + m log n)$.

    #solution()[
      // TODO
    ]
  ]
]

= Notes
#definition(title: "Spanning tree")[
  A spanning tree is a subgraph $T$ of $G$ over all vertices that is *connected* and *acyclic*
]

#definition(title: "Weighted Graphs")[
  Weight $w(e)$ on each edge $e$ of a graph $G$.
]

#definition(title: "Minimum Spanning Tree (MST)")[
  SPanning tree of minimum total weight.
]

== Minimum Spanning Trees

== Representation of weighted graphs
- Adjencency matrix and adjacency list.
- similair to directed graphs
// TODO: Drawings of adjacency matrix and list for weighted graphs. (of size 7)

== Properties of minimum spanning trees
- Assume for simplicity that;
  - $G$ is connected.
  - All edge weights are distinct.

=== Cut property
#definition(title: "Cut")[
  A *cut* is a partition of the vertices into two non-empty sets.
]

#definition(title: "Cut Edge")[
  A *cut edge* is an edge crossing the cut, i.e., an edge with one endpoint in each set.
]

#definition(title: "Cut property")[
  For any cut the lightest cut edge is in the MST.
]

#proof(
  )[
  Proof by contradiction:

  Assume the lightest cut edge $e$ is not in the MST $T$.

  Adding $e$ produces a cycle in $T$ (since $T$ is a spanning tree). This cycle must contain at least one other cut edge $e'$.

  Since $e$ is the lightest cut edge, $w(e) < w(e')$.
]

=== Cycle property
#definition(title: "Cycle Property")[
  for any cycle, the heaviest edge is *not* in the MST.
]

#proof(
  )[
  Proof by contradiction:

  Assume the heaviest edge $f$ in cycle is in MST

  Removing $f$ disconnects the MST, but there is an alternative edge in the cycle that can be added to reconnect it. Since $f$ is the heaviest edge, this alternative edge has smaller weight, contradicting the minimality of the MST.
]

== Prim's algorithm
- Grow a tree $T$ from some vertex $s$
- in each step add the *lightest* edge with one endpoint in $T$
- Stop when $T$ is a spanning tree.

=== Pseudocode
#pseudocode-list[
#smallcaps(`PRIM(G, s)`):
+ for all vertices $v in G$:
  + $v."key" = infinity$
  + $v.pi = "null"$
  + Inser($P,v$)
+ DecreaseKey($P, s, 0$)
+ while $P$ is not $emptyset$:
  + $u = "ExtractMin"(P)$
  + for all neighbors $v$ of $u$:
    + if $v in P$ and $w(u, v) < v."key"$:
      + $v.pi = u$
      + DecreaseKey($P, v, w(u, v)$)
]

=== Time
- Extract-Min: $n$
- Decrease-Key: $O(m)$
- insert: $n$

Total: $O(n log n + n log n + m log n) = O(m log n)$

== Kruskal's algorithm
- Sort edges by weight
- Iterate over edges in increasing order of weight, adding edge to $T$ if it does not create a cycle (i.e., if endpoints are in different components)

#lemma()[
  Kruskal's Algorithm produces a minimum spanning tree.
]

#proof()[
  Algorithms considers edge from light to heavy. At edge $e = (u,v)$:
  - case 1: $e$ creates a cycle and is not added to $T$
    - $e$ must be the heaviest edge in the cycle (since we consider edges from light to heavy)
    - Cycle property implies $e$ is not in any MST, so $T$ is still a subset of some MST.
  - case 2: $e$ does not create a cycle and is added to $T$
    - $e$ must be lightest edge in cut.
    - Cut property implies $e$ is in all MSTs.
  - $T$ is MST when $n-1$ edges are added
]

=== Implementation
in each step:
- check if an edge creates a cycle
- if not, add it to $T$

The pseudocode for this is:
#pseudocode-list[
#smallcaps(`KRUSKAL(G)`):
+ sort edges of $G$ by weight
]
== What is the best algorithm for MST?
=== ???
$
  O(m log n)
$
for Prim's and Kruskal's algorithms, Dijkstra's algorithm

=== 1975
$
  O(m log log n)
$

Yao

=== 1986
$
  O(m log* n)
$

Fedman, Tarjan

=== 1995

$
  O(m)^(‡)
$
Karger Klein tarjan

=== 2000
$
  O(m alpha(m,n))
$

chazelle

=== 2002
"Optimal", Pettie, Ramachandran. Running time not known but proved to be optimal.
