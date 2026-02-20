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
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring",
)

// • [w] A warmup exercise. These should be easy if you have understood the material for the week.
// • [∗] and [∗∗] A difficult and a very difficult exercise, respectively . These exercises usually require clever and creative insights to solve. Work on these after you have solved the other exercises.
// • [†] An exercise that involves programming.

== Exercise 1: Run by Hand and Properties

#programming-problem(number: 1.1, difficulty: 1)[
[w] Show the execution of insertion sort on the array: `A = [31, 41, 59, 26, 41, 58]`
]

#solution()[
  
  Insertion sort iterates through the array and at each iteration it inserts the current element into the correct position in the sorted subarray to the left of the current element.
  
  for the given array that turns out as follows:
  
  1. Iteration 1: The first element `31` is already in the correct position, so the array remains unchanged: `A = [31, 41, 59, 26, 41, 58]`
  2. Iteration 2: The second element `41` is greater than `31`, so it is already in the correct position: `A = [31, 41, 59, 26, 41, 58]`
  3. Iteration 3: The third element `59` is greater than `41`, so it is already in the correct position: `A = [31, 41, 59, 26, 41, 58]`
  4. Iteration 4: The fourth element `26` is less than `59`, so we shift `59` to the right. Then we shift `41` to the right. Finally, we insert `26` in the correct position: `A = [26, 31, 41, 59, 41, 58]`
  5. Iteration 5: The fifth element `41` is less than `59`, so we shift `59` to the right. Then we insert `41` in the correct position: `A = [26, 31, 41, 41, 59, 58]`
  6. Iteration 6: The sixth element `58` is less than `59`, so we shift `59` to the right. Then we insert `58` in the correct position: `A = [26, 31, 41, 41, 58, 59]`
  

]


#programming-problem(
  number: 1.2,
  difficulty: 1,
)[
  [w] Modify the pseudocode for insertion sort to sort the input array in non-decreasing order instead of non-increasing order.
]

#solution()[

  We have the original:

#pseudocode-list(title: smallcaps[`INSERTIONSORT(A, n)`])[
    + *for* i = 1 to n-1
      + j = i
      + *while* j > 0 and A[j-1] > A[j]
        + *swap* A[j] og A[j-1]
        + j = j - 1
  ]

  And the pseudocode rewritten in a non-decreasing order:

#pseudocode-list(title: smallcaps[`NON-DECREASING-ORDER INSERTIONSORT(A, n)`])[
    + *for* i = 1 to n-1
      + j = i
      + *while* j > 0 and A[j-1] < A[j]
        + *swap* A[j] og A[j-1]
        + j = j - 1
  ]
  
]

#programming-problem(
  number: 1.3,
  difficulty: 1
)[
  [w] Show the execution of merge sort on the array `A = [3, 41, 52, 26, 38, 57, 9, 49]`

]

#solution()[
  #figure(rotate(-90deg, image("merge_sort.jpg", width: 50%)), caption: [Merge sort])
]

#programming-problem(
  number: 1.4,
  difficulty: 1
)[
  Convince yourself that insertion sort may be expressed recursively as follows: to sort `A[0, n− 1]` we recursively sort `A[0, n−2]` and then insert `A[n−1]` into to the sorted array `A[0, n− 2]`. Write a recurrence for the running time and then find a solution.
]

#solution()[
  $
  T(n) &= cases( T(n-1) + n &quad "if" n > 1, 1 &quad "if" n = 1 ) \ \
  T(n) &= T(n-1) + n  \ 
  &= T(n-2) + (n-1) + n   \ 
  &= T(n-3) + (n-2) + (n-1) + n    \ 
  &quad dots.v \ 
  &= sum^n_(i=1) i     \ 
  &quad dots.v \ 
  &= T(1) + sum^n_(i=2) i  \ 
  &= 1 + sum^n_(i=2) i \
  &= O(n^2)
  $



]

#programming-problem(
  number: 1.5,
  difficulty: 1
)[
  A friend suggest that you should use binary search to speed up the insertion step in insertion sort. Will this work and if so, how will it affect the running time of the algorithm?
]

#solution()[
  This would work, since insertion sort keeps a sorted subarray, we can quickly traverse that sorted subarray using binary search and insert. Thus the comparison part of insertion sort would go from linear to $log n$ due to the nature of binary search. Worst case "binary insertion sort" would still have a runtime of 

  $
O(ceil(log_2 n))
  $
]



== Exercise 2: Duplicates and Close Neighbours

#programming-problem(number: 2)[
  Let `A[0..n-1]` be an array of integers. Solve the following exercises.
]



#programming-problem(number: 2.1)[ [w] A duplicate in $A$ is a pair of entries $i$ and $j$ such that `A[i] = A[j]`. Give an algorithm that determines if there is a duplicate in $A$ in $O(n^2)$ time.
]


