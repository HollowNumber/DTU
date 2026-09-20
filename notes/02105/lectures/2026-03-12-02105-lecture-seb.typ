#import "@local/dtu-template:0.6.3":*
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)
#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#codly(fill: white, zebra-fill: black.lighten(95%), stroke: 1pt + black)

#show: dtu-note.with(
  course: "02105",
  course-name: "Algorithms and Data Structures 1",
  title: "Lecture - Introduction to Graphs",
  date: datetime(year: 2026, month: 3, day: 12),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

// Utility: radial layout for CeTZ (cetz-package/cetz#552)
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

// Utility: radial (di)graph renderer (cetz-package/cetz#552)
// Usage: radialgraph(nodes: ("A", "B", "C"), edges: (("A", "B"), ("B", "C")))
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

#image("figs/week5/fig1.png")

#programming-problem(
  number: 1,
)[
  ==== Representation, Properties and Algorithms
  Consider the graphs in Figure 1 (see exercise sheet). Solve the following exercises.

  #programming-problem(number: 1.1, difficulty: [\[w\]])[
    Show adjacency lists and adjacency matrices for (a) and (c).

    #solution()[
      *for a)*
      Adjacency Matrix:
      #table(
        columns: 11,
        rows: 11,
        $$,
        $0$,
        $1$,
        $2$,
        $3$,
        $4$,
        $5$,
        $6$,
        $7$,
        $8$,
        $9$,
        $0$,
        $0$,
        $1$,
        $0$,
        $0$,
        $1$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $1$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $2$,
        $0$,
        $1$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $1$,
        $0$,
        $0$,
        $3$,
        $0$,
        $0$,
        $1$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $1$,
        $0$,
        $4$,
        $1$,
        $0$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $5$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $7$,
        $1$,
        $0$,
        $6$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $1$,
        $7$,
        $0$,
        $0$,
        $1$,
        $0$,
        $0$,
        $1$,
        $0$,
        $0$,
        $1$,
        $0$,
        $8$,
        $0$,
        $0$,
        $0$,
        $1$,
        $0$,
        $1$,
        $1$,
        $0$,
        $0$,
        $0$,
        $9$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $0$,
        $1$,
        $1$,
        $0$,
        $0$,
      )

      Adjacency List:
      - $0$: $[1]$, $[4]$
      - $1$: $[0]$, $[2]$, $[3]$
      - $2$: $[1]$, $[4]$
      - $3$: $[1]$, $[5]$
      - $4$: $[0]$, $[2]$, $[6]$
      - $5$: $[3]$, $[7]$
      - $6$: $[4]$, $[7]$
      - $7$: $[5]$, $[6]$, $[8]$
      - $8$: $[7]$, $[9]$
      - $9$: $[8]$

      *for c)*
      Adjacency Matrix:
      #table(
        columns: 11,
        rows: 11,
        $$,
        $0$,
        $1$,
        $2$,
        $3$,
        $4$,
        $5$,
        $6$,
        $7$,
        $8$,
        $9$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $0$,
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
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $3$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $4$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $5$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $6$,
        $0$,
        $1$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $0$,
        $0$,
        $7$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $0$,
        $0$,
        $0$,
        $8$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $0$,
        $9$,
        $0$,
        $0$,
        $0$,
        $0$,
        $1$,
        $1$,
        $0$,
        $0$,
        $0$,
        $0$,
      )

      Adjacency List:

      - $0$: $[4]$
      - $1$: $[4]$, $[5]$
      - $2$: $[5]$, $[6]$
      - $3$: $[6]$, $[7]$
      - $4$: $[0]$, $[1]$
      - $5$: $[1]$, $[2]$
      - $6$: $[2]$, $[3]$
      - $7$: $[3]$, $[8]$
      - $8$: $[7]$, $[9]$
      - $9$: $[8]$

    ]
  ]

  #programming-problem(
    number: 1.2,
    difficulty: [\[w\]],
  )[
    Simulate DFS on (a) starting in vertex 0. Assume the adjacency lists are sorted. Specify the DFS-tree and discovery and finish times.

    #solution()[
      *DFS Simulation:*

      Starting from vertex 0, we explore as deeply as possible before backtracking.

      Adjacency lists (sorted):
      - 0: [1, 4, 5]
      - 1: [0, 2, 6]
      - 2: [1, 3, 7]
      - 3: [2, 4, 8]
      - 4: [0, 3, 9]
      - 5: [0, 7, 8]
      - 6: [1, 8, 9]
      - 7: [2, 5, 9]
      - 8: [3, 5, 6]
      - 9: [4, 6, 7]

      *DFS Traversal Order and Times:*

      #table(
        columns: 3,
        [*Vertex*],
        [*Discovery Time*],
        [*Finish Time*],
        [0],
        [1],
        [20],
        [1],
        [2],
        [11],
        [2],
        [3],
        [10],
        [3],
        [4],
        [9],
        [4],
        [5],
        [8],
        [9],
        [6],
        [7],
        [6],
        [12],
        [15],
        [8],
        [13],
        [14],
        [5],
        [16],
        [19],
        [7],
        [17],
        [18],
      )

      *DFS Tree:*

      #cetz.canvas({
        import cetz.draw: *

        // Tree edges: 0→1, 1→2, 2→3, 3→4, 4→9, 1→6, 6→8, 0→5, 5→7

        let node-style = (radius: 0.4, fill: white, stroke: black)
        let edge-style = (stroke: 1.5pt + black)

        // Level 0: root
        circle((4, 0), ..node-style, name: "n0")
        content("n0", $0$)
        content((4, -0.6), text(size: 8pt, [1/20]), anchor: "north")

        // Level 1: children of 0
        circle((2, -2), ..node-style, name: "n1")
        content("n1", $1$)
        content((2, -2.6), text(size: 8pt, [2/11]), anchor: "north")

        circle((6, -2), ..node-style, name: "n5")
        content("n5", $5$)
        content((6, -2.6), text(size: 8pt, [16/19]), anchor: "north")

        // Level 2: children of 1
        circle((1, -4), ..node-style, name: "n2")
        content("n2", $2$)
        content((1, -4.6), text(size: 8pt, [3/10]), anchor: "north")

        circle((3, -4), ..node-style, name: "n6")
        content("n6", $6$)
        content((3, -4.6), text(size: 8pt, [12/15]), anchor: "north")

        // Level 2: children of 5
        circle((6, -4), ..node-style, name: "n7")
        content("n7", $7$)
        content((6, -4.6), text(size: 8pt, [17/18]), anchor: "north")

        // Level 3: children of 2
        circle((1, -6), ..node-style, name: "n3")
        content("n3", $3$)
        content((1, -6.6), text(size: 8pt, [4/9]), anchor: "north")

        // Level 3: children of 6
        circle((3, -6), ..node-style, name: "n8")
        content("n8", $8$)
        content((3, -6.6), text(size: 8pt, [13/14]), anchor: "north")

        // Level 4: children of 3
        circle((1, -8), ..node-style, name: "n4")
        content("n4", $4$)
        content((1, -8.6), text(size: 8pt, [5/8]), anchor: "north")

        // Level 5: children of 4
        circle((1, -10), ..node-style, name: "n9")
        content("n9", $9$)
        content((1, -10.6), text(size: 8pt, [6/7]), anchor: "north")

        // Draw tree edges
        line("n0", "n1", ..edge-style)
        line("n0", "n5", ..edge-style)
        line("n1", "n2", ..edge-style)
        line("n1", "n6", ..edge-style)
        line("n2", "n3", ..edge-style)
        line("n3", "n4", ..edge-style)
        line("n4", "n9", ..edge-style)
        line("n6", "n8", ..edge-style)
        line("n5", "n7", ..edge-style)
      })

      *Tree Edges:* 0→1, 0→5, 1→2, 1→6, 2→3, 3→4, 4→9, 6→8, 5→7

      *Back Edges (not in tree):* 0→4, 2→7, 3→8, 5→8, 6→9, 7→9
    ]
  ]

  #programming-problem(
    number: 1.3,
    difficulty: [\[w\]],
  )[
    Simulate BFS on (a) starting in vertex 0. Assume the adjacency lists are sorted. Specify the BFS-tree and the distance for each vertex.

    #solution()[
      *BFS Simulation:*

      Starting from vertex 0, we explore level by level.

      Adjacency lists (sorted):
      - 0: [1, 4, 5]
      - 1: [0, 2, 6]
      - 2: [1, 3, 7]
      - 3: [2, 4, 8]
      - 4: [0, 3, 9]
      - 5: [0, 7, 8]
      - 6: [1, 8, 9]
      - 7: [2, 5, 9]
      - 8: [3, 5, 6]
      - 9: [4, 6, 7]

      *BFS Traversal Order and Distances:*

      #table(
        columns: 3,
        [*Vertex*],
        [*Distance from 0*],
        [*Parent*],
        [0],
        [0],
        [-],
        [1],
        [1],
        [0],
        [4],
        [1],
        [0],
        [5],
        [1],
        [0],
        [2],
        [2],
        [1],
        [6],
        [2],
        [1],
        [3],
        [2],
        [4],
        [9],
        [2],
        [4],
        [7],
        [2],
        [5],
        [8],
        [2],
        [5],
      )

      *BFS Tree:*

      #cetz.canvas({
        import cetz.draw: *

        let node-style = (radius: 0.4, fill: white, stroke: black)
        let edge-style = (stroke: 1.5pt + black)

        // Level 0: root
        circle((4, 0), ..node-style, name: "n0")
        content("n0", $0$)
        content((4, -0.6), text(size: 8pt, [d=0]), anchor: "north")

        // Level 1: distance 1 from root
        circle((1, -2), ..node-style, name: "n1")
        content("n1", $1$)
        content((1, -2.6), text(size: 8pt, [d=1]), anchor: "north")

        circle((4, -2), ..node-style, name: "n4")
        content("n4", $4$)
        content((4, -2.6), text(size: 8pt, [d=1]), anchor: "north")

        circle((7, -2), ..node-style, name: "n5")
        content("n5", $5$)
        content((7, -2.6), text(size: 8pt, [d=1]), anchor: "north")

        // Level 2: distance 2 from root
        circle((0, -4), ..node-style, name: "n2")
        content("n2", $2$)
        content((0, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        circle((2, -4), ..node-style, name: "n6")
        content("n6", $6$)
        content((2, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        circle((3, -4), ..node-style, name: "n3")
        content("n3", $3$)
        content((3, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        circle((5, -4), ..node-style, name: "n9")
        content("n9", $9$)
        content((5, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        circle((6.5, -4), ..node-style, name: "n7")
        content("n7", $7$)
        content((6.5, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        circle((7.5, -4), ..node-style, name: "n8")
        content("n8", $8$)
        content((7.5, -4.6), text(size: 8pt, [d=2]), anchor: "north")

        // Draw tree edges
        line("n0", "n1", ..edge-style)
        line("n0", "n4", ..edge-style)
        line("n0", "n5", ..edge-style)
        line("n1", "n2", ..edge-style)
        line("n1", "n6", ..edge-style)
        line("n4", "n3", ..edge-style)
        line("n4", "n9", ..edge-style)
        line("n5", "n7", ..edge-style)
        line("n5", "n8", ..edge-style)
      })

      *Tree Edges:* 0→1, 0→4, 0→5, 1→2, 1→6, 4→3, 4→9, 5→7, 5→8

      *Cross Edges (not in tree):* 2→3, 2→7, 3→8, 6→8, 6→9, 7→9

      The BFS tree is wider and more balanced than the DFS tree, exploring vertices level by level.
    ]
  ]

  #programming-problem(number: 1.4)[
    Specify the connected components of (a), (b), and (c).

    #solution()[

    ]
  ]

  #programming-problem(number: 1.5)[
    Which of (a), (b), and (c) are bipartite?

    #solution()[
    ]
  ]
]

#programming-problem(number: 2)[
  ==== Depth-First Search using a Stack
  Explain how to implement DFS without using recursion. _Hint:_ use an (explicit) stack.

  #solution()[
  ]
]

