#import "@local/dtu-template:0.6.0":*
#import "@preview/cetz:0.4.2"

#show: dtu-note.with(
  course: "01017",
  course-name: "Discrete Mathematics",
  title: "Lecture - November 27, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Graphs - Section 10.1 - 10.5 <sec:graphs>

== Introduction to Graph Theory <sec:graph-intro>

A *graph* $G = (V, E)$ consists of:
- A set $V$ of *vertices* (or nodes)
- A set $E$ of *edges* connecting pairs of vertices

== Königsberg Bridge Problem <sec:konigsberg>

Given a map of the city of Königsberg, which consists of four landmasses connected by seven bridges, determine whether it is possible to walk through the city in such a way that each bridge is crossed exactly once.

The map of the city of Königsberg can be drawn as a graph, where each landmass is represented by a vertex and each bridge is represented by an edge. The problem can be solved using graph theory, specifically by analyzing the degrees of the vertices.

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Define the four land masses
    // A = Island in the center
    // B = North shore
    // C = South shore
    // D = East shore (between the two rivers)

    let island = (0, 0)
    let north = (0, 2.5)
    let south = (0, -2.5)
    let east = (3, 0)

    // Draw nodes (land masses)
    circle(island, radius: 0.4, fill: rgb(200, 230, 200), stroke: black + 1.5pt, name: "A")
    content(island, [$A$])

    circle(north, radius: 0.4, fill: rgb(200, 230, 200), stroke: black + 1.5pt, name: "B")
    content(north, [$B$])

    circle(south, radius: 0.4, fill: rgb(200, 230, 200), stroke: black + 1.5pt, name: "C")
    content(south, [$C$])

    circle(east, radius: 0.4, fill: rgb(200, 230, 200), stroke: black + 1.5pt, name: "D")
    content(east, [$D$])

    // Draw bridges (edges) - 7 total
    // 2 bridges from A to B (island to north)
    bezier("A.north", "B.south", (-0.6, 1.25), stroke: black + 1pt)
    bezier("A.north", "B.south", (0.6, 1.25), stroke: black + 1pt)

    // 2 bridges from A to C (island to south)
    bezier("A.south", "C.north", (-0.6, -1.25), stroke: black + 1pt)
    bezier("A.south", "C.north", (0.6, -1.25), stroke: black + 1pt)

    // 1 bridge from A to D (island to east)
    line("A.east", "D.west", stroke: black + 1pt)

    // 1 bridge from B to D (north to east)
    line("B.east", "D.north", stroke: black + 1pt)

    // 1 bridge from C to D (south to east)
    line("C.east", "D.south", stroke: black + 1pt)

    // Labels for degrees
    content((-1.2, 0), text(size: 9pt)[$deg = 5$], anchor: "east")
    content((0, 3.2), text(size: 9pt)[$deg = 3$])
    content((0, -3.2), text(size: 9pt)[$deg = 3$])
    content((4.2, 0), text(size: 9pt)[$deg = 3$], anchor: "west")
  }),
  caption: [Graph representation of the Königsberg bridges. The island $A$ has degree 5, while shores $B$, $C$, and $D$ each have degree 3.],
) <fig:konigsberg>

=== Edge and Vertex Terminology

Given vertices $a$ and $b$, we can describe their connections as follows:

+ An *edge* $e$ connects vertices $a$ and $b$
+ *Multiple edges* occur when $a$ and $b$ are connected by more than one edge
+ A *loop* is an edge that connects a vertex to itself
+ A *simple graph* has no multiple edges or loops

#definition(title: "Degree of a Vertex")[
  The *degree* of a vertex $v$ in a graph $G$, denoted $deg(v)$, is the number of edges incident to $v$.

  *Note:* Loops count twice toward the degree.

  #figure(
    cetz.canvas({
      import cetz.draw: *

      // Central vertex
      circle((0, 0), radius: 0.3, fill: white, stroke: black + 1pt, name: "v")
      content((0, 0), [$v$])

      // Connected vertices
      circle((-2, 1), radius: 0.3, fill: white, stroke: black + 1pt, name: "a")
      circle((-1.5, -1.2), radius: 0.3, fill: white, stroke: black + 1pt, name: "b")
      circle((1.5, -1), radius: 0.3, fill: white, stroke: black + 1pt, name: "c")
      circle((2, 0.8), radius: 0.3, fill: white, stroke: black + 1pt, name: "d")

      // Edges to v
      line("v.north-west", "a.south-east", stroke: black + 1pt)
      line("v.south-west", "b.north-east", stroke: black + 1pt)
      line("v.south-east", "c.north-west", stroke: black + 1pt)
      line("v.north-east", "d.south-west", stroke: black + 1pt)

      // Self-loop at v
      arc((name: "v", anchor: 90deg), start: -45deg, delta: 270deg, radius: 0.4, stroke: black + 1pt)

      // Degree label
      content((0, -2), [$deg(v) = 4 + 2 = 6$])
      content((0, -2.5), text(size: 9pt)[(4 edges + 1 loop counting twice)])
    }),
    caption: [Vertex $v$ with degree 6: four edges plus one loop (counted twice)],
  ) <fig:vertex-degree>
] <def:vertex-degree>

