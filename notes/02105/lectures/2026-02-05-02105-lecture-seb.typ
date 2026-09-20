#import "@local/dtu-template:0.6.0":*
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()
#codly(languages: codly-languages)
#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

#show: dtu-note.with(
  course: "02105",
  course-name: "Algorithms and Data Structures 1",
  title: "Lecture - February 05, 2026",
  date: datetime(year: 2026, month: 2, day: 5),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

= Pre-Lecture Exercises

== Exercise 1: Loops

#programming-problem(
  number: 1,
)[
Check understanding of basic programming concepts. Do not implement the functions. Determine what the functions `loop1`, `loop2`, `loop3` and `loop4` in @fig:loops return.
]

#programming-problem(number: "1.1")[
  When $n = 4$, what does each function return?
]

#solution[
- `loop1`: 16
- `loop2`: 8
- `loop3`: 4
- `loop4`: 10
]

#programming-problem(number: "1.2")[
  When $n = 10$, what does each function return?
]

#solution[
- `loop1`: 100
- `loop2`: 20
- `loop3`: 10
- `loop4`: 55
]

#programming-problem(number: "1.3")[
  When $n = 1000$, what does each function return?
]

#solution[
- `loop1`: 1000000
- `loop2`: 2000
- `loop3`: 1000
- `loop4`: 500500
]

#programming-problem(number: "1.4")[
  Express each function's return value as a function of $n$.
]

#solution[
- `loop1`: $n^2$
- `loop2`: $2n$
- `loop3`: $n$
- `loop4`: $display(sum_(i=1)^(n) i = (n(n+1))/2)$
]

== Exercise 2: Recursion and Iteration

#programming-problem(number: "2")[
  A function is _recursive_ if it calls itself. For instance, the function $f(A,n)$ in @fig:loops is recursive.
]

#programming-problem(number: "2.1")[
  What does $f(A,n)$ compute if $A$ is an array of integers of length $n$? You should not implement it.
]

#solution[
  $f(A,n)$ computes the sum of all elements in the array $A$ of length $n$.
]

#programming-problem(
  number: "2.2",
)[
  Rewrite $f(A,n)$ to be iterative, i.e., make a function that computes the same as $f(A,n)$ but without calling itself.
]

#solution[
```python
def f(A: list[int], n: int) -> int:
   if n <= 0:
       return 0
   else:
       total: int = 0
       for i in range(n):
           total += A[i]
       return total
```
]

== Exercise 3: Standard Input/Output and Redirection

#programming-problem(
  number: "3",
)[
In our practical implementation exercises, we will use the standard input and output for input and output, i.e., using `input()` and `print()`, respectively. We will use redirection for large inputs and outputs. Make sure you understand how this works by solving these exercises.
]

#programming-problem(
  number: "3.1",
)[
Implement a program `sum.py` that reads (from the standard input) two integers on a single line with a space between. Write the sum to the standard output.
]

#programming-problem(
  number: "3.2",
)[
Make a new text file `input.txt` containing two integers on a single line with a space between them. Redirect the file's contents to the standard input for your program. Do not modify `sum.py`.
]

#solution[
```bash
python sum.py < input.txt
```
]

#programming-problem(
  number: "3.3",
)[
Now redirect the standard output to a file. Do not modify `sum.py`. Check that the newly created file `output.txt` contains the correct answer. Finally, also try the combination.
]

#solution[
Redirect standard output to a file:
```bash
  python sum.py > output.txt
  ```

Combined input and output redirection:
```bash
  python sum.py < input.txt > output.txt
  ```
]

== Exercise 4: Linearthritis

#programming-problem(
  number: "4",
)[
  You have recently hired 128 programmers for your new high-tech startup company. Unfortunately, one suffers from the feared _Linearthritis_ disease that makes everybody near the person write slow programs. To identify the diseased programmer, you have rented a special room that you can use to determine if the diseased programmer is within a group of your programmers. It is extremely expensive to rent this room, and the process needed to test a group is complicated. Therefore, you would like to minimize the number of times you have to use the room to find the diseased programmer.
]

#programming-problem(number: "4.1")[
  Show you can find the diseased programmer using at most 7 tests.
]

