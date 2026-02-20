#import "@local/dtu-template:0.6.3":*

#show: dtu-note.with(
  course: "02105",
  course-name: "Algoritmer og datastrukturer 1",
  title: "Lecture - February 18, 2026",
  date: datetime(year: 2026, month: 2, day: 18),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)

= Key Concepts



= Examples



= Important Points



= Questions & Follow-up



== next week


= Prep

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

  At a glance the cube of $n$ will grow a lot faster than the square of $n$ regardless of it being divided by two. 

  $
  n^2 + n^3/2 &= lim_(n-> infinity) n^2/(n^3 slash 2) \ 
  &= lim_(n->infinity) (n dot n )/( (n dot n^2 )/2) \
  &= lim_(n->infinity) (2(n dot n))/(2 (n dot n^2) ) \ 
  &= lim_(n->oo) (cancel(2) cancel(n) n)/(cancel(2 n) n^2 ) \
  &= lim_(n->oo) n/n^2
  $

  2. 


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