== Euler Walks and Circuits <sec:euler-walks>

Euler proposed a method of solving the bridge problem using what is now known as an "Euler walk" or "Euler circuit":

#definition(
  title: "Closed Euler Circuit",
)[
  A *closed Euler circuit* is a path that:
  1. Starts at a vertex $s$
  2. Goes through every edge exactly once
  3. Returns to $s$

  #figure(
    cetz.canvas(
      {
        import cetz.draw: *

        // Draw a simple graph with an Euler circuit
        // Pentagon with all vertices connected to center
        let r = 1.5
        let angles = (90deg, 162deg, 234deg, 306deg, 18deg)

        // Draw vertices
        for (i, angle) in angles.enumerate() {
          let pos = (r * calc.cos(angle), r * calc.sin(angle))
          circle(pos, radius: 0.25, fill: white, stroke: black + 1pt, name: "v" + str(i))
        }

        // Draw edges of pentagon (the Euler circuit path)
        for i in range(5) {
          let next = calc.rem(i + 1, 5)
          line("v" + str(i) + ".center", "v" + str(next) + ".center", stroke: blue + 2pt)
        }

        // Starting vertex marker
        circle((r * calc.cos(90deg), r * calc.sin(90deg)), radius: 0.25, fill: rgb(100, 200, 100), stroke: black + 1.5pt)
        content((r * calc.cos(90deg), r * calc.sin(90deg) + 0.6), [$s$])

        // Arrow showing direction
        content((0, -2.2), [Euler circuit: $s -> v_1 -> v_2 -> v_3 -> v_4 -> s$])
      },
    ),
    caption: [Pentagon graph showing an Euler circuit that visits every edge exactly once],
  ) <fig:euler-circuit>
] <def:euler-circuit>

#definition(title: "Euler Path (Open Euler Walk)")[
  An *Euler path* (or *open Euler walk*) is a walk that:
  - Starts at a vertex $s$
  - Traverses every edge exactly once
  - Ends at a vertex $t$ where $t != s$
] <def:euler-path>

#theorem(title: "Existence of Euler Circuits")[
  A connected graph $G$ has an Euler circuit if and only if every vertex has even degree.
] <thm:euler-circuit-existence>

#theorem(title: "Existence of Euler Paths")[
  A connected graph $G$ has an Euler path if and only if it has exactly zero or two vertices of odd degree.

  - If there are zero vertices of odd degree, the path is actually a circuit
  - If there are exactly two vertices of odd degree, the path must start at one and end at the other
] <thm:euler-path-existence>

== Hierholzer's Algorithm <sec:hierholzer>

This algorithm constructs an Euler circuit when one exists.

=== Step 1: Find Initial Circuit
Choose any starting vertex $v$, and follow a trail of edges from that vertex until returning to $v$.

*Key observation:* It is not possible to get stuck at any vertex other than $v$, because the even degree of all vertices ensures that when the trail enters another vertex $w$, there must be an unused edge leaving $w$.

The tour formed in this way is a closed tour, but may not cover all the vertices and edges of the initial graph.

=== Step 2: Extend the Circuit
As long as there exists a vertex $u$ that:
- Belongs to the current tour, AND
- Has adjacent edges not part of the tour

Do the following:
1. Start another trail from $u$
2. Follow unused edges until returning to $u$
3. Join the tour formed in this way to the previous tour

=== Step 3: Complete the Circuit
Since we assume the original graph is connected, repeating Step 2 will eventually exhaust all edges of the graph, producing a complete Euler circuit.

#rect[
*Algorithm correctness:* This algorithm terminates because each iteration uses at least one edge, and there are finitely many edges. When it terminates, all edges have been used exactly once, giving us an Euler circuit.
]

== Graph Connectivity <sec:connectivity>

#definition(title: "Connected Graph")[
  A graph $G$ is *connected* if there is a path between every pair of vertices.

  Conversely, a graph $G$ is *disconnected* if there exists at least one pair of vertices with no path between them.
] <def:connected>

#definition(title: "Connected Component")[
  A *connected component* of a graph is a maximal connected subgraph. That is, a connected subgraph that is not contained in any larger connected subgraph.
] <def:connected-component>

== Fundamental Graph Theory Results <sec:fundamental-results>

#lemma(name: "Handshake Lemma")[
  In any graph, the sum of the degrees of all vertices is equal to twice the number of edges.

  $
    sum_(v in V(G)) deg(v) = 2 abs(E(G))
  $

  *Proof:* Each edge contributes exactly 2 to the total degree count (one for each endpoint).
] <lem:handshake>