#solution[
  Use *binary search*: take exactly half the programmers in each test. If the diseased programmer is in the group, continue testing that group by halving it. The number of tests needed can be visualized with a binary tree:

  #import "@preview/cetz:0.4.2": canvas, draw
  #import draw: circle, content, line, rect

  #figure(
    canvas({
      let node-sep = 1.8
      let level-sep = 1.4
      let node-radius = 0.35
      let arrow-style = (mark: (end: "stealth", fill: black, scale: 0.2, offset: 0.03))

      // Helper to draw a node with label
      let draw-node(pos, label, name: none) = {
        circle(pos, radius: node-radius, name: name)
        content(pos, label)
      }

      // Draw nodes level by level (showing binary search tree structure)
      // Level 0: Start with all 128
      draw-node((0, 0), [128], name: "n0")

      // Level 1: Split into 64 each
      draw-node((-node-sep, -level-sep), [64], name: "n1l")
      draw-node((node-sep, -level-sep), [64], name: "n1r")

      // Level 2: Split into 32 each
      draw-node((-1.5 * node-sep, -2 * level-sep), [32], name: "n2ll")
      draw-node((-0.5 * node-sep, -2 * level-sep), [32], name: "n2lr")
      draw-node((0.5 * node-sep, -2 * level-sep), [32], name: "n2rl")
      draw-node((1.5 * node-sep, -2 * level-sep), [32], name: "n2rr")

      // Level 3: Indicate continuation with dots
      content((-1.5 * node-sep, -3 * level-sep), $dots.v$)
      content((-0.5 * node-sep, -3 * level-sep), $dots.v$)
      content((0.5 * node-sep, -3 * level-sep), $dots.v$)
      content((1.5 * node-sep, -3 * level-sep), $dots.v$)

      // Level 7: Show final level with 1 programmer each
      draw-node((-1.5 * node-sep, -4.2 * level-sep), [1], name: "n7a")
      draw-node((-0.5 * node-sep, -4.2 * level-sep), [1], name: "n7b")
      draw-node((0.5 * node-sep, -4.2 * level-sep), [1], name: "n7c")
      draw-node((1.5 * node-sep, -4.2 * level-sep), [1], name: "n7d")

      // Draw edges
      line("n0", "n1l", ..arrow-style)
      line("n0", "n1r", ..arrow-style)
      line("n1l", "n2ll", ..arrow-style)
      line("n1l", "n2lr", ..arrow-style)
      line("n1r", "n2rl", ..arrow-style)
      line("n1r", "n2rr", ..arrow-style)

      // Level annotations on the right side
      let annot-x = 2.8 * node-sep
      content((annot-x, 0), [Level 0: 128 people], anchor: "west")
      content((annot-x, -level-sep), [Level 1: Test 1 → 64 people], anchor: "west")
      content((annot-x, -2 * level-sep), [Level 2: Test 2 → 32 people], anchor: "west")
      content((annot-x, -3 * level-sep), [$dots.v$], anchor: "west")
      content((annot-x, -4.2 * level-sep), [Level 7: Test 7 → 1 person], anchor: "west")

      // Test count annotation
      content((0, -5.3 * level-sep), [Total tests needed: $log_2(128) = 7$])
    }),
    caption: [Binary search tree showing the process of finding the diseased programmer. Each test halves the search space.],
  )
]

#programming-problem(number: "4.2")[
  How many tests do you need if you have $n$ programmers instead of 128?
]

#solution[
  You will always need at most
  $
    log_2(n)
  $
  tests, as each test halves the number of programmers left to test.
]

#programming-problem(
  number: "4.3",
  difficulty: 1,
)[
  Assume that you rent $k > 1$ rooms you can use to test $k$ groups of programmers simultaneously. How many rounds of tests are enough to identify the diseased programmer? In each round, you can test $k$ groups in parallel.
]

#solution[
  You will need at most
  $
    log_(k+1)(n)
  $
  rounds, as each round can reduce the number of programmers left to test by a factor of $k+1$.
]

== Exercise 5: Zombie Duels

#programming-problem(
  number: "5",
)[
  You have an army of $n$ brainless zombies. You want to find the strongest and the weakest zombie in the army. By pairing up two zombies in a cage with a big chunk of brain matter, you can quickly determine which of the two are the strongest. Unfortunately, zombies wear out in this process, so you want to minimize the number of duels needed.
]

#programming-problem(number: "5.1")[
  Explain how to find the strongest zombie using at most $n-1$ duels.
]

#solution[
  This is analogous to running a single round of bubble-sort.

  Simply pair up all zombies and have them duel. The winners move on to the next round, while the losers are discarded. Repeat this process until only one zombie remains. Since each duel eliminates one zombie, you will need exactly $n-1$ duels to find the strongest zombie.
]

