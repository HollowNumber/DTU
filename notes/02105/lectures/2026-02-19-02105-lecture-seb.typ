#import "@local/dtu-template:0.6.3":*
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)
#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#codly(fill: white, zebra-fill: black.lighten(95%), stroke: 1pt + black)

#show: dtu-note.with(
  course: "02105",
  course-name: "Algorithms and Data Structures 1",
  title: "Lecture - February 19, 2026",
  date: datetime(year: 2026, month: 2, day: 19),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

// • [w] A warmup exercise. These should be easy if you have understood the material for the week.
// • [∗] and [∗∗] A difficult and a very difficult exercise, respectively . These exercises usually require clever and creative insights to solve. Work on these after you have solved the other exercises.
// • [†] An exercise that involves programming.

#outline()

== Exercise 1: Run by Hand and Properties

#programming-problem(
  number: 1,
)[
Solve the following exercises.
#programming-problem(number: 1.1, difficulty: 1)[
[w] Show the execution of insertion sort on the array: `A = [31, 41, 59, 26, 41, 58]`
]
#solution(
  )[
// TODO: add a Cetz plot showing the execution of insertion sort on the given array.
Insertion sort iterates through the array and at each iteration it inserts the current element into the correct position in the sorted subarray to the left of the current element.

for the given array that turns out as follows:

1. Iteration 1: The first element `31` is already in the correct position, so the array remains unchanged: `A = [31, 41, 59, 26, 41, 58]`
2. Iteration 2: The second element `41` is greater than `31`, so it is already in the correct position: `A = [31, 41, 59, 26, 41, 58]`
3. Iteration 3: The third element `59` is greater than `41`, so it is already in the correct position: `A = [31, 41, 59, 26, 41, 58]`
4. Iteration 4: The fourth element `26` is less than `59`, so we shift `59` to the right. Then we shift `41` to the right. Finally, we insert `26` in the correct position: `A = [26, 31, 41, 59, 41, 58]`
5. Iteration 5: The fifth element `41` is less than `59`, so we shift `59` to the right. Then we insert `41` in the correct position: `A = [26, 31, 41, 41, 59, 58]`
6. Iteration 6: The sixth element `58` is less than `59`, so we shift `59` to the right. Then we insert `58` in the correct position: `A = [26, 31, 41, 41, 58, 59]`

#figure(cetz.canvas({
  import cetz.draw: *

  let cw = 0.75 // cell width  (canvas units = 1 cm each)
  let ch = 0.6 // cell height
  let rh = 1.0 // row pitch

  let sorted-fill = blue.lighten(70%)
  let key-fill = orange.lighten(45%)
  let unsorted-fill = luma(250)

  // Draw one row of cells; key-idx == -1 means no key is highlighted
  let draw-row(ri, vals, sorted-end, key-idx) = {
    let y = -ri * rh
    for (i, v) in vals.enumerate() {
      let fc = if i == key-idx { key-fill } else if i < sorted-end { sorted-fill } else { unsorted-fill }
      rect((i * cw, y), ((i + 1) * cw, y + ch), fill: fc, stroke: black + 0.5pt)
      content(((i + 0.5) * cw, y + ch / 2), [#v])
    }
  }

  // (label, array, sorted-end, key-idx-after-insertion)
  let rows = (
    ([Initial], (31, 41, 59, 26, 41, 58), 0, -1),
    ([$i=1$], (31, 41, 59, 26, 41, 58), 2, 1),
    ([$i=2$], (31, 41, 59, 26, 41, 58), 3, 2),
    ([$i=3$], (26, 31, 41, 59, 41, 58), 4, 0),
    ([$i=4$], (26, 31, 41, 41, 59, 58), 5, 3),
    ([$i=5$], (26, 31, 41, 41, 58, 59), 6, 4),
  )

  for (ri, row) in rows.enumerate() {
    let (lbl, vals, sorted-end, key-idx) = row
    draw-row(ri, vals, sorted-end, key-idx)
    content((-0.2, -ri * rh + ch / 2), lbl, anchor: "east")
  }

  // Legend
  let ly = -(rows.len()) * rh - 0.2
  rect((0, ly), (cw, ly + ch), fill: sorted-fill, stroke: black + 0.5pt)
  content((cw + 0.15, ly + ch / 2), [Sorted], anchor: "west")
  rect((2.8, ly), (2.8 + cw, ly + ch), fill: key-fill, stroke: black + 0.5pt)
  content((2.8 + cw + 0.15, ly + ch / 2), [Key just inserted], anchor: "west")
}))
]

