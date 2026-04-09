#import "@local/dtu-template:0.6.3":*
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)
#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
// TODO: theme codly with Catppuccin Latte colours, while retaining Zebra stripes.
#codly(fill: white, zebra-fill: black.lighten(95%), stroke: 1pt + black)

#show: dtu-note.with(
  course: "02105",
  course-name: "Algorithms and Data Structures 1",
  title: "Lecture - March 19, 2026",
  date: datetime(year: 2026, month: 3, day: 19),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

// Utility: radial layout for CeTZ
#let radiallayout = (radius, items, draw_item, start: 90deg, end: auto) => {
  if end == auto { end = start + 360deg }
  import cetz.draw: *
  let n = items.len()
  let delta = (end - start) / n
  for i in range(n) {
    let item = items.at(i)
    draw_item((start + i * delta, radius), item)
  }
}

// Utility: radial (di)graph renderer
#let radialgraph = (
  directed: false,
  overlay: false,
  nodes: (),
  edges: (),
  radius: 1.8cm,
  radial-start: 90deg,
  radial-end: auto,
  text-args: (:),
  circle-args: (radius: 0.45cm),
  mark-args: (symbol: ">", fill: black, scale: 1.4),
  style-args: (:),
) => {
  cetz.canvas(
    {
      import cetz.draw: *
      set-style(stroke: 0.65pt + black, ..style-args, circle: circle-args)

      nodes = nodes.map(node-spec => {
        if type(node-spec) != array { (node-spec, node-spec) } else { node-spec.slice(0, 2) }
      })

      let draw-node = (pos, (node-id, node-label)) => {
        circle(pos, name: node-id)
        content(node-id, text(..text-args, node-label))
      }

      radiallayout(radius, nodes, draw-node, start: radial-start, end: radial-end)

      let graph-matrix = (:)
      for (from-id, _,) in nodes {
        graph-matrix.insert(from-id, (:))
        for (to-id, _,) in nodes {
          graph-matrix.at(from-id).insert(to-id, (0, 0))
        }
      }

      edges = edges.map(((src, dst-spec)) => {
        if type(dst-spec) != array { dst-spec = (dst-spec,) }
        (src, dst-spec)
      })

      for (src, dst-spec) in edges {
        let node-ids = nodes.map(it => it.at(0))
        for node in (src, ..dst-spec) {
          if not node-ids.contains(node) {
            panic("Node " + node + " used in edge list but not found in list of nodes")
          }
        }
        for dst in dst-spec {
          graph-matrix.at(src).at(dst).at(0) += 1
        }
      }

      for (src, dest-spec) in edges {
        for dst in dest-spec {
          let (count, drawn) = graph-matrix.at(src).at(dst)
          let (rcount, rdrawn) = graph-matrix.at(dst).at(src)
          count += rcount
          drawn += rdrawn

          let reverse = false
          if src < dst {
            (src, dst) = (dst, src)
            reverse = true
          }

          let bend-step = 0.2cm
          let (offset, angle) = if calc.rem(count, 2) == 0 {
            let pair = calc.quo(drawn, 2) + 1
            if calc.rem(drawn, 2) == 0 { (bend-step * pair, 90deg) } else { (bend-step * pair, -90deg) }
          } else {
            let pair = calc.quo(drawn - 1, 2) + 1
            if drawn == 0 { (0, 0deg) } else if calc.rem(drawn - 1, 2) == 0 { (bend-step / 2 + bend-step * pair, 90deg) } else { (bend-step / 2 + bend-step * pair, -90deg) }
          }

          if directed {
            let key = if reverse { "start" } else { "end" }
            let mark-arg-dict = (start: (), end: ())
            mark-arg-dict.insert(key, mark-args)
            set-style(mark: mark-arg-dict)
          }

          if (overlay == true) or (offset == 0) or (angle == 0) {
            line(src, dst)
          } else {
            let midpoint = ((src, 50%, dst), offset, angle, dst)
            intersections("i", src, dst, hide(arc-through(src, midpoint, dst)))
            arc-through("i.0", midpoint, "i.1")
          }

          graph-matrix.at(src).at(dst).at(1) += 1
          if reverse { (src, dst) = (dst, src) }
        }
      }
    },
  )
}

#outline()

= Exercises