#corollary(name: "Handshake Lemma")[
  In any graph, the number of vertices of odd degree is even.

  *Proof:* Since the sum of all degrees is even (it equals $2abs(E(G))$), if we separate vertices into those with even degree and those with odd degree, the sum of the odd degrees must be even. This is only possible if there are an even number of odd-degree vertices.
] <cor:handshake>

== Paths and Cycles <sec:paths-cycles>

#definition(title: "Path")[
  A *path* is a sequence of vertices $v_1, v_2, dots, v_n$ where each consecutive pair is connected by an edge, and no edge is repeated.

  #figure(
    cetz.canvas({
      import cetz.draw: *

      // P_5: 5 vertices in a line
      for i in range(5) {
        circle((i * 1.5, 0), radius: 0.25, fill: white, stroke: black + 1pt, name: "v" + str(i))
        content((i * 1.5, -0.6), [$v_#(i + 1)$])
      }

      // Connect consecutive vertices
      for i in range(4) {
        line("v" + str(i) + ".east", "v" + str(i + 1) + ".west", stroke: black + 1pt)
      }

      content((3, -1.3), [$P_5$])
    }),
    caption: [Path $P_5$ with 5 vertices and 4 edges],
  ) <fig:path>

  The *length* of a path is the number of edges in it.
] <def:path>

#definition(title: "Cycle")[
  A *cycle* is a path that starts and ends at the same vertex, with at least one edge, and no other vertex is repeated.

  #figure(
    cetz.canvas(
      {
        import cetz.draw: *

        // Helper to draw a cycle
        let draw-cycle(cx, n, r: 1) = {
          let angles = range(n).map(i => 90deg + i * 360deg / n)

          // Draw vertices
          for (i, angle) in angles.enumerate() {
            let pos = (cx + r * calc.cos(angle), r * calc.sin(angle))
            circle(pos, radius: 0.2, fill: white, stroke: black + 1pt, name: "c" + str(n) + "v" + str(i))
          }

          // Draw edges
          for i in range(n) {
            let next = calc.rem(i + 1, n)
            line("c" + str(n) + "v" + str(i) + ".center", "c" + str(n) + "v" + str(next) + ".center", stroke: black + 1pt)
          }

          // Label
          content((cx, -r - 0.6), [$C_#n$])
        }

        // Draw C_3, C_4, C_5, C_6
        draw-cycle(0, 3, r: 0.8)
        draw-cycle(3, 4, r: 0.9)
        draw-cycle(6.5, 5, r: 1)
        draw-cycle(10.5, 6, r: 1.1)
      },
    ),
    caption: [Cycle graphs $C_3$, $C_4$, $C_5$, and $C_6$],
  ) <fig:cycles>
] <def:cycle>

#definition(title: "Simple Path")[
  A *simple path* is a path in which no vertex is repeated (except possibly the first and last in the case of a cycle).
] <def:simple-path>

== Special Graph Types <sec:special-graphs>

#definition(title: "Complete Graph")[
  A *complete graph* $K_n$ is a simple graph with $n$ vertices in which every pair of distinct vertices is connected by an edge.

  #figure(
    cetz.canvas({
      import cetz.draw: *

      // K_3 (triangle)
      let cx1 = 0
      let r1 = 0.8
      let angles3 = (90deg, 210deg, 330deg)

      for (i, angle) in angles3.enumerate() {
        let pos = (cx1 + r1 * calc.cos(angle), r1 * calc.sin(angle))
        circle(pos, radius: 0.2, fill: white, stroke: black + 1pt, name: "k3v" + str(i))
      }

      // All edges
      line("k3v0.center", "k3v1.center", stroke: black + 1pt)
      line("k3v1.center", "k3v2.center", stroke: black + 1pt)
      line("k3v2.center", "k3v0.center", stroke: black + 1pt)

      content((cx1, -1.5), [$K_3$])

      // K_4 (complete graph on 4 vertices)
      let cx2 = 3
      let r2 = 0.9
      let angles4 = (45deg, 135deg, 225deg, 315deg)

      for (i, angle) in angles4.enumerate() {
        let pos = (cx2 + r2 * calc.cos(angle), r2 * calc.sin(angle))
        circle(pos, radius: 0.2, fill: white, stroke: black + 1pt, name: "k4v" + str(i))
      }

      // All 6 edges
      for i in range(4) {
        for j in range(i + 1, 4) {
          line("k4v" + str(i) + ".center", "k4v" + str(j) + ".center", stroke: black + 1pt)
        }
      }

      content((cx2, -1.6), [$K_4$])

      // K_5 (complete graph on 5 vertices)
      let cx3 = 6.5
      let r3 = 1
      let angles5 = range(5).map(i => 90deg + i * 72deg)

      for (i, angle) in angles5.enumerate() {
        let pos = (cx3 + r3 * calc.cos(angle), r3 * calc.sin(angle))
        circle(pos, radius: 0.2, fill: white, stroke: black + 1pt, name: "k5v" + str(i))
      }

      // All 10 edges
      for i in range(5) {
        for j in range(i + 1, 5) {
          line("k5v" + str(i) + ".center", "k5v" + str(j) + ".center", stroke: black + 1pt)
        }
      }

      content((cx3, -1.7), [$K_5$])

      // K_6 (complete graph on 6 vertices)
      let cx4 = 10.5
      let r4 = 1.1
      let angles6 = range(6).map(i => 90deg + i * 60deg)

      for (i, angle) in angles6.enumerate() {
        let pos = (cx4 + r4 * calc.cos(angle), r4 * calc.sin(angle))
        circle(pos, radius: 0.2, fill: white, stroke: black + 1pt, name: "k6v" + str(i))
      }

      // All 15 edges
      for i in range(6) {
        for j in range(i + 1, 6) {
          line("k6v" + str(i) + ".center", "k6v" + str(j) + ".center", stroke: black + 1pt)
        }
      }

      content((cx4, -1.8), [$K_6$])
    }),
    caption: [Complete graphs $K_3$, $K_4$, $K_5$, and $K_6$],
  ) <fig:complete-graphs>

  The number of edges in $K_n$ is $binom(n, 2) = (n(n-1))/2$.
] <def:complete-graph>

