#import "@local/dtu-template:0.5.0":*

#show: dtu-note.with(
  course: "01017",
  course-name: "Discrete Mathematics",
  title: "Lecture - November 06, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall"
)

= Binomial



== Binomial Coefficients

$C(n, k)$ - the number of $k$-combinations from an $n$-set, or rather the number of ways to select $k$ elements from an $n$-set.
Which means the number of $k$-subsets of an $n$-set.

$
  (n!)/(k! (n-k)! ) = binom(n,k) 0 <= k <= n

$

Binomials will always be integers, becaues by combinatrics the number of ways something can happen will always be an integer.


#import "@preview/cetz:0.4.2"
#figure(
  cetz.canvas({
    import cetz.draw: *

    let n = 8

    // calculate the triangle
    let pascal = ()
    for row in range(n + 1) {
      let row-data = ()
      for col in range(row + 1) {
        let value = if col == 0 or col == row {
          1
        } else {
          let prev = pascal.at(row - 1)
          prev.at(col - 1) + prev.at(col)
        }
        row-data.push(value)
      }
      pascal.push(row-data)
    }

    // draw lines
    for (row-idx, row) in pascal.enumerate() {
      if row-idx < n {
        let row-len = row.len()
        let y = n - row-idx
        for (col-idx, val) in row.enumerate() {
          let x = col-idx - row-len / 2 + 0.5

          let next-row-len = row-len + 1
          let left-child-x = col-idx - next-row-len / 2 + 0.5
          let right-child-x = (col-idx + 1) - next-row-len / 2 + 0.5
          let child-y = y - 1

          line((x, y / 1.5), (left-child-x, child-y / 1.5), stroke: gray)
          line((x, y / 1.5), (right-child-x, child-y / 1.5), stroke: gray)
        }
      }
    }

    // draw values
    for (row-idx, row) in pascal.enumerate() {
        let row-len = row.len()
        let y = (n - row-idx) / 1.5
        for (col-idx, val) in row.enumerate() {
          let x = col-idx - row-len / 2 + 0.5
          circle((x, y), radius: 0.25, fill: white, stroke: none, name: "c-" + str(row-idx) + "-" + str(col-idx))
          content((x, y), $binom(#str(row-idx), #str(col-idx))$)
        }
      }

    // draw n
    for i in range(n + 1) {
      content(
        (
          rel: (-2, 0),
          to: ("c-" + str(i) + "-0", "-|", "c-" + str(n - 1) + "-0"),
        ),
        [n=#i],
      )
    }
  }),
  caption: "Pascal's Triangle in binomial notation"
)


$
  binom(n,0) + binom(n,1) + binom(n,2) + dots.c + binom(n,n) = sum^n_(k=0) binom(n,k) = 2^n
$

#proof[
  The number of subsets of an $n$-set is $n^n$, which is also $sum^n_(k=0) binom(n,k)$

  $
    binom(n,0) - binom(n,1) + binom(n,2) - dots.c = 0
  $
]

== Binomial Formula

$
  binom(n,k) = binom(n-1, k) + binom(n-1, k-1)
$




== Binomial Identities

= Examples

#example[
  Why is the given binomail an integer?
  $
    (25!)/(12! dot 13!)
  $

  Because the number of ways, combinations, will always be an integer.
]



= Important Points



= Questions & Follow-up