#programming-problem(
  number: 1.2,
  difficulty: 1,
)[
  [w] Modify the pseudocode for insertion sort to sort the input array in non-decreasing order instead of non-increasing order.
]

#solution()[
==== Original pseudocode for insertion sort
#pseudocode-list(title: smallcaps[`INSERTIONSORT(A, n)`])[
  + *for* i = 1 to n-1
    + j = i
    + *while* j > 0 and A[j-1] > A[j]
      + *swap* A[j] and A[j-1]
      + j = j - 1
]

==== Modified pseudocode for insertion sort to sort in non-decreasing order
#pseudocode-list(title: smallcaps[`NONDECREASINGINSERTIONSORT(A, n)`])[
  + *for* i = 1 to n-1
    + j = i
    + *while* j > 0 and A[j-1] < A[j]
      + *swap* A[j] and A[j-1]
      + j = j - 1
]

]

#programming-problem(number: 1.3, difficulty: 1)[
[w] Show the execution of merge sort on the array `A = [3, 41, 52, 26, 38, 57, 9, 49]`
// use Cetz to draw the execution of merge sort on the given array.
#solution()[
  #figure(cetz.canvas({
    import cetz.draw: *

    let cw = 0.60 // cell width
    let ch = 0.52 // cell height
    let rh = 1.1 // row pitch

    // Row 0 is at the top (highest y), row 6 at the bottom
    let ry(r) = (6 - r) * rh

    // Center-x of a node: x0 is its left edge, n is element count
    let ncx(x0, n) = x0 + n * cw / 2

    // Draw array node starting at (x0, ry(r))
    let node(x0, r, vals, fc: white) = {
      let y = ry(r)
      for (i, v) in vals.enumerate() {
        rect((x0 + i * cw, y), (x0 + (i + 1) * cw, y + ch), fill: fc, stroke: black + 0.5pt)
        content((x0 + (i + 0.5) * cw, y + ch / 2), [#v])
      }
    }

    // Arrow from bottom-center of parent (row pr) to top-center of child (row cr)
    set-style(mark: (fill: gray.darken(30%), scale: 0.5, length: 0.18, width: 0.14))
    let arr(px, pr, cx-coord, cr) = {
      line((px, ry(pr)), (cx-coord, ry(cr) + ch), stroke: gray.darken(20%) + 0.45pt, mark: (end: ">"))
    }

    let sf = blue.lighten(72%) // split phase fill
    let mf = green.lighten(65%) // merge phase fill
    let bf = orange.lighten(58%) // base-case fill

    // ---------- NODES ----------

    node(0, 0, (3, 41, 52, 26, 38, 57, 9, 49), fc: sf)

    node(0, 1, (3, 41, 52, 26), fc: sf)
    node(4 * cw, 1, (38, 57, 9, 49), fc: sf)

    node(0, 2, (3, 41), fc: sf)
    node(2 * cw, 2, (52, 26), fc: sf)
    node(4 * cw, 2, (38, 57), fc: sf)
    node(6 * cw, 2, (9, 49), fc: sf)

    node(0 * cw, 3, (3,), fc: bf)
    node(1 * cw, 3, (41,), fc: bf)
    node(2 * cw, 3, (52,), fc: bf)
    node(3 * cw, 3, (26,), fc: bf)
    node(4 * cw, 3, (38,), fc: bf)
    node(5 * cw, 3, (57,), fc: bf)
    node(6 * cw, 3, (9,), fc: bf)
    node(7 * cw, 3, (49,), fc: bf)

    node(0, 4, (3, 41), fc: mf)
    node(2 * cw, 4, (26, 52), fc: mf)
    node(4 * cw, 4, (38, 57), fc: mf)
    node(6 * cw, 4, (9, 49), fc: mf)

    node(0, 5, (3, 26, 41, 52), fc: mf)
    node(4 * cw, 5, (9, 38, 49, 57), fc: mf)

    node(0, 6, (3, 9, 26, 38, 41, 49, 52, 57), fc: mf)

    // ---------- ARROWS: split phase (rows 0 → 3) ----------

    arr(ncx(0, 8), 0, ncx(0, 4), 1)
    arr(ncx(0, 8), 0, ncx(4 * cw, 4), 1)

    arr(ncx(0, 4), 1, ncx(0, 2), 2)
    arr(ncx(0, 4), 1, ncx(2 * cw, 2), 2)
    arr(ncx(4 * cw, 4), 1, ncx(4 * cw, 2), 2)
    arr(ncx(4 * cw, 4), 1, ncx(6 * cw, 2), 2)

    arr(ncx(0, 2), 2, ncx(0 * cw, 1), 3)
    arr(ncx(0, 2), 2, ncx(1 * cw, 1), 3)
    arr(ncx(2 * cw, 2), 2, ncx(2 * cw, 1), 3)
    arr(ncx(2 * cw, 2), 2, ncx(3 * cw, 1), 3)
    arr(ncx(4 * cw, 2), 2, ncx(4 * cw, 1), 3)
    arr(ncx(4 * cw, 2), 2, ncx(5 * cw, 1), 3)
    arr(ncx(6 * cw, 2), 2, ncx(6 * cw, 1), 3)
    arr(ncx(6 * cw, 2), 2, ncx(7 * cw, 1), 3)

    // ---------- ARROWS: merge phase (rows 3 → 6) ----------

    arr(ncx(0 * cw, 1), 3, ncx(0, 2), 4)
    arr(ncx(1 * cw, 1), 3, ncx(0, 2), 4)
    arr(ncx(2 * cw, 1), 3, ncx(2 * cw, 2), 4)
    arr(ncx(3 * cw, 1), 3, ncx(2 * cw, 2), 4)
    arr(ncx(4 * cw, 1), 3, ncx(4 * cw, 2), 4)
    arr(ncx(5 * cw, 1), 3, ncx(4 * cw, 2), 4)
    arr(ncx(6 * cw, 1), 3, ncx(6 * cw, 2), 4)
    arr(ncx(7 * cw, 1), 3, ncx(6 * cw, 2), 4)

    arr(ncx(0, 2), 4, ncx(0, 4), 5)
    arr(ncx(2 * cw, 2), 4, ncx(0, 4), 5)
    arr(ncx(4 * cw, 2), 4, ncx(4 * cw, 4), 5)
    arr(ncx(6 * cw, 2), 4, ncx(4 * cw, 4), 5)

    arr(ncx(0, 4), 5, ncx(0, 8), 6)
    arr(ncx(4 * cw, 4), 5, ncx(0, 8), 6)

    // ---------- SIDE LABELS & DIVIDER ----------

    let lx = -0.45
    content((lx, ry(1) + ch / 2), text(size: 0.72em)[*Split*], anchor: "east")
    content((lx, ry(3) + ch / 2), text(size: 0.72em)[*Base*], anchor: "east")
    content((lx, ry(5) + ch / 2), text(size: 0.72em)[*Merge*], anchor: "east")

    // Dashed separator between split and merge phases
    let sep = (ry(3) + ry(4) + ch) / 2
    line((-0.1, sep), (8 * cw + 0.1, sep), stroke: (paint: gray, dash: "dashed", thickness: 0.5pt))
  }))
]
]

