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
  title: "Lecture - February 26, 2026",
  date: datetime(year: 2026, month: 2, day: 26),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

// • [w] A warmup exercise. These should be easy if you have understood the material for the week.
// • [∗] and [∗∗] A difficult and a very difficult exercise, respectively . These exercises usually require clever and creative insights to solve. Work on these after you have solved the other exercises.
// • [†] An exercise that involves programming.

#outline()

= Exercises
#programming-problem(
  number: 1,
  difficulty: [\[w\]],
)[
  ===== [w] Asymptotic Growth
  Arrange the following functions in increasing asymptotic order , i.e., if $f(n)$ precedes $g(n)$ then $f(n) = O(g(n))$.

  + $n log n$
  + $n^2$
  + $2^n$
  + $n^3$
  + $sqrt(n)$
  + $n$

  #solution(
    )[
    The correct order is:

    1. $sqrt(n)$
    2. $n$
    3. $n log n$
    4. $n^2$
    5. $n^3$
    6. $2^n$

    This is because:

    - $sqrt(n) = O(n)$
    - $n = O(n log n)$
    - $n log n = O(n^2)$
    - $n^2 = O(n^3)$
    - $n^3 = O(2^n)$

    it can furthermore be visualised as follows:
    #figure(
      cetz.canvas(
        {
          import cetz.draw: *
          import cetz-plot: *

          plot.plot(
            size: (7, 5),
            axis-style: "school-book",
            x-label: [$n$],
            y-label: none,
            x-min: 0,
            x-max: 50,
            y-min: 0,
            y-max: 1500,
            x-tick-step: none,
            y-tick-step: none,
            x-ticks: (),
            y-ticks: (),
            legend: "north-west",
            legend-style: (padding: 0.25, item: (spacing: 0.1)),
            {
              plot.add(domain: (0.01, 80), samples: 120, style: (stroke: purple + 1.4pt), label: [$sqrt(n)$], n => calc.sqrt(n))
              plot.add(domain: (0.01, 80), samples: 120, style: (stroke: blue + 1.4pt), label: [$n$], n => n)
              plot.add(
                domain: (0.01, 80),
                samples: 120,
                style: (stroke: teal + 1.4pt),
                label: [$n log n$],
                n => n * calc.log(n, base: 2),
              )
              plot.add(domain: (0.01, 80), samples: 120, style: (stroke: orange + 1.4pt), label: [$n^2$], n => n * n)
              plot.add(domain: (0.01, 80), samples: 120, style: (stroke: red + 1.4pt), label: [$n^3$], n => n * n * n)
              plot.add(
                domain: (0.01, 11),
                samples: 120,
                style: (stroke: (paint: black, thickness: 1.4pt)),
                label: [$2^n$],
                n => calc.pow(2, n),
              )
            },
          )
        },
      ),
      caption: [Growth rates of common complexity classes],
    )
  ]
]

#programming-problem(number: 2)[
  ==== $Theta$-notation
  Write the following expressions using $Theta$-notation:

  #grid(
    columns: (1fr, 1fr),
    gutter: 1.4em,
    $n^2 + n^3/2$,
    $8 log_2^7 n + 34 log_2 n + 1/1000 n$,
    $2^n + n^4$,
    $2^n dot 7 + 5 log_2^3 n$,
    $log_2 n + n sqrt(n)$,
    $n(n^2 - 18) log_2 n$,
    $n(n-6)$,
    $n log_2^4 n + n^2$,
    $4 sqrt(n)$,
    $n^3 log_2 n + sqrt(n) log_2 n$,
  )

  #solution()[
    #table(
      columns: (1fr, 1fr),
      align: horizon + center,
      $n^2 + n^3/2$,
      [$Theta (n^3)$],
      $2^n + n^4$,
      [$Theta (2^n)$],
      $log_2 n + n sqrt(n)$,
      [$Theta (n sqrt(n))$],
      $n(n-6)$,
      [$Theta(n^2)$],
      $4 sqrt(n)$,
      [$Theta(sqrt(n))$],
      $8 log_2^7 n + 34 log_2 n + 1/1000 n$,
      [$Theta(n)$],
      $2^n dot 7 + 5 log_2^3 n$,
      [$Theta(2^n)$],
      $n(n^2 - 18) log_2 n$,
      [$Theta(n^3 dot log_2 n)$],
      $n log_2^4 n + n^2$,
      [$Theta(n^2)$],
      $n^3 log_2 n + sqrt(n) log_2 n$,
      [$Theta(log_2 n dot n^3)$],
    )
  ]
]