#programming-problem(
  number: 1,
)[
  ==== Representation, Properties and Algorithms
  Consider the graphs in Figure 1. Solve the following exercises.

  #programming-problem(number: 1.1, difficulty: [\[w\]])[
    Show adjacency lists and adjacency matrices for (a) and (b).

    #solution()[
      *for a)*

      Adjacency Matrix:
      #table(
        columns: 8,
        rows: 8,
        $$,
        $0$,
        $1$,
        $2$,
        $3$,
        $4$,
        $5$,
        $6$,
        $0$,
        $0$,
        $0$,
        $1$,
        $1$,
        $0$,
        $1$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $2$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $3$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $1$,
        $0$,
        $4$,
        $1$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $5$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $6$,
        $0$,
        $1$,
        $0$,
        $1$,
        $0$,
        $1$,
        $0$,
      )

      Adjacency List:
      - $0$: $[2,3,5]$
      - $1$: $[]$ // Nothing.
      - $2$: $[1]$
      - $3$: $[1,5]$
      - $4$: $[0,1,6]$
      - $5$: $[]$ // Nothing.
      - $6$: $[1,3,5]$

      *for b)*

      Adjacency Matrix:
      #table(
        columns: 7,
        rows: 7,
        $$,
        $0$,
        $1$,
        $2$,
        $3$,
        $4$,
        $5$,
        $0$,
        $0$,
        $1$,
        $0$,
        $1$,
        $0$,
        $0$,
        $1$,
        $0$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $2$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $3$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $0$,
        $4$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $5$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
      )

      Adjacency List:
      - $0$: $[1,3]$
      - $1$: $[2]$
      - $2$: $[5]$
      - $3$: $[4]$
      - $4$: $[5]$
      - $5$: $[]$ // Nothing.
    ]
  ]

  #programming-problem(number: 1.2, difficulty: [\[w\]])[
    Run DFS or BFS starting in node 4 in (a) and node 5 in (c) by hand.
    #solution()[
      *BFS from node 4 in (a):*
      #cetz.canvas({
        import cetz.draw: *
        set-style(stroke: 0.65pt + black, mark: (fill: black, scale: 0.9))
        let ns = (radius: 0.38, fill: white)
        let es = (mark: (end: ">"))

        // d=0
        circle((3, 0), ..ns, name: "n4")
        content("n4", $4$)
        content((3, -0.6), text(size: 8pt, [d=0]), anchor: "north")

        // d=1
        circle((1, -2), ..ns, name: "n0")
        content("n0", $0$)
        content((1, -2.6), text(size: 8pt, [d=1]), anchor: "north")

        circle((3, -2), ..ns, name: "n1")
        content("n1", $1$)
        content((3, -2.6), text(size: 8pt, [d=1]), anchor: "north")

        circle((5, -2), ..ns, name: "n6")
        content("n6", $6$)
        content((5, -2.6), text(size: 8pt, [d=1]), anchor: "north")

        // d=2 (children of n0 only; n1 and n6 have no new neighbors)
        circle((0, -4), ..ns, name: "n2")
        content("n2", $2$)
        content((0, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        circle((1.5, -4), ..ns, name: "n3")
        content("n3", $3$)
        content((1.5, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        circle((2.5, -4), ..ns, name: "n5")
        content("n5", $5$)
        content((2.5, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        // Tree edges
        line("n4", "n0", ..es)
        line("n4", "n1", ..es)
        line("n4", "n6", ..es)
        line("n0", "n2", ..es)
        line("n0", "n3", ..es)
        line("n0", "n5", ..es)
      })

      *BFS from node 5 in (c):*
      #cetz.canvas({
        import cetz.draw: *
        set-style(stroke: 0.65pt + black, mark: (fill: black, scale: 0.9))
        let ns = (radius: 0.38, fill: white)
        let es = (mark: (end: ">"))

        // d=0
        circle((3, 0), ..ns, name: "n5")
        content("n5", $5$)
        content((3, -0.6), text(size: 8pt, [d=0]), anchor: "north")

        // d=1
        circle((1.5, -2), ..ns, name: "n3")
        content("n3", $3$)
        content((1.5, -2.6), text(size: 8pt, [d=1]), anchor: "north")

        circle((4.5, -2), ..ns, name: "n9")
        content("n9", $9$)
        content((4.5, -2.6), text(size: 8pt, [d=1]), anchor: "north")

        // d=2
        circle((0.5, -4), ..ns, name: "n1")
        content("n1", $1$)
        content((0.5, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        circle((2.5, -4), ..ns, name: "n7")
        content("n7", $7$)
        content((2.5, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        circle((4.5, -4), ..ns, name: "n4")
        content("n4", $4$)
        content((4.5, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        // d=3
        circle((2.5, -6), ..ns, name: "n6")
        content("n6", $6$)
        content((2.5, -6.6), text(size: 8pt, [d=3]), anchor: "north")

        circle((4.5, -6), ..ns, name: "n0")
        content("n0", $0$)
        content((4.5, -6.6), text(size: 8pt, [d=3]), anchor: "north")

        // d=4
        circle((2.5, -8), ..ns, name: "n2")
        content("n2", $2$)
        content((2.5, -8.6), text(size: 8pt, [d=4]), anchor: "north")

        // Tree edges
        line("n5", "n3", ..es)
        line("n5", "n9", ..es)
        line("n3", "n1", ..es)
        line("n3", "n7", ..es)
        line("n9", "n4", ..es)
        line("n7", "n6", ..es)
        line("n4", "n0", ..es)
        line("n6", "n2", ..es)
      })

      *Note:* Node $8$ is not reachable from node $5$.
    ]
  ]

  #programming-problem(
    number: 1.3,
  )[
    Which of (a) and (c) are DAGs? If the graph is a DAG find a topological ordering using the recursive algorithm for topological sorting. If the graph is not a DAG find a cycle.
    #solution()[
      *for a)*
      Graph (a) is not a DAG.

      *for c)*
      Graph (c) is a DAG. The recursive DFS-based topological sort (post-order reversed) yields:

      #cetz.canvas({
        import cetz.draw: *
        set-style(stroke: 0.65pt + black, mark: (fill: black, scale: 0.9))
        let ns = (radius: 0.38, fill: white)

        // Topological order: 5, 3, 9, 7, 4, 6, 0, 2, 1, 8
        let order = ("5", "3", "9", "7", "4", "6", "0", "2", "1", "8")
        let spacing = 1.3

        for (i, lbl) in order.enumerate() {
          let x = i * spacing
          circle((x, 0), ..ns, name: "t" + str(i))
          content("t" + str(i), text(size: 9pt, eval("$" + lbl + "$")))
          if i > 0 {
            line("t" + str(i - 1), "t" + str(i), mark: (end: ">"))
          }
        }
      })

      The full graph (c) with all directed edges:

      #radialgraph(directed: true, nodes: ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9"), edges: (
        ("0", ("4", "5")),
        ("2", ("0", "3")),
        ("3", ("1", "7")),
        ("4", ("0",)),
        ("5", ("3", "9")),
        ("6", ("1", "2")),
        ("7", ("6",)),
        ("8", ("5", "7", "9")),
        ("9", ("4",)),
      ), radius: 2.2cm, radial-start: 90deg)
    ]
  ]

  #programming-problem(
    number: 1.4,
  )[
    Specify strongly connected components of (a) and (c).

    #solution(
      )[
      *for a)*

      The strongly connected components of (a) are ${0,1,2}$, ${3}$, ${4}$, ${5}$, and ${6}$.

      *for c)*

      The strongly connected components of (c) are ${0}$, ${1}$, ${2}$, ${3}$, ${4}$, ${5}$, ${6}$, ${7}$, ${8}$, and ${9}$. In other words, each node is its own strongly connected component.
    ]
  ]

  #programming-problem(number: 1.5)[
    How many topological orderings does (b) have?

    #solution()[
      Graph (b) has 2 topological orderings. The two orderings are:

      - $0,1,2,3,4,5$
      - $0,3,4,1,2,5$
    ]
  ]

  #programming-problem(
    number: 1.6,
  )[
    How many strongly connected components does a DAG have?

    #solution(
      )[
      A DAG has as many strongly connected components as it has nodes, since each node is its own strongly connected component.
    ]
  ]
]