#definition(title: "Bipartite Graph")[
  A graph $G = (V, E)$ is *bipartite* if the vertex set $V$ can be partitioned into two disjoint sets $V_1$ and $V_2$ such that every edge connects a vertex in $V_1$ to a vertex in $V_2$.
] <def:bipartite>

#definition(title: "Complete Bipartite Graph")[
  A *complete bipartite graph* $K_(m,n)$ is a bipartite graph where every vertex in one partition is connected to every vertex in the other partition.

  #figure(
    cetz.canvas({
      import cetz.draw: *

      // K_{2,3} - Complete bipartite graph
      let cx1 = 0

      // Set U (left side, 2 vertices)
      rect((cx1 - 1.2, -1.8), (cx1 + 1.2, 1.8), stroke: blue + 1pt, fill: rgb(200, 200, 255, 50))
      content((cx1, 2.2), text(fill: blue)[$U$])

      circle((cx1, 1), radius: 0.25, fill: white, stroke: black + 1pt, name: "k23u0")
      circle((cx1, -1), radius: 0.25, fill: white, stroke: black + 1pt, name: "k23u1")

      // Set V (right side, 3 vertices)
      let vx1 = cx1 + 4
      rect((vx1 - 1.2, -2.3), (vx1 + 1.2, 2.3), stroke: red + 1pt, fill: rgb(255, 200, 200, 50))
      content((vx1, 2.7), text(fill: red)[$V$])

      circle((vx1, 1.5), radius: 0.25, fill: white, stroke: black + 1pt, name: "k23v0")
      circle((vx1, 0), radius: 0.25, fill: white, stroke: black + 1pt, name: "k23v1")
      circle((vx1, -1.5), radius: 0.25, fill: white, stroke: black + 1pt, name: "k23v2")

      // All edges between U and V
      line("k23u0.east", "k23v0.west", stroke: black + 1pt)
      line("k23u0.east", "k23v1.west", stroke: black + 1pt)
      line("k23u0.east", "k23v2.west", stroke: black + 1pt)
      line("k23u1.east", "k23v0.west", stroke: black + 1pt)
      line("k23u1.east", "k23v1.west", stroke: black + 1pt)
      line("k23u1.east", "k23v2.west", stroke: black + 1pt)

      content((cx1 + 2, -3), [$K_(2,3)$])

      // K_{3,3} - Complete bipartite graph
      let cx2 = 9

      // Set U (left side, 3 vertices)
      rect((cx2 - 1.2, -2.3), (cx2 + 1.2, 2.3), stroke: blue + 1pt, fill: rgb(200, 200, 255, 50))
      content((cx2, 2.7), text(fill: blue)[$U$])

      circle((cx2, 1.5), radius: 0.25, fill: white, stroke: black + 1pt, name: "k33u0")
      circle((cx2, 0), radius: 0.25, fill: white, stroke: black + 1pt, name: "k33u1")
      circle((cx2, -1.5), radius: 0.25, fill: white, stroke: black + 1pt, name: "k33u2")

      // Set V (right side, 3 vertices)
      let vx2 = cx2 + 4
      rect((vx2 - 1.2, -2.3), (vx2 + 1.2, 2.3), stroke: red + 1pt, fill: rgb(255, 200, 200, 50))
      content((vx2, 2.7), text(fill: red)[$V$])

      circle((vx2, 1.5), radius: 0.25, fill: white, stroke: black + 1pt, name: "k33v0")
      circle((vx2, 0), radius: 0.25, fill: white, stroke: black + 1pt, name: "k33v1")
      circle((vx2, -1.5), radius: 0.25, fill: white, stroke: black + 1pt, name: "k33v2")

      // All 9 edges between U and V
      for i in range(3) {
        for j in range(3) {
          line("k33u" + str(i) + ".east", "k33v" + str(j) + ".west", stroke: black + 1pt)
        }
      }

      content((cx2 + 2, -3), [$K_(3,3)$])
    }),
    caption: [Complete bipartite graphs $K_(2,3)$ and $K_(3,3)$],
  ) <fig:bipartite>
] <def:complete-bipartite>