#solution[
  To determine if there is a pair in $A$ we use a double nested for loop iterating and checking if `A[i] == A[j]`. 

  #pseudocode-list(title: smallcaps[PAIRS $O(n^2)$])[
  + *function* hasDuplicate(A, n)  
    + *for* i = 1 to n - 1 
      + *for* j = 1 to n - 1 
        + *if* A[i] == A[j] 
          + *return* true
        + *end* *if*
      + *end for* 
    + *end for*
    + *return false* 
  + *end function*
  ]
]

#programming-problem(number: 2.2)[Give an algorithm that determines if there is a duplicate in `A` in $O(n log n) $ time. _Hint_: use merge sort.
]

#solution[
  To do this, we first sort the array, and then we can iterate through the array once, looking forward. If `A[i] == A[i+1]` then we return true. If no duplicate is found we return false. 

  #pseudocode-list(title: smallcaps[HASDUPLICATE(A, n)])[
    + #smallcaps[MERGESORT(A)]
    + *for* i = 1 to n -1 
      + *if* A[i] == A[i+1]
        + *return* true 
      + *end if* 
    + *end for*
    + *return* false
  ]

]

#programming-problem(number: 2.3)[_A closest pair_ in $A$ is a pair of entries $i$ and $j$ such that $abs(A[i] - A[j])$ is minimal among all the pairs of entries. Give an algorithm that finds a closest pair in $A$ in $O(n log n)$ time.
]

#solution[
  Using merge sort, we can sort the array in $log n$ time, and then iterate through the array. We keep a value `min` which keeps track.



  #pseudocode-list(title: smallcaps[HASDUPLICATE(A, n)])[
    + #smallcaps[MERGESORT(A)]
    + minDiff = *ABS*(A[i] - A[i+1]) 
    + closestPair = {A[i], A[i+1]}
    + *for* i = 1 to n -1 
      + diff = *ABS*(A[i] - A[i+1])
      + *if* minDiff > diff        
      + minDiff = diff
      + closestPair = {A[i], A[i+1]}
      + *end if* 
    + *end for*
    + *return* closestPair
  ]
]

== Stones 

