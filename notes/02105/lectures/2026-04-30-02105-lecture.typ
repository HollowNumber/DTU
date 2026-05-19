#import "@local/dtu-template:0.6.3": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)
#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.5.0"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/fletcher:0.5.8"
#codly(fill: white, zebra-fill: black.lighten(95%), stroke: 1pt + black)
#show smallcaps: set text(font: "Liga SFMono Nerd Font")
#show raw: set text(font: "Liga SFMono Nerd Font")
#set text(font: "Helvetica")

#show: dtu-note.with(
  course: "02105",
  course-name: "Algorithms and Data Structures 1",
  title: "Exercises - April 23, 2026",
  date: datetime(year: 2026, month: 4, day: 30),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

#outline()

= Exercises

// Helper function for drawing a BST node
#let bst-node(pos, label, r: 0.35) = {
  import cetz.draw: *
  circle(pos, radius: r, fill: white, stroke: black + 1pt)
  content(pos, text(size: 9pt)[#label])
}

// Helper function for drawing a BST edge
#let bst-edge(from, to, r: 0.35) = {
  import cetz.draw: *
  let dx = to.at(0) - from.at(0)
  let dy = to.at(1) - from.at(1)
  let dist = calc.sqrt(dx * dx + dy * dy)
  let ux = dx / dist
  let uy = dy / dist
  line((from.at(0) + ux * r, from.at(1) + uy * r), (to.at(0) - ux * r, to.at(1) - uy * r), stroke: black + 0.8pt)
}

== 1 Basics of Binary Search Trees

#programming-problem(
  number: 1.1,
  difficulty: [\[w\]],
)[
  Which of the following trees are binary search trees?

  #figure(
    cetz.canvas({
      import cetz.draw: *
      let r = 0.35

      // --- Tree (a) ---
      let a = (
        "16": (0, 0),
        "13": (-1.5, -1.2),
        "20": (1.5, -1.2),
        "2": (-2.5, -2.4),
        "11": (-0.5, -2.4),
        "18": (0.8, -2.4),
        "21": (2.2, -2.4),
        "8": (-2, -3.6),
      )
      let a-edges = (("16", "13"), ("16", "20"), ("13", "2"), ("13", "11"), ("20", "18"), ("20", "21"), ("2", "8"))
      for (u, v) in a-edges {
        bst-edge(a.at(u), a.at(v), r: r)
      }
      for (lbl, pos) in a {
        bst-node(pos, lbl, r: r)
      }
      content((0.0, -4.4), text(size: 8pt)[(a)])

      // --- Tree (b) --- (offset +7.0)
      let b = (
        "9": (7.0, 0),
        "7": (5.0, -1.2),
        "17": (9.0, -1.2),
        "2": (4.0, -2.4),
        "8": (6.0, -2.4),
        "13": (8.0, -2.4),
        "18": (10.0, -2.4),
        "1": (3.5, -3.6),
        "10": (7.5, -3.6),
      )
      let b-edges = (
        ("9", "7"),
        ("9", "17"),
        ("7", "2"),
        ("7", "8"),
        ("17", "13"),
        ("17", "18"),
        ("2", "1"),
        ("13", "10"),
      )
      for (u, v) in b-edges {
        bst-edge(b.at(u), b.at(v), r: r)
      }
      for (lbl, pos) in b {
        bst-node(pos, lbl, r: r)
      }
      content((7.0, -4.4), text(size: 8pt)[(b)])

      // --- Tree (c) --- (offset +14.5)
      let c = (
        "16": (14.5, 0),
        "13": (12.7, -1.2),
        "14": (16.3, -1.2),
        "2": (11.7, -2.4),
        "15": (13.7, -2.4),
        "11": (15.5, -2.4),
        "3": (12.3, -3.6),
        "7": (13.3, -3.6),
        "10": (15.1, -3.6),
      )
      let c-edges = (
        ("16", "13"),
        ("16", "14"),
        ("13", "2"),
        ("13", "15"),
        ("14", "11"),
        ("2", "3"),
        ("15", "7"),
        ("11", "10"),
      )
      for (u, v) in c-edges {
        bst-edge(c.at(u), c.at(v), r: r)
      }
      for (lbl, pos) in c {
        bst-node(pos, lbl, r: r)
      }
      content((14.5, -4.4), text(size: 8pt)[(c)])
    }),
    caption: [Trees (a), (b), and (c).],
  ) <fig-trees-1-1>

  #solution[
    Only tree (b) is a binary search tree. In (a), the node with key 13, has 11 as a right child, which violates the BST property. In (c), the node with key 14 is a right child of 16 which violates the BST property.
  ]
]

#programming-problem(
  number: 1.2,
  difficulty: [\[w\]],
)[
  Where are the elements with the smallest and largest key located in a binary search tree?

  #solution[
    The element with the smallest key is located at the leftmost node in the tree, while the element with the largest key is located at the rightmost node in the tree.
  ]
]

