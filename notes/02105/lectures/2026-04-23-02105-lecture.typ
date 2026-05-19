#import "@local/dtu-template:0.6.3":*
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)
#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.5.0"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/fletcher:0.5.8"
#codly(fill: white, zebra-fill: black.lighten(95%), stroke: 1pt + black)

#show: dtu-note.with(
  course: "02105",
  course-name: "Algoritmer og datastrukturer 1",
  title: "Lecture - April 23, 2026",
  date: datetime(year: 2026, month: 4, day: 23),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)

#outline()

= Exercises

#figure(
  cetz.canvas({
    import cetz.draw: *

    let nodes = (
      "0":  (-6,  2),
      "1":  (-3.5, 0.5),
      "2":  ( 0,   2),
      "3":  ( 5,   2),
      "4":  (-6,  -1),
      "5":  (-1.5, -1),
      "6":  ( 2,  -1),
      "7":  ( 5,  -1),
      "8":  (-4,  -3.5),
      "9":  (0, -3.5),
      "10": ( 2,  -3.5),
      "11": ( 5,  -3.5),
    )

    // Helper: unit vector from a to b, scaled by r (to offset line endpoints to circle border)
    let r = 0.37

    let edges = (
      // (from, to, weight, label-anchor)
      ("0", "2",  "4",  "north"),
      ("0", "1",  "6",  "north"),
      ("0", "4",  "3",  "west"),
      ("1", "2",  "1",  "north"),
      ("1", "4",  "8",  "west"),
      ("1", "5",  "3",  "north"),
      ("2", "3",  "6",  "north"),
      ("2", "5",  "4",  "east"),
      ("2", "6",  "8",  "east"),
      ("2", "9",  "4",  "east"),
      ("3", "7",  "7",  "east"),
      ("4", "5",  "4",  "north"),
      ("4", "8",  "5",  "south"),
      ("9", "5",  "6",  "east"),
      ("6", "10", "1",  "east"),
      ("8", "9",  "1",  "north"),
      ("9", "10", "4",  "north"),
      ("10","7",  "7",  "north"),
      ("10","11", "2",  "north"),
      ("11","7",  "2",  "east"),
    )

    for (a, b, w, lbl-anchor) in edges {
      let pa = nodes.at(a)
      let pb = nodes.at(b)

      // Compute offset points at circle border
      let dx = pb.at(0) - pa.at(0)
      let dy = pb.at(1) - pa.at(1)
      let dist = calc.sqrt(dx * dx + dy * dy)
      let ux = dx / dist
      let uy = dy / dist

      let x0 = pa.at(0) + ux * r
      let y0 = pa.at(1) + uy * r
      let x1 = pb.at(0) - ux * r
      let y1 = pb.at(1) - uy * r

      line((x0, y0), (x1, y1),
        mark: (end: (symbol: ">", fill: black), scale: 0.5),
        stroke: black + 0.8pt)

      let mx = (pa.at(0) + pb.at(0)) / 2
      let my = (pa.at(1) + pb.at(1)) / 2
      content((mx, my), text(size: 8pt)[#w],
        anchor: lbl-anchor, padding: 0.08,
        frame: "rect", fill: white, stroke: none)
    }

    for (label, pos) in nodes {
      circle(pos, radius: r, fill: white, stroke: black + 1pt)
      content(pos, text(size: 9pt)[#label])
    }
  }),
  caption: [The directed weighted graph $G$.],
) <fig-graph>


#programming-problem(number: 1)[
==== Algorithms and Properties

#programming-problem(number: 1.1, difficulty: [\[w\]])[
  Consider the graph in @fig-graph. Show a shortest path tree for the graph starting at node 0. Write the length of the shortest path from 0 to each node.

#solution()[
    #table(
        columns: (auto, auto, auto),
        align: (center, left, center),
        table.header([*Node*], [*Shortest Path*], [*Distance*]),
        [1],  [0 → 1],             [6],
        [2],  [0 → 2],             [4],
        [3],  [0 → 2 → 3],         [10],
        [4],  [0 → 4],             [3],
        [5],  [0 → 4 → 5],         [7],
        [6],  [0 → 2 → 6],         [12],
        [7],  [0 → 2 → 3 → 7],     [17],
        [8],  [0 → 4 → 8],         [8],
        [9],  [0 → 2 → 9],         [8],
        [10], [0 → 2 → 9 → 10],    [12],
        [11], [0 → 2 → 9 → 10 → 11], [14],
      )
      
      #cetz.canvas({
          import cetz.draw: *
      
          let nodes = (
            "0":  (-6,  2),
            "1":  (-3.5, 0.5),
            "2":  ( 0,   2),
            "3":  ( 5,   2),
            "4":  (-6,  -1),
            "5":  (-1.5, -1),
            "6":  ( 2,  -1),
            "7":  ( 5,  -1),
            "8":  (-4,  -3.5),
            "9":  (-1.5, -3.5),
            "10": ( 2,  -3.5),
            "11": ( 4,  -3.5),
          )
      
          let r = 0.37
      
          // SPT edges only
          let spt-edges = (
            ("0", "1",  "6",  "north"),
            ("0", "2",  "4",  "north"),
            ("0", "4",  "3",  "west"),
            ("2", "3",  "6",  "north"),
            ("2", "6",  "8",  "east"),
            ("2", "9",  "4",  "east"),
            ("3", "7",  "7",  "east"),
            ("4", "5",  "4",  "north"),
            ("4", "8",  "5",  "south"),
            ("9", "10", "4",  "north"),
            ("10","11", "2",  "north"),
          )
      
          for (a, b, w, lbl-anchor) in spt-edges {
            let pa = nodes.at(a)
            let pb = nodes.at(b)
            let dx = pb.at(0) - pa.at(0)
            let dy = pb.at(1) - pa.at(1)
            let dist = calc.sqrt(dx * dx + dy * dy)
            let ux = dx / dist
            let uy = dy / dist
            line(
              (pa.at(0) + ux * r, pa.at(1) + uy * r),
              (pb.at(0) - ux * r, pb.at(1) - uy * r),
              mark: (end: (symbol: ">", fill: black), scale: 0.5),
              stroke: black + 0.8pt)
            let mx = (pa.at(0) + pb.at(0)) / 2
            let my = (pa.at(1) + pb.at(1)) / 2
            content((mx, my), text(size: 8pt)[#w],
              anchor: lbl-anchor, padding: 0.08,
              frame: "rect", fill: white, stroke: none)
          }
      
          for (label, pos) in nodes {
            circle(pos, radius: r, fill: white, stroke: black + 1pt)
            content(pos, text(size: 9pt)[#label])
          }
        })
      
  ]
]