#programming-problem(
  number: 1.4,
  difficulty: 1,
)[
Convince yourself that insertion sort may be expressed recursively as follows: to sort `A[0, n− 1]` we recursively sort `A[0, n−2]` and then insert `A[n−1]` into to the sorted array `A[0, n− 2]`. Write a recurrence for the running time and then find a solution.
]

#solution()[
  Let $T(n)$ be the running time. Then we have the following recurrence:
  $
    T(n) = cases(T(n-1) + n quad &\,"for" n > 1, d quad &\,"for" n = 1)
  $

  We can solve this recurrence by unrolling it:
  $
    T(n) &= T(n-1) + n \
         &= (T(n-2) + (n-1)) + n \
         &= ((T(n-3) + (n-2)) + (n-1)) + n \
         &quad quad quad quad quad quad quad dots.v \
         &= sum_(i=1)^n i + T(1) \
         &= sum_(i=1)^n i + d \
         &= frac(n(n+1), 2) + d \
         &= O(n^2)
  $

]

#programming-problem(
  number: 1.5,
  difficulty: 1,
)[
  A friend suggest that you should use binary search to speed up the insertion step in insertion sort. Will this work and if so, how will it affect the running time of the algorithm?
]

#solution(
  )[
  Specifically the comparitive part of the insertion step can be sped up by using binary search to find the correct position for the current element, as the worst case preformance of $ceil(log_2 n)$ comparisons to find the correct position for the current element. but the algorithm as a whole would still have a worst case running time of $O(n^2)$, as the shifting of the elements to make room for the current element would still require $O(n)$ time in the worst case, and this shifting would need to be done for each of the $n$ elements in the array.
]

]

