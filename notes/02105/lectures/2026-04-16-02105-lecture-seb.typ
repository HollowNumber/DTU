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
#show smallcaps: set text(font: "Liga SFMono Nerd Font")
#show raw: set text(font: "Liga SFMono Nerd Font")
#set text(font: "Helvetica")

#show: dtu-note.with(
  course: "02105",
  course-name: "Algorithms and Data Structures 1",
  title: "Lecture - April 16, 2026",
  date: datetime(year: 2026, month: 4, day: 16),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

#outline()

= Exercises
#import "@preview/cetz:0.4.2"

#figure(
  cetz.canvas(
    {
      import cetz.draw: *

      // Node positions
      let nodes = (
        "0": (-4, 0),
        "1": (-1.5, 2),
        "2": (1.5, 2),
        "3": (4, 2),
        "4": (0, 0),
        "5": (-1.5, -2),
        "6": (1.5, -2),
        "7": (4, -2),
        "8": (6.5, 0),
      )

      // Draw edges first (behind nodes)
      let edges = (
        ("0", "1", "4", left),
        ("0", "5", "8", left),
        ("1", "2", "8", top),
        ("1", "5", "11", right),
        ("2", "3", "7", top),
        ("2", "4", "2", right),
        ("2", "7", "4", right),
        ("3", "7", "14", right),
        ("3", "8", "9", right),
        ("4", "5", "7", left),
        ("4", "6", "6", right),
        ("5", "6", "1", top),
        ("6", "7", "2", top),
        ("7", "8", "10", top),
      )

      for (a, b, w, side) in edges {
        let pa = nodes.at(a)
        let pb = nodes.at(b)
        line(pa, pb, stroke: black + 1pt)
        // midpoint for label
        let mx = (pa.at(0) + pb.at(0)) / 2
        let my = (pa.at(1) + pb.at(1)) / 2
        let anchor = if side == top { "south" } else if side == left { "east" } else if side == right { "west" } else { "north" }
        content((mx, my), text(size: 9pt)[#w], anchor: anchor, padding: 0.08)
      }

      // Draw nodes on top
      for (label, pos) in nodes {
        circle(pos, radius: 0.35, fill: white, stroke: black + 1pt)
        content(pos, text(size: 10pt)[#label])
      }
    },
  ),
  caption: [Graph for the exercises.],
)

#programming-problem(
  number: 1,
)[
==== Algorithms and Properties
Look at the graph $G$ in Figure 1.

#programming-problem(
  number: 1.1,
  difficulty: [\[w\]],
)[
  Run Kruskal's algorithm on $G$ by hand.

  #solution(
    )[
    kruskal's Algorithm works by sorting the edges in non-decreasing order of weight and adding them to the MST if they do not form a cycle. The edges in sorted order are:

    sorting the edges by weight, we get:
    1. (5, 6) with weight 1
    2. (6, 7) with weight 2
    3. (2, 4) with weight 2
    4. (0, 1) with weight 4
    5. (2, 7) with weight 4
    6. (2, 3) with weight 7
    7. (1, 2) with weight 8
    8. (3, 8) with weight 9

    Drawing the resulting MST:
    #import "@preview/cetz:0.4.2"

    #figure(cetz.canvas({
      import cetz.draw: *

      let nodes = (
        "0": (-4, 0),
        "1": (-1.5, 2),
        "2": (1.5, 2),
        "3": (4, 2),
        "4": (0, 0),
        "5": (-1.5, -2),
        "6": (1.5, -2),
        "7": (4, -2),
        "8": (6.5, 0),
      )

      let mst-edges = (
        ("5", "6", "1"),
        ("6", "7", "2"),
        ("2", "4", "2"),
        ("0", "1", "4"),
        ("2", "7", "4"),
        ("2", "3", "7"),
        ("0", "5", "8"),
        ("3", "8", "9"),
      )

      for (a, b, w) in mst-edges {
        let pa = nodes.at(a)
        let pb = nodes.at(b)
        line(pa, pb, stroke: red + 2pt)
        let mx = (pa.at(0) + pb.at(0)) / 2
        let my = (pa.at(1) + pb.at(1)) / 2
        content((mx, my), text(size: 8pt, fill: red)[#w], frame: "rect", fill: white, stroke: none, padding: 0.05)
      }

      for (label, pos) in nodes {
        circle(pos, radius: 0.35, fill: white, stroke: black + 1pt)
        content(pos, text(size: 10pt)[#label])
      }
    }), caption: [MST from Kruskal's algorithm (total weight = 37).])
  ]
]

#programming-problem(
  number: 1.2,
)[
  Run Prim's algorithm on $G$ starting in node 0 by hand. Show the contents of the priority queue during the execution.

  #solution(
    )[
    Prim's Algorithm starts at node 0 and grows the MST by adding the lightest edge that connects a vertex in the MST to a vertex outside the MST. The priority queue will contain the edges that connect the current MST to the rest of the graph, prioritized by their weight.

    Starting at node 0, we add its edges to the priority queue:
    - (0, 1) with weight 4
    - (0, 5) with weight 8

    We select (0, 1) and add it to the MST. Now we add edges from node 1:
    - (1, 2) with weight 8

    Next, we select (0, 5) and add it to the MST. Now we add edges from node 5:
    - (5, 6) with weight 1

    Next, we select (5, 6) and add it to the MST. Now we add edges from node 6:
    - (6, 7) with weight 2

    Next, we select (6, 7) and add it to the MST. Now we add edges from node 7:
    - (7, 8) with weight 10

    Next, we select (1, 2) and add it to the MST. Now we add edges from node 2:
    - (2, 3) with weight 7
    - (2, 4) with weight 2
    - (2, 7) with weight 4

    Next, we select (2, 4) and add it to the MST. Now we add edges from node 4:
    - (4, 5) with weight 7
    - (4, 6) with weight 6

    Next, we select (2, 7) and add it to the MST. Node 7 is already in the MST so we do not add any new edges.

    Finally, we select (2, 3) and add it to the MST. Now we have all nodes connected.

    The final MST is the same as Kruskal's algorithm with total weight = 37.

  ]
]

#programming-problem(number: 1.3)[
Show all the minimum spanning trees of $G$.

#solution()[
There's a total of 2 MST's both with total weight 37.
```
      MST 1: (5,6)=1, (2,4)=2, (6,7)=2, (0,1)=4, (2,7)=4, (2,3)=7, (0,5)=8, (3,8)=9
      MST 2: (5,6)=1, (2,4)=2, (6,7)=2, (0,1)=4, (2,7)=4, (2,3)=7, (1,2)=8, (3,8)=9
      ```

#grid(columns: (1fr, 1fr), gutter: 1em, align: center, [
  #figure(cetz.canvas({
    import cetz.draw: *
    let nodes = (
      "0": (-4, 0),
      "1": (-1.5, 2),
      "2": (1.5, 2),
      "3": (4, 2),
      "4": (0, 0),
      "5": (-1.5, -2),
      "6": (1.5, -2),
      "7": (4, -2),
      "8": (6.5, 0),
    )
    let mst1 = (
      ("5", "6", "1"),
      ("6", "7", "2"),
      ("2", "4", "2"),
      ("0", "1", "4"),
      ("2", "7", "4"),
      ("2", "3", "7"),
      ("0", "5", "8"),
      ("3", "8", "9"),
    )
    for (a, b, w) in mst1 {
      let pa = nodes.at(a)
      let pb = nodes.at(b)
      line(pa, pb, stroke: red + 1.5pt)
      let mx = (pa.at(0) + pb.at(0)) / 2
      let my = (pa.at(1) + pb.at(1)) / 2
      content((mx, my), text(size: 7pt, fill: red)[#w], frame: "rect", fill: white, stroke: none, padding: 0.04)
    }
    for (label, pos) in nodes {
      circle(pos, radius: 0.3, fill: white, stroke: black + 1pt)
      content(pos, text(size: 9pt)[#label])
    }
  }), caption: [MST 1 — uses $(0,5)=8$])
], [
  #figure(cetz.canvas({
    import cetz.draw: *
    let nodes = (
      "0": (-4, 0),
      "1": (-1.5, 2),
      "2": (1.5, 2),
      "3": (4, 2),
      "4": (0, 0),
      "5": (-1.5, -2),
      "6": (1.5, -2),
      "7": (4, -2),
      "8": (6.5, 0),
    )
    let mst2 = (
      ("5", "6", "1"),
      ("6", "7", "2"),
      ("2", "4", "2"),
      ("0", "1", "4"),
      ("2", "7", "4"),
      ("2", "3", "7"),
      ("1", "2", "8"),
      ("3", "8", "9"),
    )
    for (a, b, w) in mst2 {
      let pa = nodes.at(a)
      let pb = nodes.at(b)
      line(pa, pb, stroke: red + 1.5pt)
      let mx = (pa.at(0) + pb.at(0)) / 2
      let my = (pa.at(1) + pb.at(1)) / 2
      content((mx, my), text(size: 7pt, fill: red)[#w], frame: "rect", fill: white, stroke: none, padding: 0.04)
    }
    for (label, pos) in nodes {
      circle(pos, radius: 0.3, fill: white, stroke: black + 1pt)
      content(pos, text(size: 9pt)[#label])
    }
  }), caption: [MST 2 — uses $(1,2)=8$])
])

]
]