#programming-problem(
    number: 1.2,
  )[
    Give an example graph with negative edges but no negative cycles, which results in an incorrect output from Dijkstra's algorithm.
    #solution()[
      Consider the following graph:
  
      
        #cetz.canvas({
          import cetz.draw: *
  
          let nodes = (
            "0": (0, 0),
            "1": (3, 0),
            "2": (1.5, -2),
          )
  
          let r = 0.37
  
          let edges = (
            ("0", "1", "2",  "north"),
            ("0", "2", "3",  "west"),
            ("1", "2", "-2", "east"),
          )
  
          for (a, b, w, lbl-anchor) in edges {
            let pa = nodes.at(a)
            let pb = nodes.at(b)
            let dx = pb.at(0) - pa.at(0)
            let dy = pb.at(1) - pa.at(1)
            let dist = calc.sqrt(dx * dx + dy * dy)
            let ux = dx / dist
            let uy = dy / dist
            line(
              (pa.at(0) + ux * r, pa.at(1) + uy * r),
              (pb.at(0) - ux * r, pb.at(1) - uy * r),
              mark: (end: (symbol: ">", fill: black), scale: 0.5),
              stroke: black + 0.8pt)
            let mx = (pa.at(0) + pb.at(0)) / 2
            let my = (pa.at(1) + pb.at(1)) / 2
            content((mx, my), text(size: 8pt)[#w],
              anchor: lbl-anchor, padding: 0.08,
              frame: "rect", fill: white, stroke: none)
          }
  
          for (label, pos) in nodes {
            circle(pos, radius: r, fill: white, stroke: black + 1pt)
            content(pos, text(size: 9pt)[#label])
          }
        })
  
      There are no negative cycles: the only cycle-free path structure has
      $0 arrow.r 1 arrow.r 2$ with total weight $2 + (-2) = 0 > -oo$.
  
      Dijkstra starting from node 0 proceeds as follows:
  
      #table(
          columns: (auto, auto, auto, auto),
          align: center,
          table.header([*Step*], [*Settled*], [*d(0)*], [*d(1)*], [*d(2)*]),
          [1], [0], [0], [2], [3],
          [2], [1], [0], [2], [min(3, 2+(−2)) = *0*... too late],
          [3], [2 already settled with 3], [0], [2], [*3* ✗],
        )
  
      Dijkstra greedily settles node 2 with $d(2) = 3$ (via $0 arrow.r 2$)
      before processing node 1. Once settled, $d(2)$ is never updated, so
      the true shortest path $0 arrow.r 1 arrow.r 2$ with cost
      $2 + (-2) = 0$ is missed. The invariant Dijkstra relies on,
      that the cheapest unvisited node cannot be improved later, breaks
      when negative edges exist.
    ]
  ]

