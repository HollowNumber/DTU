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

#show: dtu-note.with(
  course: "02105",
  course-name: "Algorithms and Data Structures 1",
  title: "Lecture - March 19, 2026",
  date: datetime(year: 2026, month: 3, day: 26),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

#outline()

= Exercises
#let draw-heap(vals) = {
  let pos = ((2, 0), (1, 1), (3, 1), (0.5, 2), (1.5, 2))
  let par = ((0, 1), (0, 2), (1, 3), (1, 4))
  let items = ()
  for (i, v) in vals.enumerate() {
    items.push(fletcher.node(pos.at(i), [#v], shape: "circle", stroke: black + 0.8pt, fill: white, inset: 6pt))
  }
  for (p, c) in par {
    if c < vals.len() {
      items.push(fletcher.edge(pos.at(p), pos.at(c)))
    }
  }
  fletcher.diagram(spacing: (5mm, 7mm), edge-stroke: 0.8pt, ..items)
}

#let draw-tree(data) = cetz.canvas({
  import cetz.draw: *
  import cetz.tree
  set-style(content: (padding: .2), stroke: black + 0.8pt)
  tree.tree(data, spread: 0.2, grow: 1.9, draw-node: (node, ..) => {
    circle((), radius: .45, stroke: black + 0.8pt, fill: white)
    content((), [#text(fill: black)[#node.content]], weight: "regular")
  }, draw-edge: (from, to, ..) => {
    line((a: from, number: .6, b: to), (a: to, number: .6, b: from))
  }, name: "tree")
})

#grid(columns: (1fr, 1fr, 1fr), gutter: 1em, align(center)[
  #draw-tree((16, (13, (7, 4), (5)), (11, (9), 1)))
  *(a)*
], align(center)[
  #draw-tree((20, (18, (16, 13, 4), (15, 7, 19)), (14, (11, 2), 10)))
  *(b)*
], align(center)[
  #draw-tree((9, (8, (6, 3, 2)), (7, (5, 1), 4)))
  *(c)*
])

#programming-problem(
  number: 1,
)[
==== Heap Properties and Simulation
Solve the following exercises.

#programming-problem(number: 1.1, difficulty: [\[w\]])[
  Which of the following trees are heaps?

  #solution()[
    A And C are heaps.

    B is not a heap since key 15 has a child with key 19.
  ]
]

#programming-problem(
  number: 1.2,
  difficulty: [\[w\]],
)[
  Which of the following arrays are heaps? Index 0 is not used and is therefore marked with $-$

  $A = [-,9,7,8,3,4] quad B = [-,12,4,7,1,2,10] quad C = [-,5,7,8,3]$

  #solution(
    )[
    A is a heap since for each index $i$, the key at $i$ is greater than or equal to the keys at $2i$ and $2i+1$ (if they exist).

    B is not a heap.

    C is not a heap since 8 is a child of 5 and 8 is greater than 5.
  ]
]

