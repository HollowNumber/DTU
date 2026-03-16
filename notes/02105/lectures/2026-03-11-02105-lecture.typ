#import "@local/dtu-template:0.6.3":*
#import "@preview/cetz:0.4.2": *

#show: dtu-note.with(
  course: "02105",
  course-name: "Algoritmer og datastrukturer 1",
  title: "Lecture - March 11, 2026",
  date: datetime(year: 2026, month: 3, day: 11),
  author: "Mikkel M.H.Pedersen (s255015)",
  semester: "2026 Spring"
)


#let outdeg(v) = $deg^+ (#v)$
#let indeg(v) = $deg^- (#v)$

= Directed Graphs

Directed graphs are graphs which paths can only go one direction (think trapdoor principle from cryptography).


#note-box[
  Directed graphs can still have vertices which cyclically path to each other, however the direction of the edges need to be respected. Logically, this would be the same as these two nodes being undirected. 
]

Garbage collectors, are typically represented as a graph, or tree. These are typically directed graphs to see if a element can be reached from the root, if not then it can be garbage collected. 

The world wide web is another example of a directed graph, each vertex would be a homepage, and each edge would be a hyperlink. More examples of directed graphs are regex and automata. 


#lemma[
  $
  sum_(v in V) outdeg(v) = sum_(v in V) indeg(v)
  $
]


== Searching 

Searching directed graphs is moslty the same as searching undirected graphs. The key difference being that you only search the neighbour $u$ that $v$ points to. Rather than every neighbour of $v$.


#definition(title: "Topological Sorting")[
  Topological sorting is the ordering of vertices $v_0, v_1, dots, v_(n-1)$ from left to right such that all edges are directed to the right. 
]


#algorithm-analysis[
  Find $v$ with $indeg(v) = 0$. We then output v and recurse on $G - {v}$.

  If we can continually recurse on it, then we can say that the directed graph can be topologically sorted. 
]

#lemma[
  $G$ has topological sorting implies $G$ has vertex with $v$ with $indeg(v) = 0$ and $G - {v}$ has topological sorting.
]


== Directed Acyclic Graph 

#definition[
  $G$ is a DAG if it contains no (directed) cycles. 
]

#corollary[
  $G$ is a DAG implies $G$ has topological sorting. 
]

Another definition part of directed graphs is strong connections, given vertex $v,u$ if there is a path from $v -> u$ and $u-> v$ they are strongly connected. 


== Implicit graphs

Implicit graphs can be either directed and or undirected with implicit representation. Given a game board, each state can be implicitly graphed.