#programming-problem(
  number: 1.3,
  difficulty: [\[w\]],
)[
  Consider the set of keys ${1, 4, 5, 10, 16, 17, 21}$. Draw binary search trees of height 2, 3, 4, 5, and 6 containing these keys.

  #solution[
    #figure(
      cetz.canvas({
        import cetz.draw: *
        let r = 0.35

        // ---- Height 2: root=10, fully balanced ----
        let h2 = (
          "10": (0.0, 0.0),
          "4": (-2.0, -1.4),
          "17": (2.0, -1.4),
          "1": (-3.0, -2.8),
          "5": (-1.0, -2.8),
          "16": (1.0, -2.8),
          "21": (3.0, -2.8),
        )
        let h2-edges = (("10", "4"), ("10", "17"), ("4", "1"), ("4", "5"), ("17", "16"), ("17", "21"))
        for (u, v) in h2-edges {
          bst-edge(h2.at(u), h2.at(v), r: r)
        }
        for (lbl, pos) in h2 {
          bst-node(pos, lbl, r: r)
        }
        content((0.0, -3.8), text(size: 8pt)[height 2])

        // ---- Height 3: root=10, right side chains one deeper ----
        let h3 = (
          "10": (8.0, 0.0),
          "4": (6.0, -1.4),
          "21": (10.0, -1.4),
          "1": (5.0, -2.8),
          "5": (7.0, -2.8),
          "17": (9.0, -2.8),
          "16": (9.0, -4.2),
        )
        let h3-edges = (("10", "4"), ("10", "21"), ("4", "1"), ("4", "5"), ("21", "17"), ("17", "16"))
        for (u, v) in h3-edges {
          bst-edge(h3.at(u), h3.at(v), r: r)
        }
        for (lbl, pos) in h3 {
          bst-node(pos, lbl, r: r)
        }
        content((8.0, -5.2), text(size: 8pt)[height 3])

        // ---- Height 4: root=17, left spine goes 4 deep ----
        let h4 = (
          "17": (16.0, 0.0),
          "10": (14.2, -1.4),
          "21": (17.8, -1.4),
          "5": (13.2, -2.8),
          "16": (15.2, -2.8),
          "4": (12.6, -4.2),
          "1": (12.0, -5.6),
        )
        let h4-edges = (("17", "10"), ("17", "21"), ("10", "5"), ("10", "16"), ("5", "4"), ("4", "1"))
        for (u, v) in h4-edges {
          bst-edge(h4.at(u), h4.at(v), r: r)
        }
        for (lbl, pos) in h4 {
          bst-node(pos, lbl, r: r)
        }
        content((16.0, -6.6), text(size: 8pt)[height 4])
      }),
      caption: [BSTs of height 2, 3, and 4.],
    )

    #figure(
      cetz.canvas({
        import cetz.draw: *
        let r = 0.35

        // ---- Height 5: right spine, split at bottom ----
        let h5 = (
          "1": (0.0, 0.0),
          "4": (1.6, -1.4),
          "5": (3.0, -2.8),
          "10": (4.2, -4.2),
          "17": (5.2, -5.6),
          "16": (4.4, -7.0),
          "21": (6.0, -7.0),
        )
        let h5-edges = (("1", "4"), ("4", "5"), ("5", "10"), ("10", "17"), ("17", "16"), ("17", "21"))
        for (u, v) in h5-edges {
          bst-edge(h5.at(u), h5.at(v), r: r)
        }
        for (lbl, pos) in h5 {
          bst-node(pos, lbl, r: r)
        }
        content((3.0, -8.0), text(size: 8pt)[height 5])

        // ---- Height 6: pure right chain ----
        let h6 = (
          "1": (10.0, 0.0),
          "4": (11.4, -1.4),
          "5": (12.6, -2.8),
          "10": (13.6, -4.2),
          "16": (14.4, -5.6),
          "17": (15.0, -7.0),
          "21": (15.4, -8.4),
        )
        let h6-edges = (("1", "4"), ("4", "5"), ("5", "10"), ("10", "16"), ("16", "17"), ("17", "21"))
        for (u, v) in h6-edges {
          bst-edge(h6.at(u), h6.at(v), r: r)
        }
        for (lbl, pos) in h6 {
          bst-node(pos, lbl, r: r)
        }
        content((12.7, -9.4), text(size: 8pt)[height 6])
      }),
      caption: [BSTs of height 5 and 6.],
    )
  ]
]

#programming-problem(number: 1.4, difficulty: [\[w\]])[
  Specify the preorder, inorder, or postorder sequence of keys for the tree in (b) of @fig-trees-1-1.

  #solution[
    Preorder: 9, 7, 2, 1, 8, 17, 13, 10, 18

    Inorder: 1, 2, 7, 8, 9, 10, 13, 17, 18

    Postorder: 1, 2, 8, 7, 10, 13, 18, 17, 9
  ]
]