#programming-problem(
  number: 1.3,
  difficulty: [\[w\]],
)[
  Let $S = 4, 8, 11, 5, 21, star, 2, star$ be a sequence of operations where a number corresponds to an insertion of that number and $star$ corresponds to an EXTRACTMAX operation. Starting with an empty heap $H$, show how $H$ looks after each operation in $S$.

  #solution()[
    After inserting 4: $H = (4)$

    After inserting 8: $H = (8, 4)$

    After inserting 11: $H = (11, 4, 8)$

    After inserting 5: $H = (11, 5, 8, 4)$

    After inserting 21: $H = (21, 11, 8, 4, 5)$

    After EXTRACTMAX: $H = (11, 5, 8, 4)$

    After inserting 2: $H = (11, 5, 8, 4, 2)$

    After EXTRACTMAX: $H = (8, 5, 2, 4)$

    #grid(
      columns: (1fr,) * 4,
      gutter: 0.8em,
      align(center)[*INSERT 4* \ #draw-heap((4,)) \ $[-, 4]$],
      align(center)[*INSERT 8* \ #draw-heap((8, 4)) \ $[-, 8, 4]$],
      align(center)[*INSERT 11* \ #draw-heap((11, 4, 8)) \ $[-, 11, 4, 8]$],
      align(center)[*INSERT 5* \ #draw-heap((11, 5, 8, 4)) \ $[-, 11, 5, 8, 4]$],
      align(center)[*INSERT 21* \ #draw-heap((21, 11, 8, 4, 5)) \ $[-, 21, 11, 8, 4, 5]$],
      align(center)[$star$ *EXTRACTMAX* \ #draw-heap((11, 5, 8, 4)) \ $[-, 11, 5, 8, 4]$],
      align(center)[*INSERT 2* \ #draw-heap((11, 5, 8, 4, 2)) \ $[-, 11, 5, 8, 4, 2]$],
      align(center)[$star$ *EXTRACTMAX* \ #draw-heap((8, 5, 2, 4)) \ $[-, 8, 5, 2, 4]$],
    )

  ]
]

#programming-problem(
  number: 1.4,
)[
  Is a sorted array a heap?

  #solution(
    )[
    No. A sorted array is not a heap since for each index $i$, the key at $i$ is less than the keys at $2i$ and $2i+1$ (if they exist).

    For instance, the sorted array $[-, 1, 2, 3]$ is not a heap since the key at index 1 (which is 1) is less than the keys at indices 2 and 3 (which are 2 and 3).
  ]
]

#programming-problem(
  number: 1.5,
)[
  Where can the minimum element be found in a (max-)heap?

  #solution(
    )[
    The minimum element in a max-heap can be found at one of the leaf nodes. This is because the heap property only guarantees that each parent node is greater than or equal to its children, but does not impose any order among the children. Therefore, the minimum element must be among the leaf nodes, which are the nodes at the last level of the heap.
  ]
]

#programming-problem(
  number: 1.6,
)[
Show that `INSERT`, `EXTRACTMAX` and `INCREASEKEY` maintains the heap property.

#solution(
  )[
The `INSERT` operation maintains the heap property by adding the new element at the end of the heap and then "bubbling up" the element until the heap property is restored. This ensures that the new element is in the correct position in the heap.

The `EXTRACTMAX` operation maintains the heap property by removing the maximum element (which is at the root) and replacing it with the last element in the heap. Then, it "bubbles down" this element until the heap property is restored. This ensures that the new root is in the correct position in the heap.

The `INCREASEKEY` operation maintains the heap property by increasing the key of an element and then "bubbling up" this element until the heap property is restored. This ensures that the increased key is in the correct position in the heap.
]
]

#programming-problem(
  number: 1.7,
  difficulty: [\[\*\]],
)[
  Suppose we have $k$ sorted arrays containing in total $n$ elements. Show how to merge the arrays into a single sorted array in time $O(n log k)$.

  #solution(
    )[
    We can use a min-heap to merge the $k$ sorted arrays. We start by inserting the first element of each array into the min-heap. Then, we repeatedly extract the minimum element from the heap and add it to the merged array. After extracting an element from the heap, we insert the next element from the same array into the heap (if it exists). This process continues until the heap is empty.

    The time complexity of this algorithm is $O(n log k)$ because we perform $n$ insertions and extractions from the heap, and each operation takes $O(log k)$ time since there are at most $k$ elements in the heap at any time.

  ]
]
]