#programming-problem(number: 3)[
  ==== Loopy Loops
  Analyze the running time of the following loops as a function of $n$ and express the result in $O$-notation.

  #grid(columns: (1fr, 1fr, 1fr), gutter: 1.4em, [
    #pseudocode-list[
      + *LOOP1($n$)*
      + $i = 1$
      + *while* $i <= n$ *do*
        + print "$*$"
        + $i = 2 dot i$
      + *end while*
    ]
  ], [
    #pseudocode-list[
      + *LOOP2($n$)*
      + $i = 1$
      + *while* $i <= n$ *do*
        + print "$*$"
        + $i = 5 dot i$
      + *end while*
    ]
  ], [
    #pseudocode-list[
      + *LOOP3($n$)*
      + *for* $i = 1$ *to* $n$ *do*
        + $j = 1$
        + *while* $j <= n$ *do*
          + print "$*$"
          + $j = 2 dot j$
        + *end while*
      + *end for*
    ]
  ])

  #solution()[
    #table(
      columns: (1fr, 1fr),
      align: horizon + center,
      [LOOP1($n$)],
      [$O(log n)$],
      [LOOP2($n$)],
      [$O(log n)$],
      [LOOP3($n$)],
      [$O(n log n)$],
    )
  ]
]

#programming-problem(number: 4)[
  ==== Asymptotic Statements
  Which of the following statements are true?

  #grid(
    columns: (1fr, 1fr),
    gutter: 1.4em,
    $1/20 n^2 + 100n^3 = O(n^2)$,
    $n^3/1000 + n + 100 = Omega(n^2)$,
    $log_2 n + n = O(n)$,
    $2^n + n^2 = Omega(n)$,
    $2^(log_2 n) = O(n)$,
    $log_4 n + log_16 n = Theta(log n)$,
    $n^3(n-1)/5 = Theta(n^3)$,
    $n^(1/4) + n^2 = Theta(n)$,
    $log_2^2 n + n = Theta(n)$,
    $2^(log_4 n) = Theta(sqrt(n))$,
  )

  #solution()[
    #table(
      columns: (1fr, 1fr),
      align: horizon + center,
      $1/20 n^2 + 100n^3 = O(n^2)$,
      [False],
      $n^3/1000 + n + 100 = Omega(n^2)$,
      [True],
      $log_2 n + n = O(n)$,
      [True],
      $2^n + n^2 = Omega(n)$,
      [True],
      $2^(log_2 n) = O(n)$,
      [True],
      $log_4 n + log_16 n = Theta(log n)$,
      [True],
      $n^3(n-1)/5 = Theta(n^3)$,
      [False],
      $n^(1/4) + n^2 = Theta(n)$,
      [False],
      $log_2^2 n + n = Theta(n)$,
      [True],
      $2^(log_4 n) = Theta(sqrt(n))$,
      [True],
    )
  ]
]

#programming-problem(
  number: 5,
)[
  ==== Doubling Hypothesis

  #programming-problem(
    number: 5.1,
    difficulty: [\[w\]],
  )[
    Algorithm $A$ runs in exactly $7n^3$ time on an input of size $n$. How much slower does it run if the input size is doubled?

    #solution()[
      it would run
      $
        7(2n)^3 = 7 dot 8 n^3 = 8 dot T(n)
      $

      therefore it would run 8 times slower if the input size is doubled.
    ]
  ]

  #programming-problem(
    number: 5.2,
  )[
    Algorithm $B$ runs in time respectively $5, 20, 45, 80$ and $125$ seconds on input of sizes $1000, 2000, 3000, 4000$ and $5000$. Give an estimate of the running time of $B$ on an input of size $6000$. Express the (estimated) running time of $B$ using $O$-notation as a function of the input size $n$.

    #solution(
      )[
      observing the grow time it seems for every 1000 increase in the input size the running time increases by $15, 25, 35$ and $45$ seconds respectively. This suggests that the running time of $B$ grows quadratically with the input size, therefore we can estimate the running time of $B$ on an input of size $6000$ to be around 180 seconds

      $
        T(6000) = T(5000) + 55 = 125 + 55 = 180
      $

      expressing this using $O$-notation as a function of the input size $n$ we can see that the running time of $B$ grows quadratically with the input size, therefore we can express it as $O(n^2)$
    ]
  ]

  #programming-problem(
    number: 5.3,
  )[
    Algorithm $C$ runs $3$ seconds slower each time the size of the input is doubled. Express the running time of $C$ using $O$-notation as a function of the input size $n$.

    #solution(
      )[
      if the running time of $C$ increases by a constant amount each time the input size is doubled, then the running time of $C$ grows logarithmically with the input size. Therefore, we can express the running time of $C$ using $O$-notation as $O(log n)$.
    ]
  ]
]