#programming-problem(
  number: 1.5,
)[
  Compare the heap property and the search tree properties.

  #solution[
    The heap property states that for every node $v$ in a heap, the key of $v$ is greater than or equal to the keys of its children (for a max-heap) or less than or equal to the keys of its children (for a min-heap). This property ensures that the maximum (or minimum) element is always at the root of the heap.

    The search tree properties for a binary search tree (BST) state that for every node $v$ in a BST, all keys in the left subtree of $v$ are less than $v."key"$, and all keys in the right subtree of $v$ are greater than $v."key"$. This property allows for efficient searching, insertion, and deletion operations in logarithmic time on average.

    The main difference between the two properties is that the heap property focuses on maintaining a specific order between parent and child nodes to facilitate efficient access to the maximum or minimum element, while the search tree properties focus on maintaining an ordered structure that allows for efficient searching and manipulation of elements based on their keys.
  ]
]

#programming-problem(number: 1.6, difficulty: [\[w\]])[
  Write pseudo-code for computing the inorder traversal of a binary search tree.

  #solution[
    #pseudocode-list()[
      #smallcaps()[inorder-traversal(node)]
      + if node is not null then
        + inorder-traversal(node.left)
        + visit(node)
        + inorder-traversal(node.right)
      + else
        + return
    ]
  ]
]

#programming-problem(
  number: 1.7,
)[
  Show that if a node $v$ in a binary search tree has 2 children, then the node with the smallest key $>$ than $v."key"$ has no left child and the node with the largest key $<$ than $v."key"$ has no right child. Assume that all keys are distinct. _Hint: prove by contradiction._

  #solution[
    Assume for the sake of contradiction that there exists a node $u$ with key $k_u$ such that $k_u$ is the smallest key greater than $v."key"$ and $u$ has a left child. Let $w$ be the left child of $u$ with key $k_w$. Since $w$ is a left child of $u$, we have $k_w < k_u$. However, since $k_u$ is the smallest key greater than $v."key"$, we must have $k_w \leq v."key"$. This contradicts the binary search tree property, which states that all keys in the right subtree of a node must be greater than the node's key. Therefore, our assumption is false, and the node with the smallest key greater than $v."key"$ must have no left child.

    Similarly, assume for the sake of contradiction that there exists a node $x$ with key $k_x$ such that $k_x$ is the largest key less than $v."key"$ and $x$ has a right child. Let $y$ be the right child of $x$ with key $k_y$. Since $y$ is a right child of $x$, we have $k_y > k_x$. However, since $k_x$ is the largest key less than $v."key"$, we must have $k_y \geq v."key"$. This contradicts the binary search tree property, which states that all keys in the left subtree of a node must be less than the node's key. Therefore, our assumption is false, and the node with the largest key less than $v."key"$ must have no right child.
  ]
]

== 2 Basics of 2-3 Trees