#programming-problem(
  number: 2,
)[
==== Priority Queue Operations
We now want to extend the set of operations on priority queues. We are interested in the following operations.

- REMOVELARGEST$(m)$: remove the $m$ largest elements in the priority queue.
- DELETE$(x)$: remove the element $x$ from the priority queue.
- FUSION$(x, y)$: remove $x$ and $y$ from the priority queue and add the element $z$ with key $x.k e y + y.k e y$.
- THRESHOLD$(k)$: return the elements in the priority queue with key $>= k$.
- EXTRACTMIN: Remove and return the element with the lowest key.

We want to support these operations efficiently while maintaining the complexities of the standard operations. Let $n$ be the number of elements in the priority queue. Solve the following exercises.

#programming-problem(
  number: 2.1,
)[
Extend the priority queue to support REMOVELARGEST$(m)$ in $O(m log n)$ time.

#solution(
  )[
We can implement the `REMOVELARGEST(m)` operation by repeatedly calling the `EXTRACTMAX` operation $m$ times. Each call to `EXTRACTMAX` removes the largest element from the priority queue and takes $O(log n)$ time. Therefore, performing this operation $m$ times will take $O(m log n)$ time.

Pseudocode for `REMOVELARGEST(m)`:
#pseudocode-list[
#smallcaps[`REMOVELARGEST(m)`]:
+ for i in 1 to m:
  + EXTRACTMAX()
]
]
]

#programming-problem(
  number: 2.2,
)[
Extend the priority queue to support DELETE and FUSION in $O(log n)$ time.

#solution(
  )[
To support the `DELETE(x)` operation in $O(log n)$ time, we can first find the index of the element $x$ in the priority queue. Once we have the index, we can replace the element at that index with the last element in the heap and then remove the last element. After this replacement, we need to restore the heap property by performing a "bubble down" operation starting from the index where $x$ was located. This will ensure that the heap property is maintained.

To support the `FUSION(x, y)` operation in $O(log n)$ time, we can first perform `DELETE(x)` and `DELETE(y)` to remove both elements from the priority queue. Then, we can create a new element $z$ with key equal to $x.k e y + y.k e y$ and insert it into the priority queue using the standard `INSERT` operation. This will also take $O(log n)$ time.

Pseudocode for `DELETE(x)`:
#pseudocode-list[
#smallcaps[`DELETE(x)`]:
+ index = find_index(x)
+ if index is not found:
  + return
+ replace element at index with last element
+ remove last element
+ bubble_down(index)
]

Pseudocode for `FUSION(x, y)`:
#pseudocode-list[
#smallcaps[`FUSION(x, y)`]:
+ DELETE(x)
+ DELETE(y)
+ z.key = x.key \* y.key + y.key \* y.key
+ INSERT(z)
]
]
]

#programming-problem(
  number: 2.3,
  difficulty: [\[\*\]],
)[
Extend the priority queue to support THRESHOLD in $O(m)$ time, where $m$ is the number of elements with key $>= k$.

#solution(
  )[
To support the `THRESHOLD(k)` operation in $O(m)$ time, we can perform a level-order traversal of the heap starting from the root. During the traversal, we can check the key of each element against the threshold $k$. If an element's key is greater than or equal to $k$, we add it to the result list. Since we are only interested in elements with keys greater than or equal to $k$, we can stop traversing a subtree as soon as we encounter an element with a key less than $k$, as all elements in that subtree will also have keys less than $k$ due to the heap property.

Pseudocode for `THRESHOLD(k)`:
#pseudocode-list[
#smallcaps[`THRESHOLD(k)`]:
+ result = []
+ queue = [root]
+ while queue is not empty:
  + current = queue.pop()
  + if current.key >= k:
    + result.append(current)
    + if current.left is not null:
      + queue.append(current.left)
    + if current.right is not null:
      + queue.append(current.right)
+ return result
]
]
]

#programming-problem(
  number: 2.4,
  difficulty: [\[\*\]],
)[
Extend the priority queue to support EXTRACTMIN in $O(log n)$ time.

#solution(
  )[
To support the `EXTRACTMIN` operation in $O(log n)$ time, we can maintain a separate min-heap alongside the max-heap that we use for the standard priority queue operations. The min-heap will allow us to efficiently access and remove the minimum element.

Pseudocode for `EXTRACTMIN`:
#pseudocode-list[
#smallcaps[`EXTRACTMIN()`]:
+ min_element = min_heap.EXTRACTMIN()
+ max_heap.DELETE(min_element)
+ return min_element
]
]
]
]