#programming-problem(number: 3)[
  ==== Find a Cycle
  Give an algorithm that determines if a graph is _cyclic_, i.e. contains a cycle. How fast is your algorithm?

  #solution()[
  ]
]

#programming-problem(
  number: 4,
)[
  ==== Number of Shortest Paths
  Give an algorithm that given two vertices $s$ and $t$ in $G$ returns the _number_ of shortest paths between $s$ and $t$ in $G$.

  #solution()[
  ]
]

#programming-problem(
  number: 5,
)[
  ==== Mazes and Grid Graphs (exam 2010)
  A $k times k$ _grid graph_ is a graph where the vertices are arranged in $k$ rows each containing $k$ vertices. Only vertices that are adjacent in the horizontal or vertical direction may have an edge between them.

  #programming-problem(
    number: 5.1,
  )[
    Let $n$ and $m$ denote the number of vertices and edges, respectively, in a $k times k$ grid graph. Express $n$ and $m$ as a function of $k$ in asymptotic notation.

    #solution()[
    ]
  ]

  A $k times k$ _maze_ is a square drawing consisting of $k^2$ fields arranged in $k$ rows each containing $k$ fields. Each of the four sides of each field is either a _wall_ or _empty_. A _walk_ in a maze is a sequence of fields $f_1, dots, f_j$ such that any pair $f, f'$ of consecutive fields in the sequence are adjacent in the horizontal or vertical direction and the shared side of $f$ and $f'$ is empty. A special field in the maze is designated as _begin_ and another special field is designated as _end_. A maze is _happy_ if the following conditions hold:

  - There is exactly one unique walk in the maze from begin to end.
  - There is a walk from begin to any field in the maze.
  - There are no circular walks, i.e., walks that start and end in the same field.

  A maze that is not happy is _unhappy_.

  #programming-problem(number: 5.2)[
    Explain how to model a $k times k$ maze as a $k times k$ grid graph.

    #solution()[
    ]
  ]

  #programming-problem(number: 5.3)[
    Draw the maze in Figure 2(b) as a grid graph.

    #solution()[
    ]
  ]

  #programming-problem(
    number: 5.4,
  )[
    Give an algorithm, that given a $k times k$ maze modelled as a $k times k$ grid graph, determines if the maze is happy. Argue the correctness of your algorithm and analyze its running time as a function of $k$.

    #solution()[
    ]
  ]
]