#programming-problem(
  number: 2.1,
  difficulty: [\[w\]],
)[
  Consider the following 2-3 tree. Insert the sequence of keys 4, 10, 1. Show the resulting tree after each step.

  #figure(
    cetz.canvas({
      import cetz.draw: *
      let r = 0.35

      // Root is a 2-node with key 5
      // Left child is leaf with key 2
      // Right child is leaf with keys 6,9
      let root = (0, 0)
      let left = (-1.5, -1.5)
      let right = (1.5, -1.5)

      // Draw edges
      line(root, left, stroke: black + 0.8pt)
      line(root, right, stroke: black + 0.8pt)

      // Root: single key node
      rect((-0.4, -0.3), (0.4, 0.3), fill: white, stroke: black + 1pt)
      content(root, text(size: 9pt)[5])

      // Left leaf: key 2
      rect((-1.9, -1.8), (-1.1, -1.2), fill: white, stroke: black + 1pt)
      content(left, text(size: 9pt)[2])

      // Right leaf: keys 6, 9
      rect((0.9, -1.8), (2.1, -1.2), fill: white, stroke: black + 1pt)
      content((1.35, -1.5), text(size: 9pt)[6])
      line((1.5, -1.8), (1.5, -1.2), stroke: black + 0.6pt)
      content((1.8, -1.5), text(size: 9pt)[9])
    }),
    caption: [Initial 2-3 tree.],
  )

  #solution[
    #grid(
      columns: (1fr, 1fr),
      rows: (auto, auto),
      gutter: 1em,
      // === Cell 1: Initial tree ===
      figure(
        cetz.canvas({
          import cetz.draw: *
          let cx = 0.0
          let cy = 0.0
          rect((cx - 0.45, cy - 0.3), (cx + 0.45, cy + 0.3), fill: white, stroke: black + 1pt)
          content((cx, cy), text(size: 9pt)[5])
          line((cx, cy - 0.3), (cx - 1.5, cy - 1.5), stroke: black + 0.8pt)
          line((cx, cy - 0.3), (cx + 1.5, cy - 1.5), stroke: black + 0.8pt)
          rect((-1.95, -1.8), (-1.05, -1.2), fill: white, stroke: black + 1pt)
          content((-1.5, -1.5), text(size: 9pt)[2])
          rect((0.9, -1.8), (2.1, -1.2), fill: white, stroke: black + 1pt)
          content((1.2, -1.5), text(size: 9pt)[6])
          line((1.5, -1.8), (1.5, -1.2), stroke: black + 0.6pt)
          content((1.8, -1.5), text(size: 9pt)[9])
        }),
        caption: [Initial tree],
      ),
      // === Cell 2: After inserting 4 ===
      figure(
        cetz.canvas({
          import cetz.draw: *
          rect((-0.45, -0.3), (0.45, 0.3), fill: white, stroke: black + 1pt)
          content((0.0, 0.0), text(size: 9pt)[5])
          line((0.0, -0.3), (-1.5, -1.5), stroke: black + 0.8pt)
          line((0.0, -0.3), (1.5, -1.5), stroke: black + 0.8pt)
          // left leaf [2,4]
          rect((-2.1, -1.8), (-0.9, -1.2), fill: white, stroke: black + 1pt)
          content((-1.8, -1.5), text(size: 9pt)[2])
          line((-1.5, -1.8), (-1.5, -1.2), stroke: black + 0.6pt)
          content((-1.2, -1.5), text(size: 9pt)[4])
          // right leaf [6,9]
          rect((0.9, -1.8), (2.1, -1.2), fill: white, stroke: black + 1pt)
          content((1.2, -1.5), text(size: 9pt)[6])
          line((1.5, -1.8), (1.5, -1.2), stroke: black + 0.6pt)
          content((1.8, -1.5), text(size: 9pt)[9])
        }),
        caption: [After inserting 4],
      ),
      // === Cell 3: After inserting 10 ===
      figure(
        cetz.canvas({
          import cetz.draw: *
          // root [5,9]
          rect((-0.9, -0.3), (0.9, 0.3), fill: white, stroke: black + 1pt)
          content((-0.45, 0.0), text(size: 9pt)[5])
          line((0.0, -0.3), (0.0, 0.3), stroke: black + 0.6pt)
          content((0.45, 0.0), text(size: 9pt)[9])
          line((-0.9, -0.3), (-2.0, -1.5), stroke: black + 0.8pt)
          line((0.0, -0.3), (0.0, -1.5), stroke: black + 0.8pt)
          line((0.9, -0.3), (2.0, -1.5), stroke: black + 0.8pt)
          // leaf [2,4]
          rect((-2.6, -1.8), (-1.4, -1.2), fill: white, stroke: black + 1pt)
          content((-2.3, -1.5), text(size: 9pt)[2])
          line((-2.0, -1.8), (-2.0, -1.2), stroke: black + 0.6pt)
          content((-1.7, -1.5), text(size: 9pt)[4])
          // leaf [6]
          rect((-0.45, -1.8), (0.45, -1.2), fill: white, stroke: black + 1pt)
          content((0.0, -1.5), text(size: 9pt)[6])
          // leaf [10]
          rect((1.55, -1.8), (2.45, -1.2), fill: white, stroke: black + 1pt)
          content((2.0, -1.5), text(size: 9pt)[10])
        }),
        caption: [After inserting 10],
      ),
      // === Cell 4: After inserting 1 ===
      figure(
        cetz.canvas({
          import cetz.draw: *
          // root [5]
          rect((-0.45, 0.0), (0.45, 0.6), fill: white, stroke: black + 1pt)
          content((0.0, 0.3), text(size: 9pt)[5])
          line((0.0, 0.0), (-2.5, -1.2), stroke: black + 0.8pt)
          line((0.0, 0.0), (2.5, -1.2), stroke: black + 0.8pt)
          // internal [2]
          rect((-2.95, -1.5), (-2.05, -0.9), fill: white, stroke: black + 1pt)
          content((-2.5, -1.2), text(size: 9pt)[2])
          // internal [9]
          rect((2.05, -1.5), (2.95, -0.9), fill: white, stroke: black + 1pt)
          content((2.5, -1.2), text(size: 9pt)[9])
          // leaves under [2]
          line((-2.5, -1.5), (-3.5, -2.7), stroke: black + 0.8pt)
          line((-2.5, -1.5), (-1.5, -2.7), stroke: black + 0.8pt)
          rect((-3.95, -3.0), (-3.05, -2.4), fill: white, stroke: black + 1pt)
          content((-3.5, -2.7), text(size: 9pt)[1])
          rect((-1.95, -3.0), (-1.05, -2.4), fill: white, stroke: black + 1pt)
          content((-1.5, -2.7), text(size: 9pt)[4])
          // leaves under [9]
          line((2.5, -1.5), (1.5, -2.7), stroke: black + 0.8pt)
          line((2.5, -1.5), (3.5, -2.7), stroke: black + 0.8pt)
          rect((1.05, -3.0), (1.95, -2.4), fill: white, stroke: black + 1pt)
          content((1.5, -2.7), text(size: 9pt)[6])
          rect((3.05, -3.0), (3.95, -2.4), fill: white, stroke: black + 1pt)
          content((3.5, -2.7), text(size: 9pt)[10])
        }),
        caption: [After inserting 1],
      ),
    )

    Inserting 4: The key 4 is less than 5, so we go to the left child [2]. Since 4 is greater than 2, we insert it into the left child, resulting in the leaf [2,4].

    Inserting 10: The key 10 is greater than 5, so we go to the right child [6,9]. Since 10 is greater than 9, we insert it into the right child, resulting in the leaf [6,9,10]. This leaf now has 3 keys, so we split it into two leaves [6] and [10], and promote the middle key 9 to the root. The resulting tree has root [5,9], with left child [2,4] and right children [6] and [10].

    Inserting 1: The key 1 is less than 5, so we go to the left child [2,4]. Since 1 is less than 2, we insert it into the left child, resulting in the leaf [1,2,4]. This leaf now has 3 keys, so we split it into two leaves [1] and [4], and promote the middle key 2 to the root. The resulting tree has root [5], with left child [2] and right child [9]. The left child [2] has children [1] and [4], while the right child [9] has children [6] and [10].

  ]
]