#programming-problem(
  number: 3,
)[
==== Satellite Data
Let $A[0..n]$ be a heap represented as an array. Each element $x$ in the heap is represented by an index $i$ and the key stored in $A[i]$. It is often useful to store some extra information (called _satellite data_) associated with an element (for instance, if we want to store persons in a heap, the satellite data could be age, gender, height, weight, etc). Show how to support access to satellite data in $O(1)$ time only given the index $i$ while maintaining the running times for the standard heap operations.

#solution(
  )[
To support access to satellite data in $O(1)$ time given the index $i$, we can maintain a separate array `satellite_data` of the same size as the heap array `A`. The `satellite_data[i]` will store the satellite data associated with the element at index $i$ in the heap.

When we perform standard heap operations such as `INSERT`, `EXTRACTMAX`, and `INCREASEKEY`, we need to ensure that we also update the `satellite_data` array accordingly. For example, when we insert a new element into the heap, we can also insert the corresponding satellite data into the `satellite_data` array at the same index. When we extract the maximum element, we can remove the corresponding satellite data from the `satellite_data` array. When we increase the key of an element, we can also update the corresponding satellite data if necessary.

#note-box(
  )[
  My own intuition would be making a struct that better represents the elements in the heap, so that each element contains both the key and the satellite data.

  upon further reading this seems to be a well known problem called:

  *Array of Structs (AoS) vs Struct of Arrays (SoA)*
]

]
]

#programming-problem(
  number: 4,
)[
  ==== Heap Properties
  Let $T$ be a complete binary tree of height $h$. Solve the following exercises.

  #programming-problem(
    number: 4.1,
  )[
    Show the number of nodes in $T$ is $n = 2^(h+1) - 1$. _Hint:_ Argue that the number of nodes in $T$ is $n = 1 + 2 + 4 + dots 2^h$ and consider the binary representation of this number.

    #solution(
      )[
      The number of nodes in a complete binary tree of height $h$ can be calculated by summing the number of nodes at each level of the tree. The number of nodes at level $i$ is $2^i$, where $i$ ranges from 0 to $h$. Therefore, the total number of nodes in the tree can be expressed as:

      $
        n &= 2^0 + 2^1 + 2^2 + dots + 2^h \
          &= 1 + 2 + 4 + dots + 2^h \
          &= 2^(h+1) - 1 \
      $

      proof by induction:

      - *Base case*: For $h = 0$, the tree has $n = 2^(0+1) - 1 = 1$ node, which is true.
      - *Inductive step*: Assume that the formula holds for a complete binary tree of height $h$, i.e., it has $n = 2^(h+1) - 1$ nodes. Now, consider a complete binary tree of height $h + 1$. The number of nodes in this tree can be calculated as follows:
      - The number of nodes in the complete binary tree of height $h$ is $2^(h+1) - 1$ (by the inductive hypothesis).
      - The number of nodes at level $h + 1$ is $2^(h+1)$.
      - Therefore, the total number of nodes in the complete binary tree of height $h + 1$ is:
      $
        n' &= (2^(h+1) - 1) + 2^(h+1) \
           &= 2^(h+1) - 1 + 2^(h+1) \
           &= 2 dot 2^(h+1) - 1 \
           &= 2^(h+2) - 1 \
      $

      Thus, the formula holds for a complete binary tree of height $h + 1$. By the principle of mathematical induction, the formula $n = 2^(h+1) - 1$ holds for all non-negative integers $h$.

    ]
  ]

  #programming-problem(
    number: 4.2,
  )[
    Show that the sum, $S = n\/4 dot 1 + n\/8 dot 2 + n\/16 dot 3 + n\/32 dot 4 + dots = Theta(n)$. _Hint:_ Calculate $S - S\/2$.

    #solution(
      )[
      We can express the sum $S$ as follows:

      $
        S &= sum_(i = 1)^k n/2^i dot (i-1) \
          &= n/4 dot 1 + n/8 dot 2 + n/16 dot 3 + n/32 dot 4 + dots \
          &= n/4 + n/4 + n/4 + n/4 + dots \
          &= n/4 dot k
      $

      where $k$ is the number of terms in the sum. Since $k$ is a constant (it does not depend on $n$), we can conclude that $S = Theta(n)$.

    ]
  ]
]