== Exercise 2: Duplicates and Close Neighbours

#programming-problem(number: 2)[
Let `A[0..n-1]` be an array of integers. Solve the following exercises.
]

#programming-problem(
  number: 2.1,
)[ [w] A duplicate in $A$ is a pair of entries $i$ and $j$ such that `A[i] = A[j]`. Give an algorithm that determines if there is a duplicate in $A$ in $O(n^2)$ time. ]

#solution[
This is simple enough and works out to iterating through the array with a double loop and comparing each element with every other element. If any case of $A[I] = A[J]$ occurs we know whatever value of $A[I]$ has a duplicate and we can return true. If we finish iterating through the array without finding any duplicates we can return false. The pseudocode for this algorithm is as follows:
#pseudocode-list(title: smallcaps[`HASDUPLICATE(A, n)`])[
  + *for* i = 1 to n - 1
    + *for* j = 1 to n - 1
      + *if* A[i] == A[j]
        + *return* true
      + *end* *if*
    + *end for*
  + *end for*
  + *return* false
]
]

#programming-problem(
  number: 2.2,
)[Give an algorithm that determines if there is a duplicate in `A` in $O(n log n) $ time. _Hint_: use merge sort.
]

#solution[
To determine if there is a duplicate in `A` in $O(n log n)$ time, we can first sort the array using merge sort, which has a time complexity of $O(n log n)$. After sorting the array, we can iterate through it once and check if any right-side neighbor is the same as the current element. If we find any such pair, we can return true.
#pseudocode-list(title: smallcaps[`HASDUPLICATESORT(A, n)`])[
+ #smallcaps(`MERGESORT(A)`)
+ *for* i = 1 to n - 1
  + *if* A[i] == A[i - 1]
    + *return* true
  + *end* *if*
+ *end for*
+ *return* false
]
]

#programming-problem(
  number: 2.3,
)[_A closest pair_ in $A$ is a pair of entries $i$ and $j$ such that $abs(A[i] - A[j])$ is minimal among all the pairs of entries. Give an algorithm that finds a closest pair in $A$ in $O(n log n)$ time.
]

#solution[
To find a closest pair in `A` in $O(n log n)$ time, we can first sort the array using merge sort, which has a time complexity of $O(n log n)$. After sorting the array, we can iterate through it once and compute the absolute difference between each right-side neighbor and the current element.

#pseudocode-list(title: smallcaps[`CLOSESTPAIR(A, n)`])[
+ #smallcaps(`MERGESORT(A)`)
+ *let* closest_pair = (A[0], A[1])
+ *let* min_diff = abs(A[1] - A[0])
+ *for* i = 2 to n - 1
  + *let* diff = abs(A[i] - A[i - 1])
  + *if* diff < min_diff
    + *let* min_diff = diff
    + *let* closest_pair = (A[i - 1], A[i])
  + *end* *if*
+ *end for*
+ *return* closest_pair
]
]

== Stones

#programming-problem(
  number: 3,
)[
  [$dagger$] Josefine likes to go to the beach and collect stones. Josefine likes to bring home as many stones as possible, but she can only carry $W$ kilograms of stones. Give an algorithm that, given a list of the weights of $N$ stones and the maximum weight $W$, determines the maximal number of stones she can bring home that day.
]