#programming-problem(
  number: 2,
)[
  ==== Snakes and Ladders
  Snakes and ladders is a classic board game. We will look at the following variant. The game is played on a $n times n$ grid with cells numbered from $1$ to $n^2$ in order. Special pairs of cells are _snakes_ that lead downwards and _ladders_ that lead upwards. A cell can be the endpoint for, at most, one ladder or snake.

  The goal of the game is to move from cell $1$ to cell $n^2$ in the fewest possible rounds. First, place a piece on cell $1$. In each round, you can move the piece _at most_ $5$ fields forward. If the piece ends in the top of a snake the piece is moved to the bottom of the snake, and, similarly, if the piece ends in the bottom of a ladder it is moved to the top of the ladder.

  #programming-problem(
    number: 2.1,
  )[
    Give an algorithm to compute the fewest number of rounds needed to move a piece from cell $1$ to cell $n^2$.

    #solution(
      )[
      #pseudocode-list(
        )[
        + #smallcaps[*fewest-rounds*]\(snakes, ladders, n)
          + Create a graph $G$ with nodes $1$ to $n^2$.
          + *For each* cell $i$ from $1$ to $n^2 - 1$:
            + *For each* cell $j$ from $i+1$ to $min(i+5, n^2)$:
              + *if* there is a snake or ladder starting at cell $j$, add an edge from $i$ to the endpoint of that snake or ladder.
              + *Else* add an edge from $i$ to $j$.
          + Run BFS on graph $G$ starting from node $1$ to find the shortest path to node $n^2$. The length of this path is the fewest number of rounds needed.
      ]

      The time complexity of this algorithm is $O(n^2)$, since we create a graph with $n^2$ nodes and at most $5n^2$ edges, and BFS runs in linear time with respect to the number of nodes and edges.
    ]
  ]
]