#programming-problem(number: 3)[
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

  printf("maxWeight: %d\ncount: %d\ncurrent weight: %d", maxWeight, count,
         curr);

  return 0;
}
  ```
]

== Correctness of Merge Sort 

#programming-problem(number: 4)[
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

#programming-problem(number: 5)[
  Let `A[0..n-1]` be an array of integers (positive and negative). The array has a 2-sumif there exists two entries $i$ and $j$ such that $A[i] + A[j] = 0$. Similarly, $A$ has a 3-sum if htere exists three entries $i,j$ and $k$ such that $A[i] + A[j] + A[k] = 0$. Solve the following exercises. 
]


#programming-problem(number: 5.1)[
  [w] Give a simple algorithm that determines if $A$ has a 2-sum in $O(n^2)$ time. 
]

#solution[]


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

#programming-problem(number: 6)[
  Let `A[0..n-1]` be an array of distinct integers. The integers with rank $k$ in $A$ is the kth integer among the integers in $A$. The median of $A$ is the integer in $A$ with rank $floor(frac((n-1), 2, style: "horizontal" ) )$. Solve the following exercises. 
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



= Lecture

== Analysis of Algorithms

The goal of algorithm analysis is to determine the computational resources and correctness of an algorithm. 


=== Running time

For run time we look at best-case, worst-case and average running time over all input sizes of $n$

Primarily when talking about running time we typically mean the _worst case_ run time for a given algorithm.

=== Space

Similarly we're interested in the space complexity of an algorithm in algorithm analysis, space complexity is the amount of memory used by the algorithm. 

== Asymptotic notation
==== $O$-, $Theta$- and $Omega$-notation

#definition(title: "O notation")[

  $
  f(n) = O(g(n)) "if" f(n) <= c g(n) "for large" n 
  $
#figure(
cetz.canvas({
  import cetz.draw: *
  import cetz-plot: *

  plot.plot(
    size: (6, 4.5),
    axis-style: "school-book",
    x-label: [$n$],
    y-label: none,
    x-min: 0, x-max: 6,
    y-min: 0, y-max: 36,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((4, [$n_0$]),),
    y-ticks: (),
    {
      // c·g(n) = n²
      plot.add(
        domain: (0.01, 6), samples: 80,
        style: (stroke: blue + 1.5pt),
        label: [$c dot g(n) = n^2$],
        n => n * n,
      )
      // f(n) = 2n^1.5
      plot.add(
        domain: (0.01, 6), samples: 80,
        style: (stroke: red + 1.5pt),
        label: [$f(n) = 2n^(1.5)$],
        n => 2 * calc.pow(n, 1.5),
      )
      // shaded region where f(n) ≤ c·g(n)
      plot.add-fill-between(
        domain: (4, 6), samples: 60,
        style: (fill: blue.lighten(80%), stroke: none),
        n => 2 * calc.pow(n, 1.5),
        n => n * n,
      )
      plot.add-vline(4, style: (stroke: (paint: gray, dash: "dotted", thickness: 1pt)))
    }
  )
})
)
  We say that a function is O of $g(n)$ if we can find a constant $c$.

  #example(title: $f(n) = O(n^2) "if" f(n) <= c n^2 "for large" n  $)[

    - $5 n^2 = O(n^2)?$
      - $5 n^2 <= 5 n ^2 "for large" n $.
    - $5n^2 + 3 = O(n^2)?$ 
      - $5 n^2 + 3 <= 6 n^2 "for large" n$
    - $5n^2 + 3 n = O(n^2)?$
      - $5n^2 + 3n <= 6n^2 "for large" n$
    - $5n^2 + 3n^2 = O(n^2)?$
      - $5n^2 + 3n^2 = 8n^2 <= 8n^2 "for large" n$
    - $5n^3 = O(n^2)?$
      - $5n^3 >= c n^2 "for all constants" c "for large" n$.

    In fact any $n$ is valid for this function.

  ]

  $
  f (n) = O(g(n)) "if exists constants" c, n_0 > 0, "such that" forall n >= n_0, f(n) <= c g (n) 
  $


  Some key points about O notation:

  - $O(g(n))$ is a set of functions. 
  - We think of $=$ as $in$ or $subset.eq$. 
  - $f(n) = O(n^2)$ is correct notation, however $O(n^2) = f(n)$ is not. They are not equivalent.
]


#definition(title: [$Omega$-notation])[

  $
  f(n) &= Omega(g(n) ) "if" f(n) >= c g (n) "for large" n \
  f(n) &= Omega(g(n)) "if exists constants" c, n_0 > 0, "such that" forall n >= n_0, f(n) >= c g (n)
  $

#figure(
cetz.canvas({
  import cetz.draw: *
  import cetz-plot: *

  plot.plot(
    size: (6, 4.5),
    axis-style: "school-book",
    x-label: [$n$],
    y-label: none,
    x-min: 0, x-max: 6,
    y-min: 0, y-max: 36,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((1, [$n_0$]),),
    y-ticks: (),
    {
      // f(n) = n²
      plot.add(
        domain: (0.01, 6), samples: 80,
        style: (stroke: red + 1.5pt),
        label: [$f(n) = n^2$],
        n => n * n,
      )
      // c·g(n) = 0.25·n^1.5
      plot.add(
        domain: (0.01, 6), samples: 80,
        style: (stroke: blue + 1.5pt),
        label: [$c dot g(n) = 0.25 n^(1.5)$],
        n => 0.25 * calc.pow(n, 1.5),
      )
      // shaded region where f(n) ≥ c·g(n)
      plot.add-fill-between(
        domain: (1, 6), samples: 60,
        style: (fill: red.lighten(82%), stroke: none),
        n => 0.25 * calc.pow(n, 1.5),
        n => n * n,
      )
      plot.add-vline(1, style: (stroke: (paint: gray, dash: "dotted", thickness: 1pt)))
    }
  )
})
)

  Omega notation is the best case scenario

]

#definition(title: [$Theta$-notation])[
  $
  f(n) = Theta (g(n) ) "if" f(n) = O(g(n)) and f(n) = Omega(g(n)) 
  $

#figure(
cetz.canvas({
  import cetz.draw: *
  import cetz-plot: *

  plot.plot(
    size: (6, 4.5),
    axis-style: "school-book",
    x-label: [$n$],
    y-label: none,
    x-min: 0, x-max: 5,
    y-min: 0, y-max: 55,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((1, [$n_0$]),),
    y-ticks: (),
    {
      // c₂·g(n) = 2n² (upper bound)
      plot.add(
        domain: (0.01, 5), samples: 80,
        style: (stroke: blue + 1.5pt),
        label: [$c_2 dot g(n) = 2n^2$],
        n => 2 * n * n,
      )
      // f(n) = n² + n (sandwiched)
      plot.add(
        domain: (0.01, 5), samples: 80,
        style: (stroke: red + 2pt),
        label: [$f(n) = n^2 + n$],
        n => n * n + n,
      )
      // c₁·g(n) = n² (lower bound)
      plot.add(
        domain: (0.01, 5), samples: 80,
        style: (stroke: green.darken(10%) + 1.5pt),
        label: [$c_1 dot g(n) = n^2$],
        n => n * n,
      )
      // shaded sandwich region
      plot.add-fill-between(
        domain: (1, 5), samples: 60,
        style: (fill: red.lighten(84%), stroke: none),
        n => n * n,
        n => 2 * n * n,
      )
      plot.add-vline(1, style: (stroke: (paint: gray, dash: "dotted", thickness: 1pt)))
    }
  )
})
)
]

== Experimental analysis of algorithms

 