#solution[
```c
  #include <stdio.h>
  #include <stdlib.h>

  int compare(const void *a, const void *b) { return (*(int *)a - *(int *)b); }

  int main() {
    int maxWeight = 10;
    int stones[] = {5, 2, 4, 1, 2, 7, 10};

    int curr = 0;
    int count = 0;

    int length = sizeof(stones) / sizeof(stones[0]);

    qsort(&stones, length, sizeof(int), compare);

    for (int i = 0; i < length - 1; i++) {
      if (curr >= maxWeight)
        break;

      if ((curr + stones[i]) > maxWeight)
        break;

      curr += stones[i];
      count++;
    }

    printf("maxWeight: %d\ncount: %d\ncurrent weight: %d\nstones weights: ",
           maxWeight, count, curr);

    return 0;
  }
  ```
]

== Correctness of Merge Sort

#programming-problem(
  number: 4,
)[
  Show that merge sort sorts all arrays correctly. You can assume that merge correclty merges sorted arrays. _Hint_: use induction.
]

#solution[
  To show that merge sort sorts all arrays correctly, we can use mathematical induction on the size of the input array.

  Base case: For an array of size $1$, merge sort trivially sorts the array correctly, as a single element is already sorted.

  Induction hypothesis: Assume that merge sort correctly sorts all arrays of size less than or equal to $k$, for some integer $k >= 1$.

  Induction step: Consider an array of size $k + 1$. Merge sort divides the array into two halves, each of size at most $k$. By the induction hypothesis, merge sort correctly sorts both halves. Then, merge sort merges the two sorted halves together using the merge procedure, which we assume correctly merges sorted arrays. Therefore, the resulting array is also sorted.

  By the principle of mathematical induction, merge sort correctly sorts all arrays of size $n$ for all $n >= 1$.

]

== 2Sum and 3Sum

#programming-problem(
  number: 5,
)[
Let `A[0..n-1]` be an array of integers (positive and negative). The array has a 2-sumif there exists two entries $i$ and $j$ such that $A[i] + A[j] = 0$. Similarly, $A$ has a 3-sum if htere exists three entries $i,j$ and $k$ such that $A[i] + A[j] + A[k] = 0$. Solve the following exercises.
]

#programming-problem(number: 5.1)[
  [w] Give a simple algorithm that determines if $A$ has a 2-sum in $O(n^2)$ time.
]

#solution[
To determine if $A$ has a 2-sum in $O(n^2)$ time, we can use a double loop to iterate through all pairs of entries in the array and check if their sum is equal to zero. The pseudocode for this algorithm is as follows:
#pseudocode-list(title: smallcaps[`HAS2SUM(A, n)`])[
  + *for* i = 0 to n - 1
    + *for* j = i + 1 to n - 1
      + *if* A[i] + A[j] == 0
        + *return* true
      + *end* *if*
    + *end for*
  + *end for*
  + *return* false
]
]

#programming-problem(number: 5.2)[
  Give an algorithm that determines if $A$ has a 2-sum in $O(n log n)$ time. _Hint_: use binary search.
]

#solution[]

#programming-problem(number: 5.3)[
  [w] Give an algorithm that determine sif $A$ has a 3-sum in $O(n^3)$ time.
]

#solution[]

#programming-problem(number: 5.4)[
  Give an algorithm that determines if $A$ has a 3-sum in $O(n^2 log n)$ time. _Hint_: use binary search.
]

#solution[]

#programming-problem(number: 5.4)[
  [\*\*] Give an algorithm that determines if $A$ has a 3-sum in $O(n^2)$ time.
]

#solution[]

== Selection, Partition, and Quick Sort

#programming-problem(
  number: 6,
)[
Let `A[0..n-1]` be an array of distinct integers. The integers with rank $k$ in $A$ is the kth integer among the integers in $A$. The median of $A$ is the integer in $A$ with rank $floor(frac((n-1), 2, style: "horizontal"))$. Solve the following exercises.
]

#programming-problem(number: 6.1)[
  Give an algorithm that given a $k$ finds the integer with rank $k$ in $A$ in $O(n log n)$ time.
]

#solution[]

A _partition_ of $A$ is a separation of $A$ into two arrays $A_"low"$ and $A_"high"$ such that $A_"low"$ contains all integers from $A$ that are smaller than or equal to the median of $A$ and $A_"high"$ contains all the integers from $A$ that are larger than the median of $A$.

#programming-problem(number: 6.2)[
  Give an algorithm to compute a partition of $A$ in $O(n)$ time.
]

#solution[]

#programming-problem(number: 6.3)[
  [\*] Give an algorithm to sort $A$ in $O(n log n) $ time using recursive partition.
]

