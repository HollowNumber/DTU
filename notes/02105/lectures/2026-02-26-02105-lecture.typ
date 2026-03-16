#import "@local/dtu-template:0.6.3":*

#show: dtu-note.with(
  course: "02105",
  course-name: "Algoritmer og datastrukturer 1",
  title: "Lecture - February 18, 2026",
  date: datetime(year: 2026, month: 2, day: 18),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)

= Exercises

== 1 Asymptotic Growth

Arrange the following functions in increasing asymptotic order, i.e., if $f(n)$ precedes $g(n)$ then $f(n)=O(g(n))$

$
n log n quad n^2 quad 2^n quad n^3 quad sqrt(n) quad n
$

#solution[
  1. $sqrt(n)$
  2. $n$ 
  3. $n log n$
  4. $n^2$
  5. $n^3$
  6. $2^n$
]


== 2 $Theta$-notation Write the following expressions using $Theta$-notation

$
n^2 + n^3 slash 2 quad &quad 8 log_2^7 n + 34 log_2 n + 1/1000 n \ 
2^n + n^4 quad &quad 1^n 7 + 5 log_2^3 n \
log_2 n + n sqrt(n) quad &quad n (n^2 - 18) log_2 n \
n (n-6) quad &quad n log_2^4 n + n^2 \
4 sqrt(n) quad &quad n^3 log_2 n + sqrt(n) log_2 n 
$

#solution[
 
  1. 

  No matter what $n^3/2$ will grow a lot faster than $n^2$ therefore it is $Theta(n^3)$.
  
  2. 

  The average case time complexity of $2^n + n^4$ will be $Theta(2^n)$

  3. 

  Trivially $log_2 n$ will always be faster. But average case it would be $Theta(n sqrt(n))$


  4. 

  We can expand the expression:

  $
  n(n-6) &= n^2 -6n \
  $

  Thus we get an average case of $Theta(n^2)$


  5.

  The average case of $4 sqrt(n)$ would be $Theta(sqrt(n))$


  6. 

  $
  8 (log_2 n)^7 + 35 log_2 n + 1/1000 n 
  $

  I can only imagine that its gonna be an avereage of $Theta(log_2^7 n) $

  7. 

  Average case of $Theta(log_2^3 n )$


  8. 

  Avereage case would be $Theta(n^3)$


  9.

  Average case of $Theta(n^3)$


  10.

  Average case of $Theta(n^3)$

]

== 3 Loopy loops 

Analyse the running time and express the result of O-notation 


```lua
i = 1 

while i <= n do 
  print "*"
  i = 2 * i 
end while 

```

#set math.frac(style: "skewed")

#solution[
  This is a single while loop, which is linear. However since $i$ is doubled every iteration, skipping every second index, it effectively only iterates over half of the input: $n/2$

  $O(n)$ because:

  $
  T(n) = c_1 +  n dot c_2 + c_3 + c_4 <==> O(n)
  $
]

```lua
i = 1 
while i <= n do 
  print "*"
  i = 5 * i 
end while 
```
#solution[

  $O(n)$

  Since 

  $
  T(n) = c_1 +  n dot c_2 + c_3 + c_4 <==> O(n)
  $
]

```lua

for i = 1 to n do 
  j = 1 
  while j <= n do 
    print "*"
    j = 2 * j 
  end while 
end for
```

#solution[
  $O(n^2)$ Becase: 

  $
    T(n) = n c_1 + c_2 + c_3 n + c_4 + c_5 <==> O(n^2) // This is probably wrong
  $
]


== 4 Asymptotic Statements 

$
1/20 n^2 + 100 n^3 = O(n^2) quad n^3/1000 + n + 100 = Omega (n^2) \
log_2 n + n = O(n) quad 2^n + n^2 = Omega(n) \ 
2^(log_2 n) = O(n) quad log_4 n + log_16 n = Theta(log n) \ 
n^3 (n-1) slash 5 = Theta(n^3) quad n^(1/4) + n^2 = Theta(n) \ 
log_2^2 n + n = Theta(n) quad 2^(log_4 n) = Theta(sqrt(n))
$


= Lecture


/ Abstract Data Structure: are data structures that are defined by their behavior and operations, rather than their implementation. Examples of abstract data structures include stacks, queues, and trees.
/ Concrete Data Structure: are data structures that are defined by their implementation and the way they store data. Examples of concrete data structures include arrays, linked lists, and hash tables.
/ Static Data Structure: are data structures that have a fixed size, and cannot be modified after they have been created. Examples of static data structures include arrays and linked lists.
/ Dynamic Data Structure: are data structures that can grow and shrink in size as needed. Examples of dynamic data structures include stacks, queues, and hash tables.