#programming-problem(
  number: 3,
)[
  ==== DAGs and Topological Sorting

  #programming-problem(
    number: 3.1,
  )[
    Professor Tom Opological suggests the following new and simple algorithm to construct a topological ordering: run BFS from a node $s$ with in-degree $0$ and sort the nodes by increasing distance to $s$. Does the algorithm work?

    #solution(
      )[
      The algorithm does not work. Consider the following DAG:

      #radialgraph(directed: true, nodes: ("0", "1", "2"), edges: (("0", ("1", "2")), ("1", ("2",)),), radius: 1.5cm)

      If we run BFS from node $0$, we get the following distances:

      - Node $0$: distance $0$
      - Node $1$: distance $1$
      - Node $2$: distance $1$

      The algorithm fails because nodes at the same BFS depth can have edges between them. Here, nodes 1 and 2 are both at distance 1 from 0, but edge $1 -> 2$ requires 1 to precede 2. BFS distance alone cannot enforce this, so the algorithm may produce the invalid ordering $[0, 2, 1]$. The unique valid ordering is $[0, 1, 2]$.
    ]
  ]

  #programming-problem(
    number: 3.2,
  )[
    Give an algorithm that given a graph $G$ and an ordering $S$ of the nodes in $G$ determines if $S$ is a topological ordering.

    #solution()[
    ]
  ]

  #programming-problem(
    number: 3.3,
  )[
    Given a DAG $G$, does there exist a topological ordering of $G$ that cannot be produced by the recursive algorithm for topological sorting?

    #solution()[
    ]
  ]

  #programming-problem(
    number: 3.4,
    difficulty: [\[∗\]],
  )[
    A _Hamiltonian path_ is a path that visits all nodes exactly once. Give an algorithm that determines if a DAG has a Hamiltonian path.

    #solution()[
    ]
  ]
]

#programming-problem(
  number: 4,
  difficulty: [\[\*$†$\]],
)[
==== Course Planning
Josefine has spent the entire summer deciding what courses she wants to study at The University of Algorithms. A course takes one semester to finish (and as the super student she is, she always succeeds). Some of the courses depend on other courses, and students are therefore not allowed to take them in the same semester. If course $i$ depends on course $j$, Josefine must take course $j$ in an earlier semester than course $i$. She wants to finish her studies in as few semesters as possible. Given the courses Josefine wants to study and the courses they each depend on, compute the fewest number of semesters Josefine needs to use to finish her studies. (Again, she is a super student, so she can take an unlimited number of courses each semester). You can assume there are no cyclic dependencies in the courses Josefine has chosen. Give an algorithm for this problem and implement it.

*Input* Line $1$ contains integers $N$ and $M$ separated by a space, where $N$ is the number of courses and $M$ is the total number of dependencies. Lines $2 dots M+1$ contain two integers $i$ and $j$, indicating that course $i$ depends on course $j$, i.e., course $j$ must be completed before course $i$.

*Output* A single line with the fewest number of semesters needed for Josefine to complete her studies.

#solution()[
The following C code implements a solution:
```c
    #include <stdbool.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    int N, M;

    int depth(int target, int adjmatrix[][N], int *memo) {
      if (memo[target] != -1) {
        return memo[target];
      }

      int max_depth = 0;
      for (int i = 0; i < N; i++) {
        if (adjmatrix[target][i] == 1) {
          int depth_i = depth(i, adjmatrix, memo);
          if (depth_i > max_depth) {
            max_depth = depth_i;
          }
        }
      }

      memo[target] = max_depth + 1;
      return memo[target];
    }

    int main() {
      scanf("%d %d", &N, &M);
      int adjmatrix[N][N];
      memset(adjmatrix, 0, sizeof(adjmatrix));

      for (int i = 0; i < M; i++) {
        int i_course, j_course;
        scanf("%d %d", &i_course, &j_course);

        adjmatrix[i_course][j_course] = 1;
      }

      int memo[N];
      memset(memo, -1, sizeof(memo));

      int max_semesters = 0;
      for (int i = 0; i < N; i++) {
        int d = depth(i, adjmatrix, memo);
        if (d > max_semesters)
          max_semesters = d;
      }
      printf("Total Semesters needed: %d\n", max_semesters);

      return 0;
    }
```
]
]