#definition(title: "Wheel Graph")[
  A *wheel graph* $W_n$ is formed by connecting a single central vertex (the hub) to all vertices of a cycle $C_n$.

  #figure(
    cetz.canvas({
      import cetz.draw: *

      // W_3 (triangle with center)
      let cx1 = 0
      let r1 = 1
      let angles3 = (90deg, 210deg, 330deg)

      // Center vertex
      circle((cx1, 0), radius: 0.2, fill: rgb(255, 200, 200), stroke: black + 1pt, name: "w3c")

      // Outer vertices
      for (i, angle) in angles3.enumerate() {
        let pos = (cx1 + r1 * calc.cos(angle), r1 * calc.sin(angle))
        circle(pos, radius: 0.2, fill: white, stroke: black + 1pt, name: "w3v" + str(i))
      }

      // Edges of outer cycle
      for i in range(3) {
        let next = calc.rem(i + 1, 3)
        line("w3v" + str(i) + ".center", "w3v" + str(next) + ".center", stroke: black + 1pt)
      }

      // Spokes to center
      for i in range(3) {
        line("w3c.center", "w3v" + str(i) + ".center", stroke: black + 1pt)
      }

      content((cx1, -1.8), [$W_3$])

      // W_5 (pentagon with center)
      let cx2 = 4
      let r2 = 1.2
      let angles5 = range(5).map(i => 90deg + i * 72deg)

      // Center vertex
      circle((cx2, 0), radius: 0.2, fill: rgb(255, 200, 200), stroke: black + 1pt, name: "w5c")

      // Outer vertices
      for (i, angle) in angles5.enumerate() {
        let pos = (cx2 + r2 * calc.cos(angle), r2 * calc.sin(angle))
        circle(pos, radius: 0.2, fill: white, stroke: black + 1pt, name: "w5v" + str(i))
      }

      // Edges of outer cycle
      for i in range(5) {
        let next = calc.rem(i + 1, 5)
        line("w5v" + str(i) + ".center", "w5v" + str(next) + ".center", stroke: black + 1pt)
      }

      // Spokes to center
      for i in range(5) {
        line("w5c.center", "w5v" + str(i) + ".center", stroke: black + 1pt)
      }

      content((cx2, -2), [$W_5$])

      // W_6 (hexagon with center)
      let cx3 = 8.5
      let r3 = 1.3
      let angles6 = range(6).map(i => 90deg + i * 60deg)

      // Center vertex
      circle((cx3, 0), radius: 0.2, fill: rgb(255, 200, 200), stroke: black + 1pt, name: "w6c")

      // Outer vertices
      for (i, angle) in angles6.enumerate() {
        let pos = (cx3 + r3 * calc.cos(angle), r3 * calc.sin(angle))
        circle(pos, radius: 0.2, fill: white, stroke: black + 1pt, name: "w6v" + str(i))
      }

      // Edges of outer cycle
      for i in range(6) {
        let next = calc.rem(i + 1, 6)
        line("w6v" + str(i) + ".center", "w6v" + str(next) + ".center", stroke: black + 1pt)
      }

      // Spokes to center
      for i in range(6) {
        line("w6c.center", "w6v" + str(i) + ".center", stroke: black + 1pt)
      }

      content((cx3, -2.1), [$W_6$])
    }),
    caption: [Wheel graphs $W_3$, $W_5$, and $W_6$],
  ) <fig:wheel-graphs>


  - $W_n$ has $n + 1$ vertices (n vertices in the cycle plus 1 hub)
  - $W_n$ has $2n$ edges (n edges in the cycle plus n spokes from hub to cycle vertices)
  - The hub vertex has degree $n$
  - Each cycle vertex has degree 3 (connected to hub and two neighbors in cycle)



] <def:wheel-graph>



== The n-Cube (Hypercube) <sec:hypercube>

