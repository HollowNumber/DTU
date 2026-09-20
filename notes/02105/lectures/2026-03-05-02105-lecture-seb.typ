#import "@local/dtu-template:0.6.3":*
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)
#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/physica:0.9.8": *
#codly(fill: white, zebra-fill: black.lighten(95%), stroke: 1pt + black)

// Function to generate adjacency matrix from edge list
// Usage: adjacency(((0,1), (1,2), (2,0)), n: 3)
// - edges: array of (u, v) tuples representing edges
// - n: optional size of matrix (auto-detects if not provided)
#let adjacency(edges, n: auto) = {
  // Auto-detect n if not provided
  let max-vertex = 0
  for (u, v) in edges {
    max-vertex = calc.max(max-vertex, u, v)
  }
  let size = if n == auto { max-vertex + 1 } else { n }

  // Initialize matrix with zeros
  let matrix = ()
  for i in range(size) {
    let row = ()
    for j in range(size) {
      row.push(0)
    }
    matrix.push(row)
  }

  // Fill in edges (undirected graph - symmetric)
  for (u, v) in edges {
    matrix.at(u).at(v) = 1
    matrix.at(v).at(u) = 1
  }

  // Convert to Typst matrix format
  let mat-content = matrix.map(row => row.map(str).join(", ")).join("; ")
  return eval("$mat(" + mat-content + ")$")
}

// Function to lay out objects in a circle for CeTZ (from cetz-package/cetz#552)
#let radiallayout = (radius, items, draw_item, start: 90deg, end: auto) => {
  if end == auto {
    end = start + 360deg
  }
  import cetz.draw: *
  let n = items.len()
  let delta = (end - start) / n
  for i in range(n) {
    let item = items.at(i)
    draw_item((start + i * delta, radius), item)
  }
}

// Function to generate a (di)graph in a radial layout (from cetz-package/cetz#552)
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
  cetz.canvas({
    import cetz.draw: *

    set-style(stroke: 0.65pt + black, ..style-args, circle: circle-args)

    nodes = nodes.map(node-spec => {
      if type(node-spec) != array {
        (node-spec, node-spec)
      } else {
        node-spec.slice(0, 2)
      }
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
      if type(dst-spec) != array {
        dst-spec = (dst-spec,)
      }
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
          if calc.rem(drawn, 2) == 0 {
            (bend-step * pair, 90deg)
          } else {
            (bend-step * pair, -90deg)
          }
        } else {
          let pair = calc.quo(drawn - 1, 2) + 1
          if drawn == 0 {
            (0, 0deg)
          } else if calc.rem(drawn - 1, 2) == 0 {
            (bend-step / 2 + bend-step * pair, 90deg)
          } else {
            (bend-step / 2 + bend-step * pair, -90deg)
          }
        }

        if directed {
          let key = if reverse {
            "start"
          } else {
            "end"
          }
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

        if reverse {
          (src, dst) = (dst, src)
        }
      }
    }
  })
}

#show: dtu-note.with(
  course: "02105",
  course-name: "Algorithms and Data Structures 1",
  title: "Lecture - March 05, 2026",
  date: datetime(year: 2026, month: 3, day: 5),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

= Lecture Notes
== Why graphs
- Model many natural problems.
- Thousdands of Practical applications.
- hundreds of well-know graph algorithms.

=== Applications of Graphs

#figure(table(
  columns: 3,
  align: (left, left, left),
  table.header([*Graph*], [*Vertices*], [*Edges*]),
  [Communication],
  [Computers],
  [Cables],
  [World Wide Web],
  [Web pages],
  [Hyperlinks],
  [Social Network],
  [People],
  [Friendships],
  [Transportation],
  [Intersections],
  [Roads],
  [Circuit],
  [Components],
  [Wires],
  [Program],
  [Functions],
  [Function calls],
), caption: [Examples of graph applications])

== Terminology
/ Path: sequence of vertices connected by edges.
/ Cycle: path that starts and ends at the same vertex.
/ Degree: number of edges incident to a vertex.
/ connectivity: whether there is a path between any two vertices.

== Undirected Graph