#programming-problem(
  number: 5,
  difficulty: [\[∗\]],
)[
  ==== Ethnographers
  You're helping a group of ethnographers analyze some oral history data they've collected by interviewing members of a village to learn about the lives of people who've lived there over the past two hundred years.

  From these interviews, they've learned about a set of $n$ people (all of them now deceased), whom we'll denote $P_1, P_2, dots, P_n$. They've also collected facts about when these people lived relative to one another. Each fact has one of the following two forms:

  (a) For some $i$ and $j$, person $P_i$ died before $P_j$ was born.

  (b) For some $i$ and $j$, the life spans of $P_i$ and $P_j$ overlapped at least partially.

  Naturally, they're not sure that all these facts are correct; memories are not so good, and a lot of this was passed down by word of mouth. So what they'd like you to determine is whether the data they've collected is at least internally consistent, in the sense that there could have existed a set of people for which all the facts they've learned simultaneously hold.

  Give an efficient algorithm to do this: either it should produce proposed dates of birth and death for each of the $n$ people so that all the facts hold true, or it should report (correctly) that no such dates can exist -- that is, the facts collected by the ethnographers are not internally consistent.

  #solution()[
  ]
]

#programming-problem(
  number: 6,
)[
  ==== Topological Sorting and DAGs
  Show that a directed graph $G$ is a DAG if and only if $G$ has a topological sorting. _Hint:_ use the Lemma on the correctness of topological sorting.

  #solution()[
  ]
]

#programming-problem(
  number: 7,
)[
  ==== Three Bottles
  You are given three bottles with capacities of $8$, $5$, and $3$ liters, respectively. Initially, the $8$-liter bottle is filled with water, and the two other bottles are empty. Your target is to have precisely $4$ liters of water in one of the bottles. You can pour water from one bottle to another, but you must continue until either the bottle you are pouring from is empty or the one you are pouring to is full.

  #programming-problem(number: 7.1, difficulty: [\[∗\]])[
    Show it is possible to do this and give the shortest sequence of fillings/empties you can find.

    #solution()[
    ]
  ]

  #programming-problem(
    number: 7.2,
    difficulty: [\[∗\]],
  )[
    Now assume you have $n$ bottles with integer capacities $d_1, dots, d_n$ in liters and a target of $x$ liters water in a bottle in the end. Give an algorithm to compute the shortest sequence of fillings/empties. Assume that a valid sequence exists. _Hint:_ model the problem as an implicit graph.

    #solution()[
    ]
  ]
]

= Noter
== Priority quyeues
#definition()[
  Priority queues Maintain dynamic set $S$ support the following operations:
  / *Max()*: Return an element of $S$ with maximum key.
  / *Extract-Max()*: Remove and return an element of $S$ with maximum key
  / *Insert(x)*: set $S = S union {x}$
  / *Increase-Key(x, k)*: set $x."key" = k$ (assume $k >= x."key"$)
]

==== Applications of priority queues
/ Scheduling: processes with different priorities, and we want to always run the highest priority process.
/ Dijkstra's algorithm for single-source shortest paths: we need to repeatedly select the vertex with the smallest tentative distance.
/ Minimum spanning trees: Prim's algorithm repeatedly selects the edge with the smallest weight that connects a vertex in the tree to a vertex outside the tree.
/ Compression: Huffman coding uses a priority queue to build an optimal prefix code based on the frequencies of characters.