#programming-problem(
    number: 1.3,
  )[
    Consider a graph $G$ and a tree $T$ in $G$ rooted at a vertex $s$. Give an algorithm that determines if $T$ is a shortest path tree from $s$ in $G$.

    #solution()[
      To determine if $T$ is a shortest path tree from $s$ in $G$, we can perform the following steps:

      1. For each vertex $v$ in $G$, compute the shortest path distance from $s$ to $v$ using Dijkstra's algorithm
      
      2. For each vertex $v$ in $T$, compute the distance from $s$ to $v$ along the path in $T$.
      
      3. Compare the distances computed in steps 1 and 2 for each vertex $v$ in $T$. If for any vertex $v$, the distance from $s$ to $v$ along the path in $T$ is greater than the shortest path distance computed in step 1, then $T$ is not a shortest path tree. If all distances match, then $T$ is a shortest path tree from $s$ in $G$.
    ]
  ]

  #programming-problem(
    number: 1.4,
  )[
    Let $T$ be a shortest path tree from a node $s$ in a graph $G$. Assume we add a constant $c$ to all edge weights in $G$. Is $T$ still a shortest path tree?

    #solution()[
      yes, $T$ is still a shortest path tree. Adding a constant $c$ to all edge weights in $G$ does not change the relative order of the path costs. For any two paths from $s$ to a vertex $v$, if one path was shorter than the other before adding $c$, it will still be shorter after adding $c$. Therefore, the structure of the shortest path tree remains unchanged, and $T$ continues to be a shortest path tree from $s$ in the modified graph.      
    ]
  ]
] // end problem 1


#programming-problem(
  number: 2,
)[
  ==== Cable Routing (Exam 2012)

  #programming-problem(
    number: 2.1,
  )[
    AlgoNet wants all customers to get the best signal possible. The signal quality decreases proportional to cable length. Give an algorithm to maximise signal quality.

    #solution()[
      To maximize signal quality, we can model the problem as finding the shortest path from the source (the central hub) to each customer in the graph. We can use Dijkstra's algorithm to find the shortest paths, which will minimize the total cable length and thus maximize signal quality for all customers. The algorithm can be implemented as follows:
    
      1. Represent the network as a graph where nodes represent junctions or customers and edges represent the cables between them, with weights corresponding to the length of the cables.
      
      2. Use Dijkstra's algorithm starting from the central hub to compute the shortest path to each customer node in the graph.
      
      3. The resulting paths from the central hub to each customer will be the optimal cable routes that maximize signal quality by minimizing the total cable length.    
    ]
  ]

  #programming-problem(number: 2.2)[
    Each intermediate box adds 5 m of equivalent cable loss. Give an algorithm for this scenario.

    #solution()[
      In this scenario, we need to account for the additional loss caused by each intermediate box. We can modify the graph representation to include the equivalent cable loss for each intermediate box. The algorithm can be implemented as follows:

      1. Represent the network as a graph where nodes represent junctions or customers and edges represent the cables between them, with weights corresponding to the length of the cables plus the equivalent loss from any intermediate boxes.

      2. For each edge that represents a connection through an intermediate box, add 5 meters to the weight of that edge to account for the additional loss.

      3. Use Dijkstra's algorithm starting from the central hub to compute the shortest path to each customer node in the graph, now considering the modified weights that include both cable length and box loss.

      4. The resulting paths from the central hub to each customer will be the optimal cable routes that maximize signal quality while accounting for the additional loss from intermediate boxes.
    ]
  ]

  #programming-problem(number: 2.3)[
    After cuts in government funding, AlgoNet is looking for ways to save money . Currently , they are spending $42000$ kr. to maintain one meter of cable every year. Give an algorithm that finds a cheapest way to get a TV signal to all the houses in AlgoCity.

    #solution()[
      To find the cheapest way to get a TV signal to all the houses in AlgoCity, we can model the problem as finding a minimum spanning tree (MST) of the graph representing the network. The MST will minimize the total cost of maintaining the cables while ensuring that all houses are connected to the central hub. The algorithm can be implemented as follows:

      1. Represent the network as a graph where nodes represent junctions or customers and edges represent the cables between them, with weights corresponding to the length of the cables multiplied by the maintenance cost per meter (42000 kr/m).

      2. Use Prim's or Kruskal's algorithm to compute the minimum spanning tree of the graph. This will give us a subset of edges that connects all nodes (houses) with the minimum total weight (cost).

      3. The resulting edges in the MST will represent the optimal cable routes that minimize maintenance costs while ensuring that all houses receive a TV signal.
    ]
  ]
]