#programming-problem(
  number: 6,
  difficulty: [\[†\]],
)[
==== Construction Work
Alice and Christa are new students at DTU. Due to all the construction work, it's very difficult to find their way from one building to another between classes. We want to help Alice and Christa by giving an algorithm to compute whether they can get from building $a$ to $b$ by following paths.

*Input* Line 1 contains four integers $N$, $M$, $a$, and $b$ separated by spaces, where $N$ is the number of buildings, $M$ is the number of paths between buildings, $a$ is the building they start in and $b$ is the building they want to reach. Lines $2 dots M+1$ each contain two integers $u$ and $v$, $0 <= u, v <= N-1$, indicating that there is a path between building $u$ and $v$.

*Output* A single line with "YES" if there is a way to get from building $a$ to building $b$ and "NO" otherwise.

#solution()[
```c
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int N, M, a, b;

void printMatrix(int *matrix, int length) {
  for (int row = 0; row < length; row++) {
    for (int col = 0; col < length; col++) {
      printf("%d ", *(matrix + row * length + col));
    }
    printf("\n");
  }
}

int DFS(int adjmatrix[N][N], int a, int b, bool visited[]) {
  for (int i = 0; i < N; i++) {
    if (adjmatrix[a][i] == 1 && !visited[i]) {
      visited[i] = true;
      if (i == b) {
        return 1;
      }
      if (DFS(adjmatrix, i, b, visited) == 1) {
        return 1;
      }
    }
  }
  return 0;
}

int main() {
  scanf("%d %d"
        "%d %d",
        &N, &M, &a, &b);

  int adjmatrix[N][N];
  memset(adjmatrix, 0, sizeof(adjmatrix));

  for (int row = 0; row < N; row++) {
    for (int col = 0; col < N; col++) {
      adjmatrix[row][col] = 0;
    }
  }

  for (int i = 0; i < M; i++) {
    int u, v;
    scanf("%d %d", &u, &v);

    adjmatrix[u][v] = 1;
    adjmatrix[v][u] = 1;
  }

  printMatrix((int *)adjmatrix, N);
  bool visited[N];
  memset(visited, false, sizeof(visited));
  if (DFS(adjmatrix, a, b, visited)) {
    printf("YES");
  } else {
    printf("NO");
  }

  return 0;
}
```
]
]