#definition(title: "n-Cube Graph")[
  The *n-cube* (or *hypercube*) $Q_n$ is defined as follows:

  $
    V(Q_n) = { (x_1, x_2, dots, x_n) divides x_i in {0,1} }
  $

  Two vertices $(x_1, dots, x_n)$ and $(y_1, dots, y_n)$ are adjacent (connected by an edge) if and only if they differ in exactly one coordinate. That is:

  $
    exists ! i : x_i != y_i
  $


  #figure(
    cetz.canvas({
      import cetz.draw: *

      // Q_1 (just an edge)
      let cx1 = 0
      circle((cx1 - 0.5, 0), radius: 0.2, fill: white, stroke: black + 1pt, name: "q1v0")
      content((cx1 - 0.5, -0.5), text(size: 8pt)[0])
      circle((cx1 + 0.5, 0), radius: 0.2, fill: white, stroke: black + 1pt, name: "q1v1")
      content((cx1 + 0.5, -0.5), text(size: 8pt)[1])
      line("q1v0.east", "q1v1.west", stroke: black + 1pt)
      content((cx1, -1.2), [$Q_1$])

      // Q_2 (square)
      let cx2 = 3
      let sq = 0.7
      circle((cx2 - sq, -sq), radius: 0.2, fill: white, stroke: black + 1pt, name: "q2v00")
      content((cx2 - sq, -sq - 0.4), text(size: 8pt)[00])
      circle((cx2 + sq, -sq), radius: 0.2, fill: white, stroke: black + 1pt, name: "q2v01")
      content((cx2 + sq, -sq - 0.4), text(size: 8pt)[01])
      circle((cx2 - sq, sq), radius: 0.2, fill: white, stroke: black + 1pt, name: "q2v10")
      content((cx2 - sq, sq + 0.4), text(size: 8pt)[10])
      circle((cx2 + sq, sq), radius: 0.2, fill: white, stroke: black + 1pt, name: "q2v11")
      content((cx2 + sq, sq + 0.4), text(size: 8pt)[11])

      line("q2v00.east", "q2v01.west", stroke: black + 1pt)
      line("q2v10.east", "q2v11.west", stroke: black + 1pt)
      line("q2v00.north", "q2v10.south", stroke: black + 1pt)
      line("q2v01.north", "q2v11.south", stroke: black + 1pt)
      content((cx2, -1.5), [$Q_2$])

      // Q_3 (cube - isometric projection)
      let cx3 = 7.5
      let d = 1.2 // outer square size
      let s = 0.5 // inner offset

      // Back face (inner square)
      circle((cx3 - s, -s), radius: 0.15, fill: rgb(200, 200, 255), stroke: black + 1pt, name: "q3v000")
      circle((cx3 + d - s, -s), radius: 0.15, fill: rgb(200, 200, 255), stroke: black + 1pt, name: "q3v001")
      circle((cx3 - s, d - s), radius: 0.15, fill: rgb(200, 200, 255), stroke: black + 1pt, name: "q3v010")
      circle((cx3 + d - s, d - s), radius: 0.15, fill: rgb(200, 200, 255), stroke: black + 1pt, name: "q3v011")

      // Front face (outer square)
      circle((cx3 - d / 2, -d / 2), radius: 0.15, fill: white, stroke: black + 1pt, name: "q3v100")
      circle((cx3 + d / 2, -d / 2), radius: 0.15, fill: white, stroke: black + 1pt, name: "q3v101")
      circle((cx3 - d / 2, d / 2), radius: 0.15, fill: white, stroke: black + 1pt, name: "q3v110")
      circle((cx3 + d / 2, d / 2), radius: 0.15, fill: white, stroke: black + 1pt, name: "q3v111")

      // Back face edges
      line("q3v000.center", "q3v001.center", stroke: gray + 1pt)
      line("q3v010.center", "q3v011.center", stroke: gray + 1pt)
      line("q3v000.center", "q3v010.center", stroke: gray + 1pt)
      line("q3v001.center", "q3v011.center", stroke: gray + 1pt)

      // Front face edges
      line("q3v100.center", "q3v101.center", stroke: black + 1pt)
      line("q3v110.center", "q3v111.center", stroke: black + 1pt)
      line("q3v100.center", "q3v110.center", stroke: black + 1pt)
      line("q3v101.center", "q3v111.center", stroke: black + 1pt)

      // Connecting edges (depth)
      line("q3v000.center", "q3v100.center", stroke: black + 1pt)
      line("q3v001.center", "q3v101.center", stroke: black + 1pt)
      line("q3v010.center", "q3v110.center", stroke: black + 1pt)
      line("q3v011.center", "q3v111.center", stroke: black + 1pt)

      // Labels
      content((cx3 - s, -s - 0.4), text(size: 7pt)[000])
      content((cx3 + d - s, -s - 0.4), text(size: 7pt)[001])
      content((cx3 - d / 2 - 0.4, -d / 2), text(size: 7pt)[100])
      content((cx3 + d / 2 + 0.4, -d / 2), text(size: 7pt)[101])
      content((cx3 - s - 0.4, d - s), text(size: 7pt)[010])
      content((cx3 + d - s + 0.4, d - s), text(size: 7pt)[011])
      content((cx3 - d / 2 - 0.4, d / 2), text(size: 7pt)[110])
      content((cx3 + d / 2 + 0.4, d / 2), text(size: 7pt)[111])

      content((cx3, -1.5), [$Q_3$])
    }),
    caption: [n-Cube graphs: $Q_1$ (edge), $Q_2$ (square), and $Q_3$ (cube)],
  ) <fig:hypercubes>
] <def:hypercube>