#programming-problem(
  number: 1.4,
)[
  Give an efficient algorithm to find a spanning tree.

  #solution(
    )[
    #pseudocode-list()[
      + SPANNING-TREE(G):
        + mark start node as visited
        + add start node to queue
        + T = $emptyset$
        + while queue not empty:
          + u = dequeue
          + for each neighbor v of u:
            + if v not visited:
              + mark v as visited
              + T = T ∪ {(u,v)}
              + enqueue v
          + return T
    ]

    This is simply just a breadth-first search (BFS) or depth-first search (DFS) which runs in $O(n + m)$ time, where $n$ is the number of nodes and $m$ is the number of edges in the graph. The resulting tree will be a spanning tree since it will include all nodes and will not contain any cycles.

  ]
]
]

#programming-problem(
  number: 2,
)[
  ==== Reverse Deletion
  Consider the following algorithm to compute a MST. Start with a weighted connected graph $G$. Look at the edges of $G$ in order from the heaviest to the lightest edge. For each edge determine if removal of that edge disconnects the graph. If not, remove it; otherwise leave it. Return the final set of remaining edges.

  #programming-problem(
    number: 2.1,
  )[
    Run the algorithm on the graph in Figure 1 by hand.

    #solution(
      )[
      This is just the reverse of Kruskal's algorithm, so we will start with all edges and remove them in order of decreasing weight if they do not disconnect the graph.

      The edges in decreasing order of weight are:
      1. (3, 8) with weight 9
      2. (0, 5) with weight 8
      3. (1, 2) with weight 8
      4. (2, 3) with weight 7
      5. (4, 5) with weight 7
      6. (4, 6) with weight 6
      7. (7, 8) with weight 10
      8. (0, 1) with weight 4
      9. (2, 7) with weight 4
      10. (2, 4) with weight 2
      11. (6, 7) with weight 2
      12. (5, 6) with weight 1

      We start with all edges in the graph. We check each edge in decreasing order of weight:
      - (3, 8): Removing this edge does not disconnect the graph, so we remove it.
      - (0, 5): Removing this edge does not disconnect the graph, so we remove it.
      - (1, 2): Removing this edge does not disconnect the graph, so we remove it.
      - (2, 3): Removing this edge does not disconnect the graph, so we remove it.
      - (4, 5): Removing this edge does not disconnect the graph, so we remove it.
      - (4, 6): Removing this edge does not disconnect the graph, so we remove it.
      - (7, 8): Removing this edge does not disconnect the graph, so we remove it.
      - (0, 1): Removing this edge does not disconnect the graph, so we remove it.
      - (2, 7): Removing this edge does not disconnect the graph, so we remove it.
      - (2, 4): Removing this edge does not disconnect the graph, so we remove it.
      - (6, 7): Removing this edge does not disconnect the graph, so we remove it.
      - (5, 6): Removing this edge does not disconnect the graph, so we remove it.

    ]
  ]

  #programming-problem(number: 2.2)[
    Argue why the algorithm finds a MST of $G$.

    #solution()[
      Because this is Kruskal's algorithm in reverse.
    ]
  ]
]