#programming-problem(
  number: 2.2,
)[
  Consider a 2-3 tree $T$ with $n$ items. What is the maximum height and the minimum height of $T$? Conclude that the height of $T$ is always $Theta(log n)$.

  #solution[
    The minimum height of a 2-3 tree with $n$ items occurs when the tree is perfectly balanced, meaning that every internal node has 3 children. In this case, the number of items at height $h$ is given by the formula $n = 3^h$. Solving for $h$, we get $h = log_3(n)$.

    The maximum height of a 2-3 tree with $n$ items occurs when the tree is as unbalanced as possible, meaning that every internal node has only 2 children. In this case, the number of items at height $h$ is given by the formula $n = 2^h$. Solving for $h$, we get $h = log_2(n)$.

    Since the height of a 2-3 tree is bounded between $log_3(n)$ and $log_2(n)$, we can conclude that the height of a 2-3 tree is always $Theta(log n)$.
  ]
]

== 3 Queries on Balanced Search Trees

Consider the following queries on 2-3 trees $T$:

/ #smallcaps[Predecessor]$(k)$: Return the element with the largest key in $T$ that is $<= k$.
/ #smallcaps[RangeReport]$(k_1, k_2)$: Return the set of elements with keys in the range $[k_1, k_2]$.
/ #smallcaps[RangeCount]$(k_1, k_2)$: Return the _number_ of elements with keys in the range $[k_1, k_2]$.

#programming-problem(
  number: 3.1,
)[
  Give an algorithm that supports #smallcaps[Predecessor] in $O(log n)$ time.

  #solution[
    To find the predecessor of a key $k$ in a 2-3 tree, we can perform a modified search for $k$ in the tree. We start at the root and compare $k$ with the keys in the current node. If $k$ is less than the smallest key in the node, we move to the left child. If $k$ is greater than the largest key in the node, we move to the right child. If $k$ is between two keys in the node, we move to the middle child.

    During this search, we keep track of the last key that is less than or equal to $k$. If we reach a leaf node and have found a key that is less than or equal to $k$, that key is our predecessor. If we reach a leaf node without finding such a key, then there is no predecessor for $k$ in the tree.

    Since each step of the search takes constant time and we traverse at most one path from the root to a leaf, the overall time complexity of this algorithm is $O(log n)$.
  ]
]

#programming-problem(
  number: 3.2,
)[
  Give an algorithm that supports #smallcaps[RangeReport] in $O(log n + "occ")$ time, where $"occ"$ is the number of elements in the output.

  #solution[
    To support the #smallcaps[RangeReport] query in $O(log n + "occ")$ time, we can perform a modified search for the keys $k_1$ and $k_2$ in the 2-3 tree. We start at the root and traverse down the tree to find the node that contains $k_1$. During this traversal, we keep track of the path taken.

    Once we find the node containing $k_1$, we can perform an inorder traversal of the subtree rooted at that node to collect all keys that are greater than or equal to $k_1$ and less than or equal to $k_2$. We can stop the traversal once we encounter a key that is greater than $k_2$.

    Since the initial search for $k_1$ takes $O(log n)$ time and the inorder traversal takes $O("occ")$ time, where $"occ"$ is the number of elements in the output, the overall time complexity of this algorithm is $O(log n + "occ")$.
  ]
]

#programming-problem(
  number: 3.3,
)[
  Give an algorithm that supports #smallcaps[RangeCount] in $O(log n)$ time. Here you will need to store and maintain some additional information in the data structure.

  #solution[
    To support the #smallcaps[RangeCount] query in $O(log n)$ time, we can augment the 2-3 tree by storing an additional field in each node that keeps track of the number of elements in the subtree rooted at that node. Let's call this field "subtree_size".

    When we perform insertions and deletions in the tree, we need to update the "subtree_size" field for all affected nodes. This can be done in $O(log n)$ time during the standard insertion and deletion operations.

    To answer a #smallcaps[RangeCount] query for keys $k_1$ and $k_2$, we can perform two separate searches: one for $k_1$ to find the rank of $k_1$ (the number of elements less than or equal to $k_1$), and one for $k_2$ to find the rank of $k_2$. The number of elements in the range $[k_1, k_2]$ can then be calculated as "rank($k_2$) - rank($k_1$) + 1".

    Since each search takes $O(log n)$ time, the overall time complexity of this algorithm is $O(log n)$.
  ]
]

== 4 Inventory Management