#programming-problem(number: "5.2", difficulty: 1)[
  Explain how to find the strongest and the weakest zombie using at most $(3n)/2$ duels.
]

#solution[
  Using a tournament approach:

  - Pair up all zombies: $n/2$ duels
  - The loser of the first round is guaranteed to NOT be the _strongest_
  - The winner of the first round is guaranteed to NOT be the _weakest_

  This gives us two groups:
  $
    "winners:" &n/2 \
    "losers:"  &n/2
  $

  The group of winners *must* contain the strongest zombie, and the group of losers *must* contain the weakest.

  Repeating this slowly isolates the weakest and the strongest, as no one in the winner sub-groups can be the weakest, nor can anyone in the loser sub-groups be the strongest.

  - Find strongest among the $n/2$ winners: $(n/2 - 1)$ duels
  - Find weakest among the $n/2$ losers: $(n/2 - 1)$ duels

  Total duels:
  $
    n/2 + (n/2 - 1) + (n/2 - 1) = (3n)/2 - 2
  $
]

#programming-problem(number: "5.3", difficulty: 2)[
  Explain how to find the strongest and second strongest zombie using at most $n + log_2 n$ duels.
]

#note-box[_Solution not yet completed._]

== Exercise 6: Ants on a Stick

#programming-problem(
  number: "6",
  difficulty: 2,
)[
  Suppose that you have 100 ants on a stick of length 100 cm. At the start, each ant is placed at some position on the stick, pointing either toward the left or right end of the stick. Then, all ants begin to move simultaneously. The ants all move at a speed of 1 cm per second. If an ant bumps into another ant, they both immediately reverse directions and continue at the same speed, and if an ant reaches the end of the stick, it falls off the stick. What is the maximum duration of time before all ants have fallen off the stick over all possible initial placements of the ants?
]

#note-box[_Solution not yet completed._]