#programming-problem(
  number: 7,
)[
  ==== Euler Tours and Euler Paths
  Let $G$ be a connected graph with $n$ vertices and $m$ edges. An _Euler tour_ in $G$ is a cycle that contains all edges in $G$ exactly once. An _Euler path_ in $G$ is a path that contains all edges in $G$ exactly once.

  #programming-problem(
    number: 7.1,
  )[
    Which of the drawings on the exercise sheet can you draw without lifting the pencil? Can you start and end at the same place?

    #solution()[
    ]
  ]

  #programming-problem(number: 7.2, difficulty: [\[∗\]])[
    Show that $G$ has an Euler tour if and only if all vertices have even degree.

    #solution()[
    ]
  ]

  #programming-problem(number: 7.3, difficulty: [\[∗\]])[
    Show that $G$ has an Euler path if and only if 2 or 0 vertices have odd degree.

    #solution()[
    ]
  ]

  #programming-problem(number: 7.4)[
    Give an $O(n + m)$ time algorithm that determines if $G$ has an Euler tour.

    #solution()[
    ]
  ]

  #programming-problem(number: 7.5, difficulty: [\[∗\]])[
    Give an $O(n + m)$ algorithm that finds an Euler tour in $G$ if it exists.

    #solution()[
    ]
  ]
]