Suppose you are running a business that sells recycled single socks. Each sock is identified by a size $s$ and a color $c$ (both integers). You want to maintain a database $D$ supporting:

/ #smallcaps[New]$(s, c)$: Add a new sock to $D$ of size $s$ and color $c$.
/ #smallcaps[Sell]$(s, c)$: Remove a sock of size $s$ and color $c$. Return "unavailable" if no such sock exists in $D$.
/ #smallcaps[Unique]: Return the total number of distinct socks in $D$, i.e., the number of different pairs $(s, c)$ that appear in $D$.
/ #smallcaps[MaxFrequent]: Return the most frequent pair $(s, c)$ in $D$. If there is more than one, return any.

#programming-problem(
  number: 4.1,
)[
  Give an efficient data structure that supports #smallcaps[New], #smallcaps[Sell], and #smallcaps[Unique].
  #solution[
    We can use a hash map (dictionary) to store the count of each distinct sock (size, color) pair. The keys of the hash map will be the pairs $(s, c)$, and the values will be the counts of how many socks of that type are currently in the database $D$.

    For the #smallcaps[New]$(s, c)$ operation, we can simply increment the count for the pair $(s, c)$ in the hash map. If the pair does not exist in the hash map, we can initialize its count to 1.

    For the #smallcaps[Sell]$(s, c)$ operation, we can check if the pair $(s, c)$ exists in the hash map and if its count is greater than 0. If it does, we can decrement the count. If after decrementing, the count becomes 0, we can remove the pair from the hash map. If the pair does not exist or its count is already 0, we return "unavailable".

    For the #smallcaps[Unique] operation, we can simply return the number of keys in the hash map, which represents the number of distinct socks in $D$.

    This data structure allows us to perform all three operations efficiently in average-case constant time $O(1)$.
  ]
]

#programming-problem(
  number: 4.2,
  difficulty: [\[\*\]],
)[
  Give an efficient data structure that supports all operations.

  #solution[
    To support all operations efficiently, including #smallcaps[MaxFrequent], we can use a combination of a hash map and a max-heap (priority queue).

    We can maintain a hash map where the keys are the pairs $(s, c)$ and the values are the counts of how many socks of that type are currently in the database $D$. This will allow us to efficiently perform #smallcaps[New], #smallcaps[Sell], and #smallcaps[Unique] as described in the previous solution.

    In addition to the hash map, we can maintain a max-heap that stores the pairs $(s, c)$ based on their counts. The max-heap will allow us to efficiently retrieve the most frequent pair for the #smallcaps[MaxFrequent] operation.

    When we perform #smallcaps[New]$(s, c)$, we increment the count in the hash map and then update the corresponding entry in the max-heap. If the pair $(s, c)$ is not already in the max-heap, we add it with its count. If it is already in the max-heap, we update its count and adjust its position in the heap accordingly.

    When we perform #smallcaps[Sell]$(s, c)$, we decrement the count in the hash map and then update or remove the corresponding entry in the max-heap. If after decrementing, the count becomes 0, we remove the pair from both the hash map and the max-heap.

    For #smallcaps[Unique], we can return the number of keys in the hash map.

    For #smallcaps[MaxFrequent], we can simply return the top element of the max-heap, which will be the pair with the highest count.

    This data structure allows us to perform all operations efficiently: #smallcaps[New] and #smallcaps[Sell] in $O(log n)$ time due to heap updates, #smallcaps[Unique] in $O(1)$ time, and #smallcaps[MaxFrequent] in $O(1)$ time.
  ]
]

= Lecture notes:
= Lecture Notes
== Dynamic Range Minimum Queries

#definition(title: "RMQ Problem")[
  Preprocess array `A[1..n]` of integers to support `RMQ(i,j)`: return the (entry of) minimum element in `A[i..j]`.
]

#solution[
  We could store the array. Given a query, run through the array.

  This gives a space complexity of $O(n)$ and a query time complexity of $O(n)$.
]

#solution[
  Store a matrix with answers to all possible queries. Each entry `M[i,j]` is the value of `RMQ(i,j)`. This gives $O(1)$ query time but space complexity of $O(n^2)$.

  The matrix can be pre-filled in $O(n^2)$ time using dynamic programming: $M[i,j] = min(M[i, j-1], A[j])$.
]

These solutions are for *static* `RMQ` problems, but what if we want dynamic updates? For this we add a third complexity measure: *Update Time*. The update time for the array is $O(1)$ (just write `A[i] = v`), but queries become $O(n)$. For the matrix, every update to `A[i]` invalidates all entries $M[i', j']$ where $i' <= i <= j'$, which is $O(n^2)$ entries to fix.

To solve this problem we propose the *segment tree*, which achieves $O(n)$ space, $O(log n)$ query time, and $O(log n)$ update time.

#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr),
    align: (left, center, center, center),
    table.header([*Structure*], [*Space*], [*Query*], [*Update*]),
    [Array], [$O(n)$], [$O(n)$], [$O(1)$],
    [Matrix], [$O(n^2)$], [$O(1)$], [$O(n^2)$],
    [*Segment Tree*], [$O(n)$], [$O(log n)$], [$O(log n)$],
  ),
  caption: [Complexity comparison for dynamic RMQ.],
)