#programming-problem(
  number: 3,
)[
  ==== Properties of MSTs
  Let $G$ be a weighted graph.

  #programming-problem(
    number: 3.1,
  )[
    Show that the lightest edge in a graph $G$ is in a MST for $G$. How about the heaviest?

    #solution(
      )[
      The lightest edge in a graph $G$ is in a MST for $G$ because of the cut property of MSTs.

      The cut property states that for any cut in the graph, the lightest edge crossing that cut must be included in the MST. Since the lightest edge is the lightest edge in the entire graph, it will also be the lightest edge crossing any cut that it crosses. Therefore, it must be included in the MST.

      The heaviest edge in a graph $G$ is not necessarily in a MST for $G$. In fact, it is often the case that the heaviest edge is not included in the MST because it may create a cycle or there may be a lighter edge that can be used instead. Therefore, we cannot conclude that the heaviest edge is always in the MST.
    ]
  ]

  #programming-problem(
    number: 3.2,
  )[
    Assume we scale all the edge weights in $G$ by multiplying them with some value $c > 0$. How will the MST look for the new graph?

    #solution(
      )[
      Scaling all the edge weights in $G$ by multiplying them with some value $c > 0$ will not change the structure of the MST. This is because both Prim's and Kruskal's algorithms rely on the relative order of the edge weights, and scaling by a positive constant does not change this order. Therefore, the MST for the new graph will be the same as the MST for the original graph, just with all edge weights multiplied by $c$.
    ]
  ]

  #programming-problem(
    number: 3.3,
  )[
    Show that if all edge weights in $G$ are distinct then there is a unique MST of $G$. _Hint:_ recall the properties of MSTs.

    #solution(
      )[
      If all edge weights in $G$ are distinct, then there is a unique MST of $G$ because of the cut and cycle properties of MSTs.

      The cut property states that for any cut in the graph, the lightest edge crossing that cut must be included in the MST. Since all edge weights are distinct, there will be a unique lightest edge crossing each cut, which means that there will be a unique set of edges that must be included in the MST.

      The cycle property states that for any cycle in the graph, the heaviest edge in that cycle cannot be included in the MST. Since all edge weights are distinct, there will be a unique heaviest edge in each cycle, which means that there will be a unique set of edges that cannot be included in the MST.

      Therefore, with distinct edge weights, both properties together ensure that there is only one possible combination of edges that can form the MST, leading to a unique MST.
    ]
  ]
]