*Properties of $Q_n$:*
- Number of vertices: $2^n$
- Each vertex has degree $n$ (can flip any of the $n$ coordinates)
- Number of edges: $(n dot 2^n)/2 = n dot 2^(n-1)$ (by the Handshake Lemma)
- $Q_n$ is bipartite: partition vertices by parity of the sum of their coordinates

*Examples:*
- $Q_1$: A single edge connecting $(0)$ and $(1)$
- $Q_2$: A square with vertices $(0,0), (0,1), (1,0), (1,1)$
- $Q_3$: A cube with 8 vertices representing all binary strings of length 3

== Trees <sec:trees>

#definition(title: "Tree")[
  A *tree* is a connected graph with no cycles.

  A *forest* is a graph with no cycles (possibly disconnected).
] <def:tree>

#theorem(title: "Properties of Trees")[
  The following are equivalent for a graph $T$ with $n$ vertices:
  1. $T$ is a tree (connected and acyclic)
  2. $T$ is connected and has $n-1$ edges
  3. $T$ is acyclic and has $n-1$ edges
  4. There is exactly one path between any two vertices in $T$
] <thm:tree-properties>

=== Family Trees

Family trees are a practical application of tree structures in graph theory, used to represent genealogical relationships.

#definition(title: "Family Tree")[
  A *family tree* is a tree-like structure (often a directed acyclic graph) that represents family relationships. In its simplest form as an undirected tree:

  #figure(
    cetz.canvas({
      import cetz.draw: *

      // A simple family tree (women only, matrilineal)
      // Great-grandmother at top
      circle((4, 4), radius: 0.3, fill: rgb(255, 200, 220), stroke: black + 1pt, name: "gg")
      content((4, 4), text(size: 8pt)[Anna])

      // Grandmother level (2 daughters)
      circle((2, 2.5), radius: 0.3, fill: rgb(255, 200, 220), stroke: black + 1pt, name: "g1")
      content((2, 2.5), text(size: 8pt)[Beth])

      circle((6, 2.5), radius: 0.3, fill: rgb(255, 200, 220), stroke: black + 1pt, name: "g2")
      content((6, 2.5), text(size: 8pt)[Cara])

      // Mother level (3 daughters total)
      circle((1, 1), radius: 0.3, fill: rgb(255, 200, 220), stroke: black + 1pt, name: "m1")
      content((1, 1), text(size: 8pt)[Dina])

      circle((3, 1), radius: 0.3, fill: rgb(255, 200, 220), stroke: black + 1pt, name: "m2")
      content((3, 1), text(size: 8pt)[Emma])

      circle((6, 1), radius: 0.3, fill: rgb(255, 200, 220), stroke: black + 1pt, name: "m3")
      content((6, 1), text(size: 8pt)[Fiona])

      // Edges (parent-child relationships)
      line("gg.south-west", "g1.north", stroke: black + 1pt)
      line("gg.south-east", "g2.north", stroke: black + 1pt)

      line("g1.south-west", "m1.north", stroke: black + 1pt)
      line("g1.south-east", "m2.north", stroke: black + 1pt)

      line("g2.south", "m3.north", stroke: black + 1pt)

      // Labels
      content((8, 4), text(size: 9pt)[Root (ancestor)], anchor: "west")
      content((8, 1), text(size: 9pt)[Leaves (descendants)], anchor: "west")
    }),
    caption: [Family tree showing matrilineal relationships across three generations],
  ) <fig:family-tree>

  - Each vertex represents a person
  - Edges represent parent-child relationships
  - The root typically represents the earliest known ancestor
  - Leaves represent the youngest generation with no known descendants

  *Properties:*
  - No cycles (you cannot be your own ancestor through any path)
  - Connected structure showing lineage
  - Can be represented as a rooted tree with the oldest ancestor as root
] <def:family-tree>

== Hamilton Paths and Circuits <sec:hamilton>

#definition(title: "Hamilton Path")[
  A *Hamilton path* in a graph is a path that visits every vertex exactly once.
] <def:hamilton-path>

#definition(title: "Hamilton Circuit")[
  A *Hamilton circuit* in a graph is a cycle that visits every vertex exactly once (except for returning to the start).
] <def:hamilton-circuit>