#definition(title: "Segment Tree")[
  A segment tree is a full binary tree where each node $v$ stores $min("range"(v))$ — the minimum over the contiguous sub-array it is responsible for. Leaf nodes correspond to individual elements $A[i]$; each internal node's value is the minimum of its two children.

  The tree has height $h = ceil(log_2 n)$, i.e. $O(log n)$, because the range halves at every level.

  For $A = [5, 2, 4, 7, 1, 9, 3, 6]$ (here $n = 8 = 2^3$, so $h = 3$):

  #figure(
    cetz.canvas({
      import cetz.draw: *

      let r = 0.32
      let s = 1.5 // horizontal spacing between adjacent leaves

      // Horizontal centres for each level
      let l2-xs = (0.75 * s, 2.25 * s, 3.75 * s, 5.25 * s)
      let l1-xs = (1.5 * s, 4.5 * s)
      let root-x = 3.0 * s

      let leaf-vals = (5, 2, 4, 7, 1, 9, 3, 6)
      let l2-vals = (2, 4, 1, 3)
      let l1-vals = (2, 1)

      let leaf-ranges = ("[1]", "[2]", "[3]", "[4]", "[5]", "[6]", "[7]", "[8]")
      let l2-ranges = ("[1,2]", "[3,4]", "[5,6]", "[7,8]")
      let l1-ranges = ("[1,4]", "[5,8]")

      // ── Edges (drawn first so filled circles cover them) ──────────────
      for i in range(8) {
        line((i * s, 0), (l2-xs.at(calc.floor(i / 2)), 1.6), stroke: gray + 0.7pt)
      }
      for i in range(4) {
        line((l2-xs.at(i), 1.6), (l1-xs.at(calc.floor(i / 2)), 3.2), stroke: gray + 0.7pt)
      }
      line((l1-xs.at(0), 3.2), (root-x, 4.8), stroke: gray + 0.7pt)
      line((l1-xs.at(1), 3.2), (root-x, 4.8), stroke: gray + 0.7pt)

      // ── Leaf nodes ────────────────────────────────────────────────────
      for i in range(8) {
        let x = i * s
        circle((x, 0), radius: r, fill: white, stroke: black + 1pt)
        content((x, 0), text(size: 7.5pt)[#leaf-vals.at(i)])
        content((x, -r - 0.22), text(size: 6pt, fill: gray)[#leaf-ranges.at(i)])
      }

      // ── Level-2 nodes ─────────────────────────────────────────────────
      for i in range(4) {
        let x = l2-xs.at(i)
        circle((x, 1.6), radius: r, fill: white, stroke: black + 1pt)
        content((x, 1.6), text(size: 7.5pt)[#l2-vals.at(i)])
        content((x, 1.6 + r + 0.2), text(size: 6pt, fill: gray)[#l2-ranges.at(i)])
      }

      // ── Level-1 nodes ─────────────────────────────────────────────────
      for i in range(2) {
        let x = l1-xs.at(i)
        circle((x, 3.2), radius: r, fill: white, stroke: black + 1pt)
        content((x, 3.2), text(size: 7.5pt)[#l1-vals.at(i)])
        content((x, 3.2 + r + 0.2), text(size: 6pt, fill: gray)[#l1-ranges.at(i)])
      }

      // ── Root ──────────────────────────────────────────────────────────
      circle((root-x, 4.8), radius: r, fill: white, stroke: black + 1pt)
      content((root-x, 4.8), text(size: 7.5pt)[1])
      content((root-x, 4.8 + r + 0.2), text(size: 6pt, fill: gray)[[1,8]])
    }),
    caption: [
      Segment tree for $A = [5, 2, 4, 7, 1, 9, 3, 6]$.
      Each node is labelled with $min$ of its range (shown in gray above/below).
    ],
  )
]

=== RMQ on a Segment Tree

To answer `RMQ(i, j)` we locate the leaves for $A[i]$ and $A[j]$ then walk up the tree, collecting nodes that are entirely inside $[i, j]$. The answer is the minimum over those collected nodes.

The observation is that the query range $[i, j]$ can always be covered by $O(log n)$ nodes (at most 2 per level). Walking from leaves to root takes $O(log n)$ steps, giving $O(log n)$ query time.

*Example:* $op("RMQ")(5, 13)$ on a larger array decomposes into $min(3, 2, 1, 2) = 1$.

=== Update on a Segment Tree

Suppose we want to support `Add(i, k)` defined as $A[i] = A[i] + k$.

1. Update the leaf for $A[i]$.
2. Walk from the leaf to the root, recomputing each internal node as $min$ of its two children.

Since the tree has height $O(log n)$, this takes $O(log n)$ time.

=== Implementation

==== Pointer-based (conceptual)

#pseudocode-list()[
  #smallcaps()[RMQ(i, j)]:
  + $s = infinity$, $a = "leaf"(i)$, $b = "leaf"(j)$
  + while $a$ is not to the right of $b$:
    + if $a$ is a right child:
      + $s = min(s, T[a])$
      + move $a$ one step right (to its right sibling's subtree entry)
    + if $b$ is a left child:
      + $s = min(s, T[b])$
      + move $b$ one step left
    + move $a$ and $b$ to their parents
  + return $s$
]

The invariant is: nodes between $a$ and $b$ (inclusive) at each level cover exactly $[i, j]$. We include a node only when it is a "boundary" child that the parent would over-extend, and then advance past it.

==== Heap-order Array Implementation

We can represent the tree in a compact array $T[1..2n]$ using heap ordering:
- $T[1]$ is the root.
- Node $j$'s children are $T[2j]$ and $T[2j+1]$.
- Node $j$'s parent is $T[floor(j/2)]$.
- Leaves: $T[n+i] = A[i]$ for $i in [1, n]$ (array length $2n$, requires $n$ to be a power of 2).

The parent/child relationship maps directly to right-shift and left-shift on the index.

The key observation for the iterative query: a node at index $j$ is a *right child* iff $j$ is odd ($j mod 2 = 1$), and a *left child* iff $j$ is even ($j mod 2 = 0$). This follows directly from $"right child" = 2k+1$ (always odd) and $"left child" = 2k$ (always even).

So the "boundary check" from the pointer algorithm becomes a simple parity check:

#pseudocode-list()[
  #smallcaps()[RMQ$(i, j)$]:
  + $s = infinity$
  + $a = n + i$, $b = n + j$ #h(1fr) // start at leaves
  + while $a <= b$:
    + if $a mod 2 = 1$: #h(1fr) // $a$ is a right child → parent over-extends left
      + $s = min(s, T[a])$; $a = a + 1$
    + if $b mod 2 = 0$: #h(1fr) // $b$ is a left child → parent over-extends right
      + $s = min(s, T[b])$; $b = b - 1$
    + $a = floor(a/2)$, $b = floor(b/2)$ #h(1fr) // ascend one level
  + return $s$
]

Note the loop terminates in $O(log n)$ iterations since $floor(dot/2)$ halves the indices each step.

#pseudocode-list()[
  #smallcaps()[Add$(i, k)$]:
  + $x = n + i$
  + $T[x] = T[x] + k$
  + $x = floor(x/2)$ #h(1fr) // move to parent
  + while $x >= 1$:
    + $T[x] = min(T[2x], \ T[2x+1])$ #h(1fr) // recompute from children
    + $x = floor(x/2)$
]

This walks up $O(log n)$ levels, recomputing each ancestor as the min of its two children.

*Heap-order array for $A = [5, 2, 4, 1]$, $n = 4$:*

#figure(
  cetz.canvas({
    import cetz.draw: *

    let vals = (none, 1, 2, 1, 5, 2, 4, 1) // T[1..7], T[0] unused
    let cell-w = 1.1
    let cell-h = 0.65

    // Draw cells T[1..7]
    for i in range(1, 8) {
      let x = (i - 1) * cell-w
      // Colour leaves differently
      let bg = if i >= 4 { rgb("#e8f4fd") } else { white }
      rect((x, 0), (x + cell-w, cell-h), fill: bg, stroke: black + 0.8pt)
      content((x + cell-w / 2, cell-h / 2), text(size: 9pt)[#vals.at(i)])
      // Index label
      content((x + cell-w / 2, -0.22), text(size: 7pt, fill: gray)[$T[#i]$])
    }

    // Annotation: root, internal, leaves
    let brace-y = cell-h + 0.55
    line((0, brace-y), (cell-w, brace-y), stroke: black + 0.8pt)
    content((cell-w / 2, brace-y + 0.22), text(size: 7pt)[root])

    line((cell-w, brace-y), (3 * cell-w, brace-y), stroke: black + 0.8pt)
    content((2 * cell-w, brace-y + 0.22), text(size: 7pt)[internal])

    line((3 * cell-w, brace-y), (7 * cell-w, brace-y), stroke: black + 0.8pt)
    content((5 * cell-w, brace-y + 0.22), text(size: 7pt)[leaves ($= A[1..4]$)])

    // Tick marks at boundaries
    for x in (0, cell-w, 3 * cell-w, 7 * cell-w) {
      line((x, brace-y - 0.1), (x, brace-y + 0.1), stroke: black + 0.8pt)
    }
  }),
  caption: [
    Heap-order array $T$ for $A = [5,2,4,1]$, $n=4$.
    Leaves (blue) sit at $T[n..2n-1]$.
    Parent of $T[j]$ is $T[floor(j/2)]$; children of $T[j]$ are $T[2j]$ and $T[2j+1]$.
  ],
)

=== Padding to a Power of Two

The heap-order implementation requires $n = 2^k$. If $n$ is not a power of two, pad $A$ with $+infinity$ elements up to the next power of two. This does not change `RMQ` answers (the padding elements are never the minimum of any real range) and costs at most a factor of 2 in space — asymptotically $O(n)$ remains.

The same data structure works for *range maximum queries*; simply replace every $min$ with $max$.