#conceptual-question()[
  How can we solve problem with current techniques?
]

#solution(
  )[
  *Linked List.*

  Maintain $S$ in a linnked lest.
  - Max(): $O(n)$ time, by scanning the list for the maximum key.
  - Extract-Max(): $O(n)$ time, by scanning the list for the maximum key and removing it.
  - Insert(x): $O(1)$ time, by inserting $x$ at the head of the list.
  - Increase-Key(x, k): $O(1)$ time, by updating $x$'s key to $k$.

  Time would then be $O(n)$ for Max and Extract-Max, and $O(1)$ for Insert and Increase-Key. This is not efficient for large $n$.

  Space: $O(n)$, since we need to store all elements in the list.
]

#solution(
  )[
  *Sorted Linked List.*

  Maintain $S$ in a sorted doubly linked list, sorted by key in decreasing order (i.e., the head of the list has the maximum key).
  - Max(): $O(1)$ time, by returning the head of the list.
  - Extract-Max(): $O(1)$ time, by removing and returning the head of the list.
  - Insert(x): $O(n)$ time, by scanning the list to find the correct position for $x$ and inserting it there to maintain sorted order.
  - Increase-Key(x, k): $O(n)$ time, by scanning the list to find $x$, updating its key to $k$, and then moving it forward in the list as needed to maintain sorted order.

  Time would then be $O(1)$ for Max and Extract-Max, and $O(n)$ for Insert and Increase-Key. This is an improvement for Max and Extract-Max, but still inefficient for Insert and Increase-Key.

  Space: $O(n)$, since we need to store all elements in the list.
]

== Trees and Heaps
=== Rooted trees
/ nodes(vertecis): connected by edges
- Connected and acyclic 
- Designated root node
- special type of graph

==== Terms:
/ parent: node directly above another node in the tree
/ child: node directly below another node in the tree
/ sibling: nodes with the same parent
/ ancestor: node on the path from the root to a given node
/ descendant: node on the path from a given node to a leaf
/ leaf: node with no children
/ internal node: node with at least one child
/ degree of a node: number of children
/ path: sequence of nodes from one node to another

===== Depth and height:

/ Depth of a node: length of the path from the root to that node
/ Height of a node: length of the longest path from that node to a leaf

=== Binary trees
- Rooted tree
- Each node has at most two children (left and right)

/ Complete binary trees: Binary tree where all levels are fully filled except possibly the last level, which is filled from left to right.
/ Almost complete binary trees: Binary tree where all levels are fully filled except possibly the last level, which is filled from left to right, and the last level has at least half of the nodes.

#lemma()[
  Heigh of an (almost) complete binary tree with $n$ nodes is $Theta(log n)$.
  // Proof will appear in exercises :)
]
 
#definition()[
  A _heap_ is an almost complete binary tree that satisfies the _heap order_.
  
  For all nodes $v$:
    
    All keys in the left subtree and right subtree of $v$ are less than or equal to the key of $v$ (max-heap)
]

=== Max heap vs Min heap
/ Max heap: for all nodes $v$, the key of $v$ is greater than or equal to the keys of its children.
/ Min heap: for all nodes $v$, the key of $v$ is less than or equal to the keys of its children.


== Representations of heaps
A heap needs the following navigation operations:
- Parent(x): returns the parent of node $x$.
- Left(x): returns the left child of node $x$.
- Right(x): returns the right child of node $x$.
*C struct for a heap:*
```c
struct Heap {
  int *array; // Array representation of the heap
  int size;   // Number of elements in the heap
  int capacity; // Maximum capacity of the heap
};
```

Array representation of a heap:
- Array H[0..n]
- H[0] unused
- H[1] is the root

/ parent: reutn $floor(x/2)$
/ left: return $2x$
/ right: return $2x + 1$

Time: $O(1)$ for parent, left, and right operations.

Space: $O(n)$ for storing the heap in an array.

== Algorithms on heaps

==== BubbleUp(x)
- if heap order is violated at node $x$ (i.e., key of $x$ is greater than key of parent)
- swap $x$ with its parent
- repeat until heap order is restored

==== BubbleDown(x)
- if heap order is violated at node $x$ (i.e., key of $x$ is less than key of at least one child)
- swap $x$ with the child that has the greater key (for max-heap)
- repeat until heap order is restored

// Sorry bro i got too tired to take more notes...

== Building a heap

== Heapsort