#programming-problem(
  number: 4,
  difficulty: [\[†\]],
)[
  ==== Fiber Optic Cables
  The University of Algorithms has $N$ buildings (numbered $1, 2, dots, N$). Alice is responsible for ensuring they are all interconnected with the newest fiber optic cables. Two buildings $i$ and $j$ can be connected by a fiber optic cable for a certain price. Alice has been given a list of $M$ prices for pairwise connecting two buildings (buildings not in this list cannot be directly connected). The buildings are said to be all interconnected if and only if there is a path of fiber optic cables between any two buildings (not necessarily direct cables).

  Give an algorithm that, given the list of prices, determines the lowest total price, ensuring the buildings are interconnected. You can assume the buildings can always be interconnected. Implement the algorithm.

  *Input* Line 1 contains the integers $N$ and $M$. Lines $2 dots M+1$ contain three integers $i$, $j$, and $p$ indicating that building $i$ and $j$ can be connected for a price of $p$.

  *Output* A single integer containing the lowest total price for interconnecting all the buildings.

  #solution()[
    Here's the algorithm to solve the problem implemented in C:
    #raw(read("./Code/week9/fiberoptic.c"), block: true, lang: "c")
  ]
]

#programming-problem(
  number: 5,
)[
  ==== Maximal Spanning Tree
  Given a weighted graph $G$, give an algorithm to compute a _maximal spanning tree_ of $G$, i.e. a spanning tree with a maximum total weight. _Hint:_ transform the problem.

  #solution(
    )[
    We can simply reuse kruskals algorithm but sort the edges in non-increasing order of weight instead of non-decreasing order. This way, we will always add the heaviest edge that does not form a cycle, resulting in a maximal spanning tree.
  ]
]