#definition(title: "Undirected graph")[
  Set of Vertices joined by edges.

  $
    G = (V,E)
  $

  $
    V &= "set of vertices" \
    E &= "set of edges (pairs of vertices)" \
    n &= |V|, m = |E|
  $

  #figure(cetz.canvas({
    import cetz.draw: *

    // Define vertex positions
    let vertices = (
      (0, (0, 3)),
      (1, (-1, 2)),
      (2, (1, 2)),
      (3, (2, 1)),
      (4, (-2, 1)),
      (5, (-1, 0)),
      (6, (1, 0)),
      (7, (-2, -1)),
      (8, (0, -1)),
      (9, (-1, -2)),
      (10, (1, -2)),
      (11, (2, -3)),
      (12, (0, -3)),
    )

    // Draw edges
    let edges = (
      (0, 1),
      (0, 2),
      (0, 6),
      (1, 5),
      (2, 3),
      (3, 4),
      (3, 5),
      (4, 7),
      (5, 6),
      (5, 7),
      (7, 8),
      (8, 9),
      (8, 10),
      (9, 10),
      (10, 11),
      (11, 12),
    )

    for (v1, v2) in edges {
      let (_, pos1,) = vertices.at(v1)
      let (_, pos2,) = vertices.at(v2)
      line(pos1, pos2, stroke: 1pt + black)
    }

    // Draw vertices
    for (id, pos) in vertices {
      circle(pos, radius: 0.2, fill: white, stroke: 2pt + black, name: str(id))
      content(pos, text(size: 10pt, str(id)))
    }

    // Highlight cycle 9-10-11-12
    let cycle-color = rgb("#ff6b6b").lighten(50%)
    for (v1, v2) in ((9, 10), (10, 11), (11, 12)) {
      let (_, pos1,) = vertices.at(v1)
      let (_, pos2,) = vertices.at(v2)
      line(pos1, pos2, stroke: 3pt + cycle-color)
    }

    // Re-draw cycle vertices on top
    for id in (9, 10, 11, 12) {
      let (_, pos,) = vertices.at(id)
      circle(pos, radius: 0.2, fill: cycle-color, stroke: 2pt + cycle-color.darken(30%))
      content(pos, text(size: 10pt, str(id)))
    }
  }), caption: [
    Example graph with $n = 13$ vertices and $m = 16$ edges. \
    Path from 0 to 3: $0 arrow.r 2 arrow.r 3$. \
    Degree of vertex 2: $deg(2) = 3$. \
    Cycle highlighted: $9 arrow.r 10 arrow.r 11 arrow.r 12 arrow.r 9$ (shown in color).
  ])
]

#lemma(
  )[
  $
    sum_(v in V) deg(v) = 2m
  $

  #proof(
    )[
    How many times is each edge counted in the sum? Each edge contributes 2 to the sum, since it is incident to two vertices.
  ]
]

== Algorithmic problems on graphs

=== Path Problems
/ Path: Find a sequence of vertices connected by edges from a source to a target.
/ Shortest path: Find the path with minimum number of edges (or minimum total weight) between two vertices.
/ Longest path: Find the path with maximum number of edges (or maximum total weight) between two vertices.

=== Cycle Problems
/ Cycle: Detect if there exists a path that starts and ends at the same vertex.
/ Euler tour: Find a path that visits every edge exactly once and returns to the starting vertex.
/ Hamiltonian cycle: Find a cycle that visits every vertex exactly once.

=== Structural Problems
/ Connectivity: Determine if there is a path between every pair of vertices in the graph.
/ Minimum spanning tree: Find a subset of edges that connects all vertices with minimum total weight.
/ Biconnectivity: Find vertices whose removal would disconnect the graph (articulation points).

=== Classification Problems
/ Planarity: Determine if a graph can be drawn in a plane without edge crossings.
/ Graph isomorphism: Determine if two graphs are structurally identical (same connectivity pattern).
== Representation
Graph $G$ with $n$ vertices and $m$ edges.

- Representation:
  - $A$djecent(v,u): De
  - Neighbors(v): O(deg(v))
  - Insert(v): O(1)

=== Adjacency Matrix
- Graph $G$ with $n$ vertices and $m$ edges.

- Adjency Matrix:
  - $2D n times n$ array $A$
  - $A[i,j] = 1$ if $i$ and $j$ are neighbors, $0$ otherwise.

- Space: $O(n^2)$
- Time:
  - Adjecent and insert: $O(1)$
  - Neighbors: $O(n)$

#figure(
  {
    // Define the edges from our graph
    let edges = (
      (0, 1),
      (0, 2),
      (0, 6),
      (1, 5),
      (2, 3),
      (3, 4),
      (3, 5),
      (4, 7),
      (5, 6),
      (5, 7),
      (7, 8),
      (8, 9),
      (8, 10),
      (9, 10),
      (10, 11),
      (11, 12),
    )

    // Generate the adjacency matrix
    [$ A = #adjacency(edges, n: 13) $]
  },
  caption: [Adjacency matrix for the example graph above. Rows and columns represent vertices 0-12. Entry $A[i,j] = 1$ indicates an edge between vertices $i$ and $j$.],
)

=== Adjacency List
- Graph $G$ with $n$ vertices and $m$ edges.
- Adjacency List:
  - Array $A[0..n-1]$
  - $A[i]$ is a linked list of all neighbors of vertex $i$.
- Space: $O(n + sum_(v in V) deg(v)) = O(n + 2m) = O(n + m)$
- Time:
  - Adjecent: $O(deg(v))$
  - Neighbors: $O(deg(v))$
  - Insert: $O(deg(v))$

== Depth First Search
#definition()[
  Algorithm for systematically exploring all vertices and edges of a graph.
]
Depth first search from vertxe $s$:
- Visit vertex $v$.
  - mark $v$ as visited.
  - visit all unmarked neighbors of $v$ recursively.

// TODO: fix style.
#pseudocode-list()[
  + DFS(s)
    + time = 0
    + DFS-visit(s)

  + DFS-visit(v)
    + v.d = time++
    + mark v
    + for each neighbor u
      + u.$pi$ = v
      + DFS-visit(u)
    + v.f = time++
]

// TODO: finsih this, and add cetz example of DFS traversal.

=== Connected Components

== Breadth First Search

// Frgot to write the notes for this but needs to fit same style as DFS, and add cetz example of BFS traversal.
=== Bipartite Graphs