#solution[]

#programming-problem(number: 6.4)[
  [\*\*] Give an algorithm that given a $k$ finds the integer with rank $k$ in $A$ in $O(n)$ time.
]

#solution[]

= Lecture notes

== Analysis of Algorithms
=== Analysis of algorithms

The goal of algorithm analysis is to determine and predict computational resources (such as time and space) and the correctness of algorithms.

- Does my route-finding algorithm work?
- How quickly can I answer a query for a route?
- Can it scale?
- Will it run out of memory?
- How many cache misses will it have?

Primary focus for the course is:
- correctness, running time, and space usage of algorithms.

==== Running time
Running time is the *number* of steps an algorithm performs on an input size $n$.

- worst-case running time: the maximum number of steps an algorithm takes on any input of size $n$.
- best-case running time: the minimum number of steps an algorithm takes on any input of size $n$.
- average-case running time: the expected number of steps an algorithm takes on a random input of size $n$.

===== Terminology
/ time: The worst-case running time (unless otherwise specified)
/ amortized time: the average running time per operation over a sequence of operations, even if a single operation might be expensive.
/ Randomised:
/ deterministic:
/ non-deterministic:

==== Space
Space is the number of memory cells an algorithm uses on an input size $n$.

/ Memory cells:
- variable and data structure storage
  - call stack for function calls

=== Asymptotic notation
Notation to *bound* the *asymptotic* growth of functions.

==== $O$-, $Theta$-, and $Omega$-notation

#definition(
  title: [$O$-notation],
)[
  $f(n) = O(g(n))$ if there exist constants $c, n_0 > 0$ such that $f(n) <= c g(n)$ for all $n >= n_0$.

  #figure(
    cetz.canvas(
      {
        import cetz.draw: *
        import cetz-plot: *
        plot.plot(
          size: (6, 4.5),
          axis-style: "school-book",
          x-label: [$n$],
          y-label: none,
          x-min: 0,
          x-max: 6,
          y-min: 0,
          y-max: 36,
          x-tick-step: none,
          y-tick-step: none,
          x-ticks: ((4, [$n_0$]),),
          y-ticks: (),
          {
            plot.add(domain: (0.01, 6), samples: 80, style: (stroke: blue + 1.5pt), label: [$c dot g(n) = n^2$], n => n * n)
            plot.add(
              domain: (0.01, 6),
              samples: 80,
              style: (stroke: red + 1.5pt),
              label: [$f(n) = 2n^(1.5)$],
              n => 2 * calc.pow(n, 1.5),
            )
            plot.add-fill-between(
              domain: (4, 6),
              samples: 60,
              style: (fill: blue.lighten(80%), stroke: none),
              n => 2 * calc.pow(n, 1.5),
              n => n * n,
            )
            plot.add-vline(4, style: (stroke: (paint: gray, dash: "dotted", thickness: 1pt)))
          },
        )
      },
    ),
  )
]

#example(
  )[
  $f(n) = O(n^2)$ if $f(n) <= c n^2$ for large $n$.

  - $5n^2 = O(n^2)$: $5n^2 <= 5 n^2$ for all $n$.
  - $5n^2 + 3 = O(n^2)$: Yes, as $5n^2 + 3 <= 6 n^2$ for all $n >= 1$.
  - $5n^2 + 3n = O(n^2)$: Yes, as $5n^2 + 3n <= 6 n^2$ for all $n >= 1$.
  - $5n^2 + 3n^2 = O(n^2)$: Yes, as $5n^2 + 3n^2 <= 8 n^2$ for all $n >= 1$.
  - $5n^3 = O(n^2)$? No, as $5n^3 <= c n^2$ implies $5n <= c$ for all $n$, which cannot hold for any constant $c$.

  Takeaway: there is no constant $c$ that will always be larger than a sufficiently large $n$ times a linear function, but there is a constant $c$ that will always be larger than a sufficiently large $n$ times a quadratic function.
]

- $O(g(n))$ is a *set* of functions.
- Think of $=$ as $in$ or $subset.eq$.
- $f(n) = O(n^2)$ means $f(n)$ is an element of the set of functions that grow at most as fast as $n^2$.