#programming-problem(
  number: 6,
)[
  ==== MSTs on Graphs with Non-Distinct Weights

  #programming-problem(
    number: 6.1,
  )[
    Show that the cut and cycle properties are also true for graphs where the edge weights do not need to be distinct (the properties must be reformulated accordingly).

    #solution(
      )[
      The cut property can be reformulated as follows:
      #lemma(
        name: "Cut Property",
      )[
        For any cut in the graph, if there is a unique lightest edge crossing that cut, then that edge must be included in the MST. If there are multiple edges with the same lightest weight crossing the cut, then at least one of those edges must be included in the MST.
      ]
      The cycle property can be reformulated as follows:
      #lemma(
        name: "Cycle Property",
      )[
        For any cycle in the graph, if there is a unique heaviest edge in that cycle, then that edge cannot be included in the MST. If there are multiple edges with the same heaviest weight in the cycle, then at least one of those edges cannot be included in the MST.
      ]

      These reformulations ensure that even when edge weights are not distinct, we can still apply the cut and cycle properties to determine which edges must be included or excluded from the MST.
    ]
  ]

  #programming-problem(
    number: 6.2,
  )[
    Conclude that Prim's and Kruskal's algorithms also work in this case.

    #solution(
      )[
      Since the cut and cycle properties still hold for graphs with non-distinct edge weights (as shown in the previous problem), Prim's and Kruskal's algorithms will still correctly identify the edges to include in the MST based on these properties.

      Prim's algorithm will still add the lightest edge that connects a vertex in the MST to a vertex outside the MST, and Kruskal's algorithm will still add the lightest edge that does not form a cycle. The presence of non-distinct edge weights does not affect the logic of either algorithm, so they will both still produce a valid MST.
    ]
  ]

  #programming-problem(
    number: 6.3,
  )[
    Kruskal's algorithm can return different MSTs for a graph $G$ depending on how we break ties when sorting the edges. Show that for any minimum spanning tree $T$ in $G$, there is a way to sort the edges in $G$ such that Kruskal's algorithm returns $T$.

    #solution(
      )[
      Given a minimum spanning tree $T$ in $G$, we can sort the edges of $G$ in such a way that the edges in $T$ are sorted before any edge not in $T$. Among the edges in $T$, we can sort them in any order (since they all have the same weight or different weights, it does not matter). For the edges not in $T$, we can sort them in any order as well.

      By sorting the edges this way, when Kruskal's algorithm processes the edges, it will first consider all the edges in $T$ and add them to the MST since they do not form a cycle. Once all edges in $T$ are added, Kruskal's algorithm will then consider the remaining edges, but since all edges in $T$ are already included, it will not add any of the remaining edges (as they would form a cycle or are heavier).

      Therefore, by sorting the edges with those in $T$ first, we ensure that Kruskal's algorithm returns the specific minimum spanning tree $T$.
    ]
  ]
]