#figure(caption: "Loops and recursion in Python.", ```python
  def loop1(n):
      x = 0
      for i in range(n):
          for j in range(n):
              x += 1
      return x

  def loop2(n):
      x = 0
      for i in range(n):
          x += 1
      for j in range(n):
          x += 1
      return x

  def loop3(n):
      x = 0
      for i in range(n):
          if (i == n-1):
              for j in range(n):
                  x += 1
      return x

  def loop4(n):
      x = 0
      for i in range(n):
          for j in range(i, n):
              x += 1
      return x

  def f(A, n):
      if (n == 0):
          return 0
      else:
          return f(A, n - 1) + A[n-1]
  ```) <fig:loops>

= Lecture Notes

== Fundamental Concepts

#definition(title: "Algorithmic Problem")[
  A precisely defined relation between input and output.
]

#definition(title: "Algorithm")[
  A sequence of *discrete* and *unambiguous* steps. It is a mathematical abstraction of a program.
]

#dtu-line()

== Finding the Maximum Element

#example(title: "FindMax Problem")[
Given an array `A` of `n` elements, find the index of the maximum element.
]

=== Description Methods

#dtu-highlight(
  title: "Natural Language",
)[
Process `A` from left-to-right and maintain the value and index of the maximal value seen so far. Return the index.
]

=== Pseudocode

#pseudocode-list(title: smallcaps[FindMax(A, n)])[
  + $max := 0$
  + *for* $i = 0$ *to* $n - 1$ *do*
    + *if* $A[i] > A[max]$ *then* $max := i$
  + *end*
  + *return* $max$
]

#dtu-line()

== Peak Finding Problem

#definition(title: "Peak")[
An element `A[i]` is a _peak_ if it is at least as large as its neighbors:
- `A[i]` is a peak if `A[i-1] <= A[i] >= A[i+1]` for $i in {1, dots, n-2}$
- `A[0]` is a peak if $A[0] >= A[1]$
- `A[n-1]` is a peak if `A[n-1] >= A[n-2]`
]

=== Algorithm 1: Linear Scan

#note-box(title: "Approach")[
  For each entry, check if it is a peak. Return the index of the first peak found.
]

#pseudocode-list(title: smallcaps[`Peak1(A, n)`])[
  + *if* $A[0] >= A[1]$ *then return* $0$
  + *for* $i = 1$ *to* $n - 2$ *do*
    + *if* $A[i-1] <= A[i] >= A[i+1]$ *then return* $i$
  + *end*
  + *if* $A[n-1] >= A[n-2]$ *then return* $n - 1$
]

==== Running Time Analysis

$
  T(n) = c_1 + c_2(n-2) + c_3
$

$T(n)$ is a linear function of $n$: $T(n) = a n + b$

#dtu-highlight(title: "Asymptotic Notation")[
  $T(n) = O(n)$
]

#dtu-line()

=== Algorithm 2: Find Maximum

#note-box(title: "Observation")[
  A maximal entry $A[i]$ is always a peak.
]

#pseudocode-list(title: smallcaps[`Peak2(A, n)`])[
  + $max := 0$
  + *for* $i = 0$ *to* $n - 1$ *do*
    + *if* $A[i] > A[max]$ *then* $max := i$
  + *end*
  + *return* $max$
]

==== Running Time Analysis

$
  T(n) = c_4 + n dot c_5 + c_6 = O(n)
$

#important(title: "Question")[
  Can we do significantly better than $O(n)$?
]

=== Algorithm 3: Binary Search Approach

#dtu-highlight(title: "Clever Idea")[
Consider any entry `A[i]` and its neighbors `A[i-1]` and `A[i+1]`.

Where can a peak be, relative to $A[i]$?
- If neighbors are smaller: `A[i-1] <= A[i] >= A[i+1]` $=>$ `A[i]` is a peak
- Otherwise: `A` is increasing in at least one direction $=>$ a peak must exist in that direction
]

==== Algorithm Description

Consider the middle entry `A[m]` and its neighbors `A[m-1]` and `A[m+1]`.

If `A[m]` is a peak, return `m`.

Otherwise, continue the search recursively in the half where `A` is increasing.

#pseudocode-list(title: smallcaps[`Peak3(A, i, j)`])[
  + $m := floor((i + j) / 2)$
  + *if* $A[m-1] <= A[m] >= A[m+1]$ *then return* $m$
  + *else if* $A[m-1] > A[m]$ *then*
    + *return* Peak3$(A, i, m - 1)$
  + *else*
    + *return* Peak3$(A, m + 1, j)$
  + *end*
]

==== Running Time Analysis

Each recursive call takes constant time.

How many recursive calls are made? Each call *halves* the size of the interval. We stop when the array has size 1.

- 1st recursive call: $n/2$
- 2nd recursive call: $n/4$
- $dots.v$
- $k$-th recursive call: $n/(2^k)$

After $~log_2 n$ recursive calls, the size of the array is $<= 1$.

#dtu-highlight(title: "Result")[
  Running time is $O(log n)$
]

#note-box(title: "Experimental Analysis")[
  Algorithm 3 is significantly faster than Algorithms 1 and 2 for large $n$.
]

#figure(
  cetz.canvas({
    import cetz.draw: *
    import cetz-plot: *

    plot.plot(
      size: (10, 6),
      x-label: [$n$ (input size)],
      y-label: [Time $T(n)$ (1000 searches)],
      x-min: 0,
      x-max: 2000000,
      y-min: 0,
      y-max: 2500000,
      x-tick-step: 500000,
      y-tick-step: 500000,
      legend: "north-west",
      legend-style: (fill: white, stroke: gray, padding: 0.3),
      {
        // Algorithm 1: O(n) - linear scan (slightly faster constant)
        plot.add(
          domain: (1, 2000000),
          samples: 200,
          style: (stroke: (paint: dtu-blue, thickness: 2pt)),
          label: [Algorithm 1: $O(n)$],
          x => x,
        )

        // Algorithm 2: O(n) - find max (same complexity, slightly higher constant)
        plot.add(
          domain: (1, 2000000),
          samples: 200,
          style: (stroke: (paint: dtu-coral, thickness: 2pt, dash: "dashed")),
          label: [Algorithm 2: $O(n)$],
          x => (1.1 * x + 2),
        )

        // Algorithm 3: O(log n) - binary search (insanely fast!)
        plot.add(
          domain: (1, 2000000),
          samples: 200,
          style: (stroke: (paint: dtu-green, thickness: 2.5pt)),
          label: [Algorithm 3: $O(log n)$],
          x => 10 * calc.log(x, base: 2),
        )
      },
    )
  }),
  caption: [Comparison of running times for the three peak-finding algorithms (1000 searches each). The binary search algorithm (green) is dramatically faster for large inputs.],
) <fig:algorithm-comparison>

#dtu-line()

== Theoretical Analysis Framework

#definition(title: "Running Time / Time Complexity")[
  $T(n) = "number of steps that the algorithm performs on input of size" n$
]

#definition(title: "Steps")[
Elementary operations such as:
- Read/write to memory (`x := y`, `A[i]`, etc.)
- Arithmetic operations
- Comparisons
]