#definition(
  title: [$Omega$-notation],
)[
  $f(n) = Omega(g(n))$ if there exist constants $c, n_0 > 0$ such that $f(n) >= c g(n)$ for all $n >= n_0$.

  #figure(cetz.canvas({
    import cetz.draw: *
    import cetz-plot: *
    plot.plot(
      size: (6, 4.5),
      axis-style: "school-book",
      x-label: [$n$],
      y-label: none,
      x-min: 0,
      x-max: 6,
      y-min: 0,
      y-max: 36,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: ((1, [$n_0$]),),
      y-ticks: (),
      {
        plot.add(domain: (0.01, 6), samples: 80, style: (stroke: red + 1.5pt), label: [$f(n) = n^2$], n => n * n)
        plot.add(
          domain: (0.01, 6),
          samples: 80,
          style: (stroke: blue + 1.5pt),
          label: [$c dot g(n) = 0.25 n^(1.5)$],
          n => 0.25 * calc.pow(n, 1.5),
        )
        plot.add-fill-between(
          domain: (1, 6),
          samples: 60,
          style: (fill: red.lighten(82%), stroke: none),
          n => 0.25 * calc.pow(n, 1.5),
          n => n * n,
        )
        plot.add-vline(1, style: (stroke: (paint: gray, dash: "dotted", thickness: 1pt)))
      },
    )
  }))
]

#definition(
  title: [$Theta$-notation],
)[
  $f(n) = Theta(g(n))$ if $f(n) = O(g(n))$ and $f(n) = Omega(g(n))$, i.e. there exist constants $c_1, c_2, n_0 > 0$ such that $c_1 g(n) <= f(n) <= c_2 g(n)$ for all $n >= n_0$.

  #figure(
    cetz.canvas(
      {
        import cetz.draw: *
        import cetz-plot: *
        plot.plot(
          size: (6, 4.5),
          axis-style: "school-book",
          x-label: [$n$],
          y-label: none,
          x-min: 0,
          x-max: 5,
          y-min: 0,
          y-max: 55,
          x-tick-step: none,
          y-tick-step: none,
          x-ticks: ((1, [$n_0$]),),
          y-ticks: (),
          {
            plot.add(domain: (0.01, 5), samples: 80, style: (stroke: blue + 1.5pt), label: [$c_2 dot g(n) = 2n^2$], n => 2 * n * n)
            plot.add(domain: (0.01, 5), samples: 80, style: (stroke: red + 2pt), label: [$f(n) = n^2 + n$], n => n * n + n)
            plot.add(
              domain: (0.01, 5),
              samples: 80,
              style: (stroke: green.darken(10%) + 1.5pt),
              label: [$c_1 dot g(n) = n^2$],
              n => n * n,
            )
            plot.add-fill-between(domain: (1, 5), samples: 60, style: (fill: red.lighten(84%), stroke: none), n => n * n, n => 2 * n * n)
            plot.add-vline(1, style: (stroke: (paint: gray, dash: "dotted", thickness: 1pt)))
          },
        )
      },
    ),
  )
]

==== Basic properties

#proposition()[
  Any polynomial grows proportional to its leading term:
  $
    a_0 + a_1 n + a_2 n^2 + ... + a_d n^d = Theta(n^d)
  $
]

#proposition()[
  All logarithms are asymptotically equivalent:
  $
    log_a (n) = frac(log_b n, log_b a) = Theta(log_c n) quad forall a, b, c > 1
  $
]

#proposition()[
  Logarithms grow slower than any polynomial:
  $
    log(n) = O(n^c) quad "for all" c > 0
  $
]

#proposition()[
  Polynomials grow slower than exponentials:
  $
    n^c = O(a^n) quad "for all" a > 1, c > 0
  $
]

=== Experimental analysis of algorithms
- Challenge:
can we experimentally estimate the theoretical running time

- Doubling technique:
  - run the algorithm on inputs of size $n$ and $2n$ and compare the running times.
  - if the running time increases by a factor of $k$, then we can estimate that the running time is $O(n^c)$ where $c = log_2(k)$.

#example(title: [])[
  Input size x 2 and time x 4:

  $
    => "Algorithm is quadratic, as 4 = 2^2" \
    T(n) = c n^2 \
    T(2n) = c (2n)^2 = c 2^2 n^2 = 4 c n^2 \
    T(2n)/T(n) = 4
  $
]
