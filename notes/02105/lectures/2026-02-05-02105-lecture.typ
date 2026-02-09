#import "@local/dtu-template:0.6.0":*

#show: dtu-note.with(
  course: "02105",
  course-name: "Algoritmer og datastrukturer 1",
  title: "Lecture - February 05, 2026",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)


= Lecture

== Goals

- Techniques: Apply, analyse (correctness, theoretical and exerpimental performance), describe and implemnet algorithms and data structures
- Modeling. Model problems and identify algorithmic content.
- Algorithmic toolbox.


== Algorithms and Data Structures 

- Algorithmic problem. Precisely defined relation between input and ouput.


- Algorithm. Method to solve an algorithmic problem.
  - Discrete and unambiguous steps. 
  - Mathematical abstraction of a program. 

- Data structures. Methods for organising and enabling querying.


#example(title: "Find max")[
  Given an array `A[0..n-1]` find an index i, such that `A[i]` is maximal

  - Input: Array `A[0..n-1]`
  - Output: An index i such that A[i] >= A[j] for all indices j != i


  - Algoritm 
    - process A from left to right and maintain value and index of maximal value seen so far. 
    - Return index 

]


=== Running Time

$
T(n) = "The time complexity"
$

You can identify each line of code as either constant or some thing dependent on input $n$

Given a simple peak finding algorithm you can divide it into: $T(n) = c_1 + (n-2) dot c_2 + c_3$

Where T(n) is a linear function of $n$: $T(n) = a n +b$

Asymptotic notation: $T(n) = O(n)$

We remove the constant parts, and thus this algorithm is in constant time.




= Exercises 

== 1 Loops:
This exercise aims to check if you understand some basic programming concepts. Do not implement the functions. What do the functions loop1, loop2, loop3 and loop4 in Figure 1 return when

=== 1.1 n = 4?
- for loop1: 16
- for loop2: 8
- for loop3: 4
- for loop4: 10

=== 1.2 n = 10?
- for loop1: 100
- for loop2: 20
- for loop3: 10
- for loop4: 55

=== 1.3 n = 1000?
- for loop 1: 1000000
- for loop 2: 2000
- for loop 3: 1000
- for loop 4: 500500

=== 1.4 as a function of n?
- for loop1: $n^2$
- for loop2: $2n$
- for loop3: $n$
- for loop4: $sum_(i=1)^(n) (n(n+1))/2$

== 2 Recursion and Iteration
A function is recursive if it calls itself. For instance the function $f(A,n)$ in Figure *??* / 1 is recursive. Solve the following exercises.

=== 2.1 
What does $f(A,n)$ compute if $A$ is an array of integers of length $n$? You should not implement it.
- $f(A,n)$ computes the sum of all elements in the array $A$ of length $n$.

=== 2.2 
Rewrite $f(A,n)$ to be iterative, ie. make a function that computes the same as $f(A,n)$ but without calling itself.

```python
def f(A, n):
    x = 0
    for i in range(n):
        x += A[i]

    return x
```

== 3 [w†] Standard Input and Output, and Redirection
In our practical implementation exercises, we will use the standard input and output for input and output, i.e., using `input()` and `print()`, respectively . We will use redirection for large inputs and outputs. Make sure you understand how this works by solving these exercises.

=== 3.1 
Implement a program sum.py that reads (from the standard input) two integers on a single line with a space between. Write the sum to the standard output.


```py

def main():
    parsed = list(map(int, input("Input your numbers: ").split(" ")))
    print(sum(parsed))


if __name__ == "__main__":
    main()
```

=== 3.2 
Make a new text file input.txt containing two integers on a single line with a space between them. Redirect the file’s contents to the standard input for your program, i.e., execute `python sum.py < input.txt` in your terminal. Do not modify sum.py.

=== 3.3 
Now redirect the standard output to a file, i.e., execute `python sum.py > output.txt`. Do not modify sum.py. Check that the newly created file output.txt contains the correct answer . Finally , also try the combination, i.e., execute `python sum.py < input.txt > output.txt`.

== 4 Linearthritis
You have recently hired 128 programmers for your new high-tech startup company . Unfortunately, one suffers from the feared Linearthritis disease that makes everybody near the person write slow programs. To identify the diseased programmer, you have rented a special room that you can use to determine if the diseased programmer is within a group of your programmers. It is extremely expensive to rent this room, and the process needed to test a group is complicated (long and exhausting programming tests are necessary). Therefore, you would like to minimize the number of times you have to use the room to find the diseased programmer . Solve the following exercises.

=== 4.1 Show you can find the diseased programmer using at most $7$ tests.
we can use "binary search" which is done by taking exactly half the programmers in each test. In each test, if the diseased programmer is in the group, we continue testing that group by halfing it. the amount of tests needed can be visualised with a binary tree

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

=== 4.2 
How many tests do you need if you have $n$ programmers instead of $128$?

you will always need at most
$
log_2(n)
$
tests, as each test can halve the number of programmers left to test.

=== 4.3 [\*] 
Assume that you rent $k > 1$ rooms you can use to test $k$ groups of programmers simultaneously. How many rounds of tests are enough to identify the diseased programmer? In each round, you can test $k$ groups in parallel.

you will need at most
$
  log_(k+1)(n)
$
rounds, as each round can reduce the number of programmers left to test by a factor of $k+1$.

== 5 Zombie Duels
You have an army of $n$ brainless zombies. You want to find the strongest and the weakest zombie in the army. By pairing up two zombies in a cage with a big chunk of brain matter, you can quickly determine which of the two are the strongest. Unfortunately , zombies wear out in this process, so you want to minimize the number of duels needed. Solve the following exercises.

=== 5.1 
Explain how to find the strongest zombie using at most $n−1$ duels.
this analogous to running a single round of a bubble-sort.

simply pair up all zombies and have them duel. the winners move on to the next round, while the losers are discarded. repeat this process until only one zombie remains. since each duel eliminates one zombie, you will need exactly $n-1$ duels to find the strongest zombie.

=== 5.2 [\*] 
Explain how to find the strongest and the weakest zombie using at most $(3n)/2$ duels.
Using a tournament:

- we pair up all zombies and get $n/2$ duels
- the looser of the first round is guranteed to NOT be the _strongest_.
- the winner of the first round is guranteed to NOT be the _weakest_.

doing this gives us two groups:

$
  "winners:" &n/2 \
  "losers:" &n/2
$

the group of winners *must* therefore contain the strongest zombie, and the group of losers *must* contain the weakest.

repeating this over and over gives us more and more groups each *must* containing the strongest and weakest respectively.

so we effectively end with:

$
  &"initial pairing" + "winners" + "losers" \ &= 
  n/2 + n/2 + n/2 \ &=
  (3n)/2
$
=== 5.3 [\*\*] 
Explain how to find the strongest and second strongest zombie using at most $n + log_2 n$ duels.



#pagebreak()

#figure(caption: "caption: Loops and recursion in Python.", ```python
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
```)