*Note:* Unlike Euler circuits, there is no simple condition to determine whether a graph has a Hamilton circuit. This is a much harder problem (NP-complete).

== Graph Representations <sec:graph-representations>

Graphs can be represented in multiple ways:

1. *Adjacency Matrix:* An $n times n$ matrix $A$ where $A[i,j]$ is the number of edges between vertices $i$ and $j$

2. *Adjacency List:* For each vertex, maintain a list of its neighbors

3. *Edge List:* Simply list all edges as pairs of vertices

== The Marriage Problem (Hall's Marriage Theorem) <sec:marriage-problem>

The marriage problem is a classic problem in graph theory that asks: Given a set of $n$ women and $n$ men, where each woman knows some subset of the men, under what conditions can we arrange $n$ marriages such that each woman marries a man she knows?

This problem can be modeled as a *matching problem* in a bipartite graph.

#definition(title: "Matching")[
  A *matching* in a graph is a set of edges with no common vertices. That is, no two edges in the matching share an endpoint.

  A *perfect matching* is a matching that covers all vertices of the graph.
] <def:matching>

#definition(title: "Complete Matching")[
  In a bipartite graph $G = (X union Y, E)$, a *complete matching from $X$ to $Y$* is a matching that covers every vertex in $X$.
] <def:complete-matching>

#theorem(title: "Hall's Marriage Theorem")[
  Let $G = (X union Y, E)$ be a bipartite graph. There exists a complete matching from $X$ to $Y$ if and only if for every subset $S subset.eq X$, the neighborhood $N(S)$ satisfies:

  $
    |N(S)| >= |S|
  $

  where $N(S)$ is the set of all vertices in $Y$ that are adjacent to at least one vertex in $S$.

  This condition is known as *Hall's condition* or the *marriage condition*.
] <thm:hall-marriage>

*Interpretation:* For any group of women, the number of men they collectively know must be at least as large as the number of women in that group.

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Example 1: Graph WITH perfect matching
    content((2, 3), text(weight: "bold", [Has Perfect Matching]))

    // Women (left side)
    for i in range(3) {
      circle((0, 2 - i * 0.8), radius: 0.15, fill: rgb(255, 200, 220), name: "w" + str(i))
      content((-0.5, 2 - i * 0.8), [$w_#(i+1)$])
    }

    // Men (right side)
    for i in range(3) {
      circle((2, 2 - i * 0.8), radius: 0.15, fill: rgb(200, 220, 255), name: "m" + str(i))
      content((2.5, 2 - i * 0.8), [$m_#(i+1)$])
    }

    // Edges (who knows whom)
    line("w0", "m0", stroke: black + 1pt)
    line("w0", "m1", stroke: black + 1pt)
    line("w1", "m1", stroke: black + 1pt)
    line("w1", "m2", stroke: black + 1pt)
    line("w2", "m2", stroke: black + 1pt)

    // Highlight perfect matching
    line("w0", "m0", stroke: red + 2pt)
    line("w1", "m1", stroke: red + 2pt)
    line("w2", "m2", stroke: red + 2pt)

    content((1, -0.5), text(size: 8pt, fill: red, [Red edges show perfect matching]))

    // Example 2: Graph WITHOUT perfect matching
    content((6, 3), text(weight: "bold", [No Perfect Matching]))

    // Women (left side)
    for i in range(3) {
      circle((4, 2 - i * 0.8), radius: 0.15, fill: rgb(255, 200, 220), name: "v" + str(i))
      content((3.5, 2 - i * 0.8), [$w_#(i+1)$])
    }

    // Men (right side)
    for i in range(3) {
      circle((6, 2 - i * 0.8), radius: 0.15, fill: rgb(200, 220, 255), name: "n" + str(i))
      content((6.5, 2 - i * 0.8), [$m_#(i+1)$])
    }

    // Edges - violates Hall's condition
    line("v0", "n0", stroke: black + 1pt)
    line("v1", "n0", stroke: black + 1pt)
    line("v2", "n1", stroke: black + 1pt)
    line("v2", "n2", stroke: black + 1pt)

    content((5, -0.5), text(size: 8pt, [{$w_1, w_2$} know only {$m_1$}]))
    content((5, -0.8), text(size: 8pt, [Violates Hall's condition: $|S| = 2 > 1 = |N(S)|$]))
  }),
  caption: [Bipartite graphs illustrating Hall's Marriage Theorem: left satisfies Hall's condition with a perfect matching, right violates it]
) <fig:marriage-problem>

*Example Applications:*
- Job assignments (workers to jobs)
- Student course registration (students to courses with limited capacity)
- Resource allocation
- Network flow problems


== Graph isomorphism

#definition(title: "The graph isomorphism problem")[

  $
    tilde.eq
  $
]