#programming-problem(
  number: 5,
  difficulty: [\[†\]],
)[
==== Task Delegation
Josefine is in charge of the local student organization at The University of Algorithms. The organization gets tasks they must complete. Each task has a unique id and a unique difficulty. Over time, new tasks are given to the organization, and Josefine is responsible for delegating these tasks to the organization's members. When a member is ready to do a new task, he/she asks Josefine for a new task. Josefine likes to challenge her members, so she always picks the most difficult currently available task when a member requests a new task. More precisely, we want to support the following operations:

- NEWTASK$(i, d)$: Add the task with id $i$ and difficulty $d$ to the set of tasks.
- REQUESTTASK$()$: Remove the task with the highest difficulty from the set of tasks and return its id.

Give a data structure for this problem and implement it.

*Input* Line 1 contains the integer $N$ that is the total number of tasks. Lines $2 dots N+1$ can be either a new task indicated by the letter `N` followed by two integers `id` and `diff` (corresponding to the id of the task and the difficulty) or a member that is ready to receive a new task indicated by the letter `R`.

*Output* Line $i$ is the id of the task given to the $i$th receive request.

#solution()[
  #raw(read("code/week7/tasks.c"), block: true, lang: "c")
]
]

#programming-problem(
  number: 6,
)[
==== Sums
Let $A[0..n-1]$ be an array of integers. We are interested in the following operations on $A$.

- SUM$(i, j)$: compute $A[i] + A[i+1] + dots + A[j]$.
- CHANGE$(i, x)$: set $A[i] = x$.

Solve the following exercises.

#programming-problem(
  number: 6.1,
  difficulty: [\[w\]],
)[
Give a simple data structure that supports SUM in $O(1)$ time and uses $O(n^2)$ space.

#solution(
  )[
```c
      int sum[n][n];
      ```

We can precompute the sum of all subarrays of $A$ and store them in a 2D array `sum` where `sum[i][j]` contains the value of $A[i] + A[i+1] + dots + A[j]$. This allows us to answer SUM queries in $O(1)$ time by simply returning the value stored in `sum[i][j]`. However, this approach uses $O(n^2)$ space since we need to store the sum for all pairs of indices.
]
]

#programming-problem(number: 6.2, difficulty: [\[\*\]])[
  Give a data structure that supports SUM in $O(1)$ time and uses $O(n)$ space.

  #solution()[
    ```c
      int prefix_sum[n];
    ```     
    We can maintain a prefix sum array `prefix_sum` where `prefix_sum[i]` contains the sum of the first $i$ elements of $A$, i.e., `prefix_sum[i] = A[0] + A[1] + dots + A[i-1]`. This allows us to compute the sum of any subarray $A[i..j]$ in $O(1)$ time using the formula:

  ]
]

#programming-problem(number: 6.3, difficulty: [\[\*\*\]])[
  Give a data structure that supports both SUM and CHANGE in $O(log n)$ time and uses $O(n)$ space.

  #solution()[
    We can use a segment tree to support both SUM and CHANGE operations in $O(log n)$ time. A segment tree is a binary tree where each node represents a segment of the array $A$. The leaf nodes represent individual elements of the array, and the internal nodes represent the sum of their child nodes.

    to build the segment tree we can use binary recursion. The root node will represent the entire array $A[0..n-1]$, and each internal node will represent a segment of the array. The value stored in each node will be the sum of the elements in that segment. 
    
    To perform the SUM operation, we can traverse the segment tree to find the nodes that correspond to the segment $A[i..j]$ and sum their values. This will take $O(log n)$ time since we will only need to visit a logarithmic number of nodes.
  ]
]
]