#programming-problem(
  number: 7,
  difficulty: [\[\*\]],
)[
  ==== MSTs with Small Edge Weights
  Let $G$ be a weighted graph with $n$ nodes and $m$ edges such that all edge weights are values from ${1, 2, dots, 10}$. Give an efficient algorithm to compute a MST.

  #solution(
    )[
    Since the edge weights are small integers, we can use a counting sort to sort the edges in $O(m + k)$ time, where $k$ is the range of the edge weights (in this case, $k = 10$). After sorting the edges, we can run Kruskal's algorithm in $O(m alpha(n))$ time, where $alpha(n)$ is the inverse Ackermann function.

    Therefore, the overall time complexity of the algorithm will be $O(m + k + m alpha(n))$, which simplifies to $O(m + n)$ since $k$ is a constant and $alpha(n)$ grows very slowly.
  ]
]

= Lecture Notes
== Shortest Paths
#definition(
  title: "Shortest path",
)[
  Given a directed, weighted graph $G$ and a source node $s$ find the shortest path from $s$ to all other nodes in $G$.
]

#definition(title: "Shortest path tree")[
  Shortest path tree represents shortest paths in a tree from s.
]

=== On unweighted graphs
using breadth-first search (BFS) to find the shortest path from a source node to all other nodes in an unweighted graph.

=== On weighted graphs

== Properties of shortest paths
Assume for simplicity;
- All vertices are reachable from the source $s$.
- No negative weight edges.

#definition(title: "Subpath Property")[
  any subpath of a shortest path is also a shortest path.

  #proof()[
    Consider the shortest path from $s$ to $t$ consisting of $p_1, p_2, p_3$

    // TODO: Cetz diagram showing the path from s to t with subpaths p1, p2, p3
    // u,v are the nodes between s and t.

  ]
]

== Dijkstra's algorithm
Goal: Given a directed weighted graph $G$ with non-negative edge weights and a source node $s$, find the shortest path from $s$ to all other nodes in $G$.

#definition(
  )[
  - Maintains *Distance estimate* $v.d$ for each vertex $v =$ shortest *known* path from $s$ to $v$.
  - Updates distance estimates by *relaxing* edges: for edge $(u, v)$ with weight $w(u, v)$, if $u.d + w(u, v) < v.d$ then update $v.d = u.d + w(u, v)$ and set $v$'s parent to $u$.
]

#pseudocode-list()[
  + #smallcaps(all: true)[RELAX(u,v)]
    + if u.d + w(u,v) < v.d:
      + v.d = u.d + w(u,v)
]

Dijkstra's algorithm:
- Initialise $s.d = 0$ and $v.d = infinity$ for all other vertices $v in V without {s}$.
- Maintain a priority queue of vertices based on their distance estimates.
- While the priority queue is not empty:
  - Extract the vertex $u$ with the smallest distance estimate.
  - For each neighbor $v$ of $u$, relax the edge $(u, v)$.

#pseudocode-list()[
  + #smallcaps(all: true)[DIJKSTRA(G, s)]
    + for each vertex v in G.V:
      + v.d = infinity
      + v.parent = null
    + s.d = 0
    + Q = G.V (priority queue based on v.d)
    + while Q is not empty:
      + u = EXTRACTMIN(Q)
      + for each neighbor v of u:
        + Relax(u, v)
]

// TODO: use cetz to draw a graph and below showing step by step execution of Dijkstra's algorithm.

#lemma(name: "Dijstras algorithm computes shortest paths")[
  #proof()[
    - Consider some step after growing tree $T$ and assume distances in $T$ are correct.
    - Consider the *closest* vertex $u$ of $s$ *not* in $T$
    - Shortest path from $s$ to $u$ ends with an edge $e = (v,u)$
    - $v$ is closer than $u$ to $s$ $=>$ $v$ is in $T$. ($u$ was closest not in T)
    - $=>$ shortest path to $u$ is in $T$ except $e$
    
  ]
]

== Shortest Paths on DAGs