#programming-problem(
  number: 6,
)[
  ==== Asymptotic Properties

  #programming-problem(
    number: 6.1,
  )[
    Let $f(n)$ and $g(n)$ be asymptotically non-negative. Show that $max(f(n), g(n)) = Theta(f(n) + g(n))$.

    #solution(
      )[
      For the upper bound, we have that $max(f(n), g(n)) <= f(n) + g(n)$, since the maximum of two non-negative functions is always less than or equal to their sum. Therefore, $max(f(n), g(n)) = O(f(n) + g(n))$. which gives us $c_2 = 1$

      for the lower bound, we have that $max(f(n), g(n)) >= (f(n) + g(n))/2$, since the maximum of two non-negative functions is always greater than or equal to their average. Therefore, $max(f(n), g(n)) = Omega(f(n) + g(n))$. which gives us $c_1 = 1/2$

      Since $f(n)$ and $g(n)$ are asymptotically non-negative, we have:
      $
        1/2 (f(n) + g(n)) <= max(f(n), g(n)) <= f(n) + g(n)
      $
      with constants $c_1 = 1/2$ and $c_2 = 1$, therefore $max(f(n), g(n)) = Theta(f(n) + g(n))$.

    ]
  ]

  #programming-problem(
    number: 6.2,
  )[
    Explain why the statement "the running time of algorithm $A$ is at least $O(n^2)$" does not make sense.

    #solution(
      )[
      Big O-notation is used to describe an upper bound, calling the upper bound "at least" would be mixing upper and lower bounds, which is not correct. The correct way to express a lower bound would be to say "the running time of algorithm $A$ is at least $Omega(n^2)$" or "the running time of algorithm $A$ is $Omega(n^2)$".
    ]
  ]

  #programming-problem(number: 6.3)[
    Is $2^(n+1) = O(2^n)$? Is $2^(2n) = O(2^n)$?

    #solution()[
      We can use exponent rules to simplify the expressions and determine their asymptotic growth:
      $
        2^(n+1) &= 2^(n) 2^1 = O(2^(n)) \
        2^(2n)  &= (2^n)^2 = O(4^n) != O(2^(n))
      $
      
      Therefore, $2^(n+1) = O(2^n)$ is true, while $2^(2n) = O(2^n)$ is false, instead we have $2^(2n) = O((2^n)^2) = O(4^n)$.

    ]
  ]

  #programming-problem(number: 6.4)[
    Show that $log_2(n!) = O(n log n)$.

    #solution()[
     $
       n! = 1 dot 2 dot 3 dot 4 dot dots dot n <= n^n \
       log_ 2(n!) <= log_2(n^n) = n log_2 n \
     $ 
     
      Therefore, $log_2(n!) = O(n log n)$, as there exists a constant $c$ such that $log_2(n!) <= c n log n$ for sufficiently large $n$, in this case we can choose $c = 1$.
     
    ]
  ]

  #programming-problem(
    number: 6.5,
    difficulty: [\[∗\]],
  )[
    Show that $log_2(n!) = Omega(n log n)$. Combine with exercise 6.4 to conclude that $log_2(n!) = Theta(n log n)$.

    #solution()[
    ]
  ]
]

#programming-problem(
  number: 7,
)[
  ==== Generalized Merge Sort
  Professor M. Erge suggests the following variant of merge sort called 3-merge sort. 3-merge sort works exactly like normal merge sort except one splits the array into 3 parts instead of 2 that are then recursively sorted and merged.

  #programming-problem(number: 7.1)[
    Show it is possible to merge 3 sorted arrays in linear time.

    #solution()[
    ]
  ]

  #programming-problem(number: 7.2)[
    Analyze the running time of 3-merge sort.

    #solution()[
    ]
  ]

  #programming-problem(
    number: 7.3,
    difficulty: [\[∗\]],
  )[
    Generalize the algorithm and the analysis of 3-merge sort to $k$-merge sort for $k > 3$. Is $k$-merge sort an improvement over the standard 2-merge sort?

    #solution()[
    ]
  ]
]

#programming-problem(
  number: 8,
)[
  ==== Maximal Subarray
  Let $A[0..n-1]$ be an array of integers (both positive and negative). A _maximal subarray_ of $A$ is a subarray $A[i..j]$ such that the sum $A[i] + A[i+1] + dots + A[j]$ is maximal among all subarrays of $A$.

  #programming-problem(number: 8.1, difficulty: [\[w\]])[
    Give an algorithm that finds a maximal subarray of $A$ in $O(n^3)$ time.

    #solution()[
    ]
  ]

  #programming-problem(
    number: 8.2,
    difficulty: [\[†\]],
  )[
    Give an algorithm that finds a maximal subarray of $A$ in $O(n^2)$ time. _Hint:_ Show it is possible to compute the sum of any subarray in $O(1)$ time.

    #solution()[
    ]
  ]

  #programming-problem(number: 8.3, difficulty: [\[∗†\]])[
    Give a divide and conquer algorithm that finds a maximal subarray of $A$ in $O(n log n)$ time.

    #solution()[
    ]
  ]

  #programming-problem(number: 8.4, difficulty: [\[∗∗\]])[
    Give an algorithm that finds a maximal subarray of $A$ in $O(n)$ time.

    #solution()[
    ]
  ]
]

