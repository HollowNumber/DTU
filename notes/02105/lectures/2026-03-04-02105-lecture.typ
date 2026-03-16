#import "@local/dtu-template:0.6.3":*

#show: dtu-note.with(
  course: "02105",
  course-name: "Algoritmer og datastrukturer 1",
  title: "Lecture - March 04, 2026",
  date: datetime(year: 2026, month: 3, day: 4),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)



= Graphs

== Undirected Graphs 

An undirected graph is a set of vertices (node) pairwise joined by edges. 

Graphs have an uncounted amount of applications, ranging from games, molecules, neural networks, transport, etc.

An undirected graph $G$ can be represented as: 

$
G = (V, E)
$

Where $V$ is the set of vertices, and $E$ is the set of edges. 

Further $n = abs(V), m =abs(E)$. Any vertex in a graph has a degree $deg(v)$ which is the number of neighbours, or edges _incident_ to $v$. With this there is terminology important to graph theory:

1. Path is a sequence of vertices connected by edges. 
2. Cycle is a path starting and ending at the same vertex 
3. Connectivity a pair of vertices are connected if there is a path between them.

#lemma[
  $
  sum_(v in V) deg(v) = 2 m 
  $
]

#proof[
Because every edge is counted exactly twice, the sum of all degrees is the same as twice the amount of edges. 
]




== Representation 

An adjacency matrix 




== DFS / BFS 