#programming-problem(
  number: 3,
)[
  ==== Longest Paths in DAGs
  Give an algorithm to find the longest path in a DAG.

  #solution(
    )[
    We can do a topological sort of the DAG, and then relax the edges in the order of the topological sort. This is similar to the shortest path algorithm for DAGs, but instead of taking the minimum, we take the maximum.

    #pseudocode-list()[
      #smallcaps()[LongestPathDAG(G, s)]:
      + topological_order = TopologicalSort(G)
      + dist = array of size |V|, initialized to $-oo$
      + dist[s] = 0
      + for each vertex u in topological_order:
        + for each edge (u, v) in G:
          + if dist[u] + weight(u, v) > dist[v]:
            + dist[v] = dist[u] + weight(u, v)
      + return dist
    ]
  ]
]

#programming-problem(
  number: 4,
  difficulty: [\[\*\]],
)[
  ==== Zombie Travel
  In the post-apocalyptic zombie world, you need to know the safest way to travel between two
  cities so that you can hopefully avoid being eaten by the zombies. Y ou are given a graph G where each node represents a
  city and each edge a road between two cities. Each edge e has a probability $s(e), 0 ≤ s(e) ≤ 1$ for surviving traveling on
  that edge without being eaten. The probabilities on each edge are independent and the probability of surving the entire
  travel along a path P is the product of the probabilities of surviving on each edge of P.

  #figure(
    cetz.canvas(
      {
        import cetz.draw: *

        let nodes = ("1": (-3, 2), "2": (3, 0), "3": (0, 0), "4": (-3, -2))

        let r = 0.37

        let edges = (
          ("1", "4", "0,5", "west"),
          ("3", "1", "0,1", "north"),
          ("2", "1", "0,2", "north"),
          ("2", "3", "0,7", "north"),
          ("3", "4", "0,9", "west"),
          ("2", "4", "0,5", "south"),
        )

        for (a, b, w, lbl-anchor) in edges {
          let pa = nodes.at(a)
          let pb = nodes.at(b)
          let dx = pb.at(0) - pa.at(0)
          let dy = pb.at(1) - pa.at(1)
          let dist = calc.sqrt(dx * dx + dy * dy)
          let ux = dx / dist
          let uy = dy / dist
          let x0 = pa.at(0) + ux * r
          let y0 = pa.at(1) + uy * r
          let x1 = pb.at(0) - ux * r
          let y1 = pb.at(1) - uy * r

          line((x0, y0), (x1, y1), mark: (end: (symbol: ">", fill: black), scale: 0.5), stroke: black + 0.8pt)

          let mx = (pa.at(0) + pb.at(0)) / 2
          let my = (pa.at(1) + pb.at(1)) / 2
          content((mx, my), text(size: 8pt)[#w], anchor: lbl-anchor, padding: 0.08, frame: "rect", fill: white, stroke: none)
        }

        for (label, pos) in nodes {
          circle(pos, radius: r, fill: white, stroke: black + 1pt)
          content(pos, text(size: 9pt)[#label])
        }
      },
    ),
    caption: [A directed weighted graph.],
  )

  As an example, look at the graph above. If you travel directly from node 2 to 4, you have a $50%$ chance of surviving.
  If you travel via node 3 instead, you have a $0.7· 0.9= 63%$ chance of surviving. If you travel via $3$ and 1, you only have $0.7· 0.1· 0.5 = 3.5%$ chance of surviving. Give an algorithm that computes the safest way from a node s to another node
  t.

  #solution(
    )[
    We can use a modified version of Dijkstra's algorithm to find the path with the highest survival probability. Instead of summing edge weights, we will multiply the probabilities along the path. To avoid issues with multiplying small probabilities, we can take the logarithm of the probabilities and sum them instead, which turns the product into a sum.

    #pseudocode-list()[
      #smallcaps()[SafestPath(G, s, t)]:
      + log_prob = array of size $abs(V)$, initialized to $-oo$
      + log_prob[s] = 0
      + priority_queue = new max-heap
      + priority_queue.insert(s, log_prob[s])
      + while not priority_queue.is_empty():
        + u = priority_queue.extract_max()
        + if u == t:
          + return exp(log_prob[u]) // Return the actual probability
        + for each edge (u, v) in G:
          + new_log_prob = log_prob[u] + log(s(u, v))
          + if new_log_prob > log_prob[v]:
            + log_prob[v] = new_log_prob
            + priority_queue.insert(v, log_prob[v])
    ]
    
    mathematically this is:
    $
      product_(e in P) s(e) = exp(sum_(e in P) log(s(e)))
    $
    
  ]
]


#programming-problem(
  number: 5,
)[
  ==== Loopy Trees
  #figure(cetz.canvas({
    import cetz.draw: *

    let nodes = (
      "root": (0, 4),
      "L": (-2, 2),
      "R": (2, 2),
      "LL": (-2.5, 0),
      "LR": (-0.5, 0),
      "RL": (2, 0),
      "LLL": (-2.5, -2),
      "RLL": (1, -2),
      "RLR": (3, -2),
    )

    let r = 0.37

    let draw-edge(pa, pb, w, lbl-anchor) = {
      let dx = pb.at(0) - pa.at(0)
      let dy = pb.at(1) - pa.at(1)
      let dist = calc.sqrt(dx * dx + dy * dy)
      let ux = dx / dist
      let uy = dy / dist
      line(
        (pa.at(0) + ux * r, pa.at(1) + uy * r),
        (pb.at(0) - ux * r, pb.at(1) - uy * r),
        mark: (end: (symbol: ">", fill: black), scale: 0.5),
        stroke: black + 0.8pt,
      )
      content(
        ((pa.at(0) + pb.at(0)) / 2, (pa.at(1) + pb.at(1)) / 2),
        text(size: 9pt)[#w],
        anchor: lbl-anchor,
        padding: 0.08,
        frame: "rect",
        fill: white,
        stroke: none,
      )
    }

    // Tree edges
    draw-edge(nodes.at("root"), nodes.at("L"), "5", "west")
    draw-edge(nodes.at("root"), nodes.at("R"), "8", "east")
    draw-edge(nodes.at("L"), nodes.at("LL"), "17", "west")
    draw-edge(nodes.at("L"), nodes.at("LR"), "0", "east")
    draw-edge(nodes.at("R"), nodes.at("RL"), "1", "east")
    draw-edge(nodes.at("LL"), nodes.at("LLL"), "23", "east")
    draw-edge(nodes.at("RL"), nodes.at("RLL"), "9", "west")
    draw-edge(nodes.at("RL"), nodes.at("RLR"), "14", "east")

    // Back-edge: LL -> root, labeled "4" (inner left arc)
    // Loops left and up over root
    bezier(
      (nodes.at("LL").at(0) - r, nodes.at("LL").at(1)),
      (nodes.at("root").at(0) - r * 0.5, nodes.at("root").at(1) - r),
      (-5.5, 1.5),
      (-4, 5.5),
      mark: (end: (symbol: ">", fill: black), scale: 0.5),
      stroke: black + 0.8pt,
    )
    content((-3.8, 1.5), text(size: 9pt)[4])

    // Back-edge: LLL -> root, labeled "16" (outermost left arc)
    bezier(
      (nodes.at("LLL").at(0) - r, nodes.at("LLL").at(1)),
      (nodes.at("root").at(0) - r, nodes.at("root").at(1)),
      (-7.5, 0),
      (-6, 5.5),
      mark: (end: (symbol: ">", fill: black), scale: 0.5),
      stroke: black + 0.8pt,
    )
    content((-6.5, 1.0), text(size: 9pt)[16])

    // Back-edge: RL -> root, labeled "42" (inner right arc)
    bezier(
      (nodes.at("RL").at(0) + r, nodes.at("RL").at(1)),
      (nodes.at("root").at(0) + r * 0.5, nodes.at("root").at(1) - r),
      (5.5, 1.5),
      (4, 5.5),
      mark: (end: (symbol: ">", fill: black), scale: 0.5),
      stroke: black + 0.8pt,
    )
    content((4.2, 1.5), text(size: 9pt)[42])

    // Back-edge: RLR -> root, labeled "7" (outermost right arc)
    bezier(
      (nodes.at("RLR").at(0) + r, nodes.at("RLR").at(1)),
      (nodes.at("root").at(0) + r, nodes.at("root").at(1)),
      (7.5, 0),
      (6, 5.5),
      mark: (end: (symbol: ">", fill: black), scale: 0.5),
      stroke: black + 0.8pt,
    )
    content((6.5, 1.0), text(size: 9pt)[7])

    // Nodes drawn last (on top)
    for (label, pos) in nodes {
      circle(pos, radius: r, fill: white, stroke: black + 1pt)
    }
  }), caption: [A directed weighted tree with back-edges.]) <fig-tree>

  #programming-problem(
    number: 5.1,
  )[
    Suppose we use Dijkstra's algorithm on the loopy tree $T$ with $n$ nodes. What is the running time in terms of $n$?

    #solution()[
      Dijkstra's algorithm has a running time of $O((V + E) log V)$, where $V$ is the number of vertices and $E$ is the number of edges in the graph. In a tree with $n$ nodes, there are $n-1$ edges. However, in this loopy tree, we have additional back-edges that create cycles. 

      Let's denote the number of back-edges as $b$. The total number of edges in the graph would then be $E = (n - 1) + b$. Since $b$ can be at most $O(n)$ (in the worst case, each node could have a back-edge), we can say that $E = O(n)$.

      Therefore, the running time of Dijkstra's algorithm on this loopy tree would be:
      
      $O((V + E) log V) = O((n + O(n)) log n) = O(n log n)$
      
    ]
  ]

  #programming-problem(number: 5.2, difficulty: [\[\*\]])[
    Give a faster algorithm.

    #solution()[
      We can use a modified depth-first search (DFS) to find the shortest path from the root to each node in the loopy tree. Since the graph is a tree with back-edges, we can keep track of the shortest distance to each node as we traverse the tree. 

      The algorithm can be implemented as follows:

      1. Initialize a distance array `dist` of size `n` with all values set to infinity, except for the root node which is set to 0.

      2. Perform a DFS starting from the root node. For each node `u`, for each edge `(u, v)` with weight `w`, if `dist[u] + w < dist[v]`, update `dist[v]` to `dist[u] + w` and continue the DFS from node `v`.

      3. Since we are only visiting each node and edge once, the running time of this algorithm is O(n), which is faster than Dijkstra's algorithm for this specific case.
    ]
  ]
] 

= Lecture 

== Search Trees 


=== Dynamic Ordered Sets 

#definition(title: "Dynamic ordered sets")[
  Let $S$ be a dynamic ordered set. A dynamic ordered set has the following operations. Each element $x$ has key `x.key` and satellite data `x.data` 

  1. `SEARCH(k)`: return element $x$ such that `x.key = k` if it exists. Otherwise return null
  2. `INSERT(x)` add $x$ to $S$ (assume `x.key` is not already in $S$)
  3. `DELETE(x)`: remove $x$ from $S$.
  
  A dynamic ordered set has the property that it is always ordered, which allows efficient support for many other important operations and other features.
]

Dynamic ordered sets sees its use in dictionaries, indexes, filesystems and databases, and much more.  


=== Binary earch Tree 

=== Balanced Search Tree