= Notes
== Datastructures
#definition(title: "Data Structures")[
  Method for organising Data for effecient acess, searching, manioulaiton etc.
  
  it can be split into categories:
  
  Abstract, and Concrete data structures.
  Dynamic, and Static data structures.
]

The goal of data structures is to be fast and compact.

/ Abstract Data Structure: are data structures that are defined by their behavior and operations, rather than their implementation. Examples of abstract data structures include stacks, queues, and trees.
/ Concrete Data Structure: are data structures that are defined by their implementation and the way they store data. Examples of concrete data structures include arrays, linked lists, and hash tables.
/ Static Data Structure: are data structures that have a fixed size, and cannot be modified after they have been created. Examples of static data structures include arrays and linked lists.
/ Dynamic Data Structure: are data structures that can grow and shrink in size as needed. Examples of dynamic data structures include stacks, queues, and hash tables.

// TODO: use smallcaps for Function names, and wrap x, S, and other variables in math mode.
=== The Stack
Maintain dynamic sequence (Stack) S supporting the following operations:
- *push(x)*: add element x to the top of S.
- *pop()*: remove and return the top element of S.
- *isEmpty()*: return true if S is empty, and false otherwise.

// TODO: Viasualise a stack, with push and pop operations.

=== Queue
Maintain dynamic sequence (Queue) Q supporting the following operations:
- *enqueue(x)*: add element x to the back of Q.
- *dequeue()*: remove and return the *earliest* aded element in Q.
- *isEmpty()*: return true if Q is empty, and false otherwise.

// TODO: Viasualise a queue, with enqueue and dequeue operations.

=== Applications of Stacks and Queues
==== Stack:
- Virtual machines
- parsing
- function calls
- backtracking 

==== Queue:
- Scheduling processes
- Buffering
- Breadth-first search

=== Stack implentation

- Stack with capacity $N$

Data structure: 
- Array $S[0..N-1]$
- Index top. initially $"top" = -1$

Operations:
- *push(x)*: Add $x$ at $S["top"+1]$, $"top" = "top" + 1$
- *pop()*: Return $S["top"]$, $"top" = "top" - 1$
- *isEmpty()*: Return $"top" == -1$
- Check for overflow and underflow before performing push and pop operations, respectively.

Time:
- *push(x)*: $O(1)$
- *pop()*: $O(1)$
- *isEmpty()*: $O(1)$

Space:
- $O(N)$

Limitations:
- Capacity must be known.
- Wasting space if stack is not full.

=== Queue implementation
- Queue with capacity $N$

Data structure:
- Array $Q[0..N-1]$
- Indices head and tail, and a counter

Operations:
- *enqueue(x)*: Add $x$ at $Q["tail"]$, update count and tail cyclically.
- *dequeue()*: Return $Q["head"]$, update count and head cyclically
- *isEmpty()*: Return count == 0
- Check for overflow and underflow before performing enqueue and dequeue operations, respectively.

== Linked Lists
#definition()[
  Data structure to maintain a dynamic sequence of elements.
  
  Recursive Data structure. A linked list is either:
  
  - empty
  - a node containing an element and a pointer to the next linked list.
]

Space: $O(n)$ 

Time:
- insert at the head $O(1)$
- Delete at the head $O(1)$
- Traverse the list $O(n)$

==== Simple Python implementation of a linked list
```python
class Node:
    def __init__(self, value, next=None):
        self.value = value
        self.next = next    

a = Node(7, None)

b = Node(42, None)
c = Node(18, None)

a.next = b
b.next = c
```

//  TODO: Visualise a linked list, with nodes and pointers.
// head = head.next
// tmp = head
// head = Node(35, tmp)

Traversing a linked list takes $O(n)$ time, as we need to visit each node once.

```python
x = head
while x != None:
    print(x.item)
    x = x.next
```

// TODO: Visualise the traversal of a linked list, with a pointer moving through the nodes.

== Exercise:

Consider how to implement a stack and a queue using linked lists. What are the time and space complexities of the operations?

// TODO: Just fill this out, solved verbally in class

== Dynamic Arrays
Challenge:

Can we implement a stack differently with arrays.
- Do we need fixed capacity?
- Can we have a stack with dynamic capacity?