#programming-problem(
  number: 8,
)[
  ==== Diameter of Trees
  Let $T$ be a tree with $n$ vertices. The _diameter_ of $T$ is the longest shortest path between any pair of vertices in $T$.

  #programming-problem(number: 8.1)[
    Give an algorithm to compute the diameter of $T$ in $O(n^2)$ time.

    #solution()[
    ]
  ]

  #programming-problem(number: 8.2, difficulty: [\[∗∗\]])[
    Give an algorithm to compute the diameter of $T$ in $O(n)$ time.

    #solution()[
    ]
  ]
]

= Notes
== Directed Paths
#definition(
  title: "Directed Graph",
)[
  Set of bertices pairwise joined by *directed* edges.

  Meaning edges have a direction, i.e., an edge from vertex $u$ to vertex $v$ does not imply an edge from $v$ to $u$.
]

=== Uses of Directed Graphs
==== Garbage Collection
// TODO: format
Vertex = object, edge = pointer/reference,

which objects are reachable from a root?

==== WWW
- vertex = webpage, edge = hyperlink
- webcrawling
- PageRank

#lemma()[
  #let outdeg(v) = $deg^+ (#v)$
  #let indeg(v) = $deg^- (#v)$
  $
    sum_(v in V) outdeg(v) = sum_(v in V) indeg(v) = m
  $
]

== Representation
G directed grapg with n vertices and m edges.

We need the following operations on directed graphs:

- PointsTo(u, v): is there an edge from u to v?
- Neighbors(b): return all vertices v such that there is an edge from b to v.

== Search
==== DFS from s
- unmark all vertices and visit s
- visit s
  - mark v
  - visit all unmarked neighbors of v

==== BFS from s
- unmark all vertices and enqueue s
- mark s and Q.enqueue s
- while Q not empty:
  - v = Q.dequeue
  - for each unmarked neighbor w of v:
    - mark w and Q.enqueue w
== Topological Sorting
#definition()[
  Ordering of vertices $v_0,v_1, dots, v_(n-1)$ such that if there is an edge from $v_i$ to $v_j$, then $i < j$.
]

// TODO: make pseudocode
- Find $v$ with in-degree 0.
- output $v$ and recurse on $G - {v}$

#lemma()[
  G has topological sorting $<==> G$ has vertex v with in-degree 0 and $G - {v}$ has topological sorting.
]

// TODO: fastest topological sorting algorithm
// only worth knowing the best solution fr fr

== directed Acyclic Graphs (DAGs)
#definition()[
  G is a DAG if it contains no (directed) cycles.
]

if G is a DAG then G has a topological sorting.

algorithm:
compute topological sorting and check if it is valid.

time: O(n + m)

== Strongly Connected Components
#definition()[
  $v$ and $u$ are strongly connected if there is a path from $v$ to $u$ and a path from $u$ to $v$.
]

#definition()[
  a strongly connnected component is a maximal subset of strongly connected vertices.
]

== Implicit Graphs
#definition()[
  A graph is implicit if the vertices and edges are not given explicitly but can be computed by a function.
]

Implicit representation:
start vertex s + algorithm to generate neughbours of a vertex.

applications: Games, ai, etc.

example:

Rubiks cube:
- n+m = 43,252,003,274,489,856,000 ~ 43 quintillion configurations
what is the smallest number of moves to solve the cube from a given configuration?

both upper and lower bound is 20 moves.
