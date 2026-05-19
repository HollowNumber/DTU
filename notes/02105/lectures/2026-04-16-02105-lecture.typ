#import "@local/dtu-template:0.6.3":*

#show: dtu-note.with(
  course: "02105",
  course-name: "Algoritmer og datastrukturer 1",
  title: "Lecture - April 16, 2026",
  date: datetime(year: 2026, month: 4, day: 16),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)

= Shortest Paths

Given a directed, weighted graph $G$ and vertex $s$, find shortest path from $s$ to all vertices in $G$.

// Some graphs

/ SPT: Shortest path tree, which is like an MST in that it's the minimal weighted tree of a graph.

For simplicity we assume that all vertices are reachable from $s$. I.e. A shortest path always exists.


#definition(title: "Subpath")[
  Any subpath of a shortest path is a shortest path.
]

#proof[
  Assume we have a parth from $s$ to $t$ consisting of $p_1, p_2$ and $p_3$.

  Assuming that $q_2$ is shorter than $p_2$. Then it follows that $p_1, q_2, p_3$ is a shorter path.
]

== Dijkstras

Given a directed, weighted graph with non-negative weights and a vertex $s$, compute shortest path from $s$ to all vertices.

#definition[
  Maintains distance estimate `v.d` for each vertex $v =$ length of shortest known path from $s$ to $v$.

  Then it updates distance estimates by relaxing edges.
]

#algorithm-analysis[
  - Initialize `s.d=0` and `v.d =` $infinity$ for all vertices $v in bold(V) backslash {s}$
  - Grow tree $T$ from $s$.
  - In each step, add vertex $v$ with smallest distance estimate to $T$. 
  - Relax all outgoing edges of $v$.

]
