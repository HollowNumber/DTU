#import "@preview/lovelace:0.3.1": *
#import "@local/dtu-template:0.6.3":*
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#codly(languages: codly-languages)
#show: codly-init.with()

#show: dtu-note.with(
  course: "02231",
  course-name: "Cryptography fundamentals",
  title: "Lecture - September 07, 2026",
  date: datetime(year: 2026, month: 9, day: 7),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Fall",
)

= Lecture

== Provable security: libraries and interchangeability

#definition(
  title: [2.1.1 - Library],
)[
A library is a collection of subroutines, each with private (locally-scoped) variables. Booleans default to `false`, integers to `0`, and collections (sets/lists/maps) default to empty, unless initialized otherwise.
]

#definition(
  title: [2.1.3 - Linking calling programs & libraries],
)[
  Suppose a program $cal(A)$ makes calls to subroutines in a library $cal(L)$. Then $cal(A) compose cal(L)$ denotes the result of linking $cal(A)$ to $cal(L)$, giving a combined, self-contained program. We write $cal(A) compose cal(L) => b$ for the event that this combined program outputs $b$; for boolean-output $cal(A)$, we define $Pr[cal(A) compose cal(L) => "true"]$ to be the *output probability* of $cal(A)$ linked to $cal(L)$.
]

#definition(
  title: [2.2.1 - Interchangeable libraries],
)[
  Suppose two libraries $cal(L)_1, cal(L)_2$ have the same interface (identically named subroutines with identical argument/return types). $cal(L)_1$ and $cal(L)_2$ are *interchangeable*, written $cal(L)_1 equiv cal(L)_2$, if no calling program behaves differently when linked to either one -- formally, if for every calling program $cal(A)$ with boolean output,
  $ Pr[cal(A) compose cal(L)_1 => "true"] = Pr[cal(A) compose cal(L)_2 => "true"]. $
  Think of $cal(A)$ as a distinguisher trying to tell whether it is linked to $cal(L)_1$ or $cal(L)_2$: the libraries are interchangeable if no distinguisher can succeed, not even by the smallest change in output probability. This definition puts *no* restriction on $cal(A)$ -- not even on its running time.
]

#lemma(
  name: [Claim 2.2.2 - Re-stating OTP security using libraries],
)[
  The following two libraries are interchangeable, $cal(L)_"otp-real" equiv cal(L)_"otp-rand"$. Note that a *fresh* key/junk value is sampled on every call, since this is a *one-time* guarantee.
  #align(center)[
    #grid(columns: (1fr, 1fr), gutter: 1.5em, pseudocode-list(title: [$cal(L)_"otp-real"$])[
      + *otp.enc*$(M)$:
        + $K <- {0,1}^n$
        + $C := K xor M$
        + *return* $C$
    ], pseudocode-list(title: [$cal(L)_"otp-rand"$])[
      + *otp.enc*$(M)$:
        + $R <- {0,1}^n$
        + *return* $R$
    ])
  ]

  In other words: no adversary can tell OTP ciphertexts apart from uniformly sampled strings, given the ability to arbitrarily choose plaintexts, as long as keys are uniform and used for only one encryption.
]

== Symmetric-key encryption: syntax, correctness, and one-time secrecy

#definition(
  title: [2.5.1 - Syntax of symmetric-key encryption],
)[
  A symmetric-key encryption (SKE) scheme consists of: *Enc*, a (possibly randomized) algorithm taking a key $K in cal(K)$ and plaintext $M in cal(M)$ and outputting a ciphertext $C in cal(C)$; and *Dec*, a deterministic algorithm taking $K in cal(K)$ and $C in cal(C)$ and outputting $M in cal(M)$. $cal(K)$, $cal(M)$, $cal(C)$ are called the key/plaintext/ciphertext *spaces*. We write $Sigma$ for the scheme as a whole, with $Sigma$.$"Enc"$, $Sigma$.$"Dec"$, $Sigma$.$"K"$ etc. denoting its algorithms/sets.
]

#definition(
  title: [2.5.2 - Correctness for SKE],
)[
  An SKE $Sigma$ is *correct* if encryption and decryption are inverses:
  $ Pr[Sigma."Dec"(K, Sigma."Enc"(K,M)) = M] = 1 $
  for all $M in Sigma."M"$ and $K in Sigma."K"$. (This is stated as a probability because $Sigma."Enc"$ may be randomized.)
]

#definition(
  title: [2.5.3 - One-time secrecy],
)[
  An SKE scheme $Sigma$ has *one-time secrecy* if the following two libraries are interchangeable, $cal(L)^Sigma_"ots-real" equiv cal(L)^Sigma_"ots-rand"$ -- this is exactly the $cal(L)_"ots-real"/cal(L)_"ots-rand"$ notation used on the problem sheet:
  #align(center)[
    #grid(columns: (1fr, 1fr), gutter: 1.5em, pseudocode-list(title: [$cal(L)^Sigma_"ots-real"$])[
      + *ots.enc*$(M)$:
        + $K <- Sigma$.$"K"$
        + $C := Sigma$.$"Enc"(K, M)$
        + *return* $C$
    ], pseudocode-list(title: [$cal(L)^Sigma_"ots-rand"$])[
      + *ots.enc*$(M)$:
        + $C <- Sigma$.$"C"$
        + *return* $C$
    ])
  ]

  Plain English: $Sigma$ has one-time secrecy if its ciphertexts are uniformly distributed, when keys are sampled uniformly, kept secret, and used for only one encryption -- no matter how plaintexts are chosen. A security definition like this is a *template*: to prove/disprove it for a specific scheme, populate $Sigma."K"$, $Sigma."Enc"$, $Sigma."C"$ and compare the resulting two libraries.
]

#example(
  title: [2.5.4 - One-time secrecy of OTP],
)[
  Populating Definition 2.5.3 with OTP's $cal(K) = cal(M) = cal(C) = {0,1}^n$ and $"Enc"(K,M) = K xor M$ gives exactly the $cal(L)_"otp-real"/cal(L)_"otp-rand"$ pair from Claim 2.2.2 -- which we already proved interchangeable. So *OTP has one-time secrecy*.
]

#example(
  title: [2.5.5 - Insecure OTP variant],
)[
  Consider the scheme with $"Enc"(K,M) = K \& M$ ($\&$ = bitwise-AND) instead of $xor$ -- exactly the scheme in problem-sheet Exercise 1. This scheme doesn't even satisfy *correctness* (Definition 2.5.2): the key $K = 0^n$ encrypts *every* plaintext to $0^n$, so decryption can't recover $M$ in general. Regardless, we can still ask whether it has one-time secrecy: populating Definition 2.5.3 gives $cal(L)^Sigma_"ots-real"$ where $"ots.enc"(M)$ returns $K \& M$ for fresh $K <- {0,1}^n$. Taking $M = 0^n$, this *always* returns $0^n$ -- but $cal(L)_"ots-rand"$ returns $0^n$ with probability only $1/2^n$. So the two libraries are easily distinguished, and this scheme has *neither* correctness *nor* one-time secrecy.
]

== Computational security: negligible functions and indistinguishability

#definition(
  title: [4.2.1 - Polynomial running time],
)[
  An algorithm runs in *polynomial time* if there is a polynomial $p$ such that it takes at most $O(p(n))$ steps on inputs of length $n$.
]

#definition(
  title: [4.2.2 - Negligible functions],
)[
  A function $f$ is *negligible* if it approaches zero faster than $1/p(lambda)$, for every polynomial $p$: for every polynomial $p$ there is a $lambda_0$ such that $f(lambda) < 1/p(lambda)$ for all $lambda > lambda_0$.
]

#example(
  title: [4.2.3],
)[
  $f(lambda) = 1/2^lambda$ and $f(lambda) = 1/2^(lambda/2)$ are negligible, since their reciprocals grow faster than every polynomial. More generally, $f(lambda) = q(lambda)/2^lambda$ is negligible for any polynomial $q$ -- nearly every negligible probability in this course has this shape.
]

#definition(
  title: [4.3.1 - Indistinguishability],
)[
  Let $cal(L)_1, cal(L)_2$ be libraries with the same interface. The *advantage* of a calling program $cal(A)$ in distinguishing them is
  $ abs(Pr[cal(A) compose cal(L)_1 => "true"] - Pr[cal(A) compose cal(L)_2 => "true"]). $
  $cal(L)_1$ and $cal(L)_2$ are *indistinguishable*, written $cal(L)_1 approx cal(L)_2$, if every *polynomial-time* $cal(A)$ has only *negligible* advantage. Compare to Definition 2.2.1's $equiv$: interchangeability ($equiv$) demands *zero* advantage from *every* (even unbounded) $cal(A)$; indistinguishability ($approx$) is the relaxed, computational analogue used for PRFs (and later PRPs, CPA/CCA security).
]

== Pseudorandom functions (PRFs)

#definition(
  title: [6.1.1 - Pseudorandom function, PRF],
)[
  A function $F : {0,1}^lambda times {0,1}^n -> {0,1}^m$ is a *secure PRF* if the following libraries are indistinguishable, $cal(L)^F_"prf-real" approx cal(L)^F_"prf-rand"$:

  #align(center)[
    #grid(columns: (1fr, 1fr), gutter: 1.5em, pseudocode-list(title: [$cal(L)^F_"prf-real"$])[
      + $K <- {0,1}^lambda$
      + *prf.query*$(X)$:
        + *return* $F(K, X)$
    ], pseudocode-list(title: [$cal(L)^F_"prf-rand"$])[
      + *prf.query*$(X)$:
        + *if* $L[X]$ undefined *then*
          + $L[X] <- {0,1}^m$
        + *end*
        + *return* $L[X]$
    ])
  ]

  ($lambda$ = key length, $n$ = input length, $m$ = output length. $cal(L)_"prf-rand"$ lazily samples a uniformly random, but *consistent*, output for each new $X$ -- a "lazy random dictionary".)
]

#lemma(name: [Claim 6.2.1 - An insecure PRF])[
  $F(K,X) = G(K) xor X$ is *not* a secure PRF, even if $G$ is a secure PRG.
]

#lemma(name: [Claim 6.2.2 - Another insecure PRF])[
  $H(K_1 parallel K_2, X_1 parallel X_2) = F(K_1,X_1) xor F(K_2,X_2)$ is *not* a secure PRF, even if $F$ is.
]

#conceptual-question(
  )[
  Where does the one-time-pad argument (Claim 2.2.2) actually break once a key is reused? The $cal(L)_"ots-real"$/$cal(L)_"ots-rand"$ notation on the problem sheet is exactly Definition 2.5.3's one-time secrecy, instantiated for a specific scheme -- compare to $cal(L)_"otp-real"$/$cal(L)_"otp-rand"$ above, which is one-time secrecy already instantiated for OTP specifically (Example 2.5.4). And how does the PRF security definition (6.1.1) differ from one-time secrecy: what's being reused across calls there that *isn't* allowed to be reused in the one-time setting?
]

#assumption(
  )[
Everything above assumes an *honest* use of keys exactly as each definition prescribes: a *fresh* key/junk value per call for the *one-time* definitions (OTP, one-time secrecy), versus a *single* key reused consistently across many *queries* for a PRF. Mixing these up -- e.g. reusing a one-time key across multiple `enc` calls -- is exactly what breaks the corresponding security claims.
]

= Exercises
These practice problems have the purpose of helping you understand the material better and learning the skills that are necessary to analyze cryptographic constructions, and sometimes to prepare you for the next class. All answers should be supported by a written justification. To gauge whether a justification is sufficient, ask yourself if your peers would be convinced by it without additional explanations.

We denote vectors as $x in {0,1}^lambda$. By $x[i]$ we denote the $i$th index of $x$, where $i in {1,...,lambda}$. As in the lecture, we write $k <- K$ if $k$ is sampled from the set $K$ such that it can be each element from $K$ with equal probability $1/abs(K)$.

For the first exercise, we denote with $\&$ the AND-function, which is defined by the following truth table:

#table(columns: 3, align: center, [$x$], [$y$], [$x\&y$], [0], [0], [0], [0], [1], [0], [1], [0], [0], [1], [1], [1])

For two vectors $x, y$ we can define the coordinate-wise AND of both vectors, $x\&y$, by saying that $(x\&y)[i] = x[i]\&y[i]$. This means that $x\&y$ is computed by applying $\&$ to the individual coordinates of each $x, y$ and concatenating the outcomes.

=== Exercise 1. (Not all bit operations are equal)

Let $lambda$ be a positive integer. We define $K = M = C = {0,1}^lambda$ and consider the following algorithms:
#align(center)[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 1.5em, pseudocode-list(title: [Keygen()])[
    + *Output* $k <- K$.
  ], pseudocode-list(title: [Enc$(k, m in M)$])[
    + *Output* $k\&m$.
  ], pseudocode-list(title: [Dec$(k, c in C)$])[
    + *Output* $k\&c$.
  ])
]

Show that these three algorithms do *not* form a SKE scheme, because they are not correct. You can show this by giving an example where decryption fails.

#solution()[
  SOLUTION WILL GO HERE
]

For the second exercise, we will work with permutations on bitstrings. A permutation of a string is a rearrangement of all the entries of that string. For example, let $a, b in {0,1}$ be bits and $a b$ be a bitstring. Then both $a b$ and $b a$ are permutations of the original string. Note that $a a$ is not a permutation of $a b$, as $b$ also has to appear in the permutation of $a b$. In general, there are $n!$ permutations of $n$ objects. For an $n$-bit string, there are thus $n!$ permutations (but they are not all distinct).

Mapping all bitstrings $a b$ to $a b$ is a function from ${0,1}^2$ to ${0,1}^2$, and similarly is mapping all bitstrings $a b$ to $b a$. For all strings of length $n$, we denote the set of permutations (or rather, all different functions that shuffle the $n$ entries of input vectors) as $S_n$.

For a string $x in {0,1}^n$ we write $y := pi(x)$ to say that $y$ is the string $x$ permuted under the permutation function $pi in S_n$. Formally, this means that $y[pi(i)] = x[i]$ for all $i in {1,...,n}$. Accordingly, let $pi^(-1)$ be the inverse permutation. Note that this inverse permutation always exists: if we shuffle the indices of a vector in a certain way, we can just unshuffle them by going backwards.

=== Exercise 2. (Permutations for Security?)

Let $lambda$ be a positive integer and let $S_lambda$ be the set of all permutations on strings of length $lambda$. We define $M = C = {0,1}^lambda$ and consider the following algorithms:
#align(center)[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 1.5em, pseudocode-list(title: [Keygen()])[
    + *Output* $pi <- S_lambda$.
  ], pseudocode-list(title: [Enc$(pi, m in M)$])[
    + *Output* $pi(m)$.
  ], pseudocode-list(title: [Dec$(pi, c in C)$])[
    + *Output* $pi^(-1)(c)$.
  ])
]
1. Show that these three algorithms form an SKE scheme, i.e. that they are correct.
2. Show that the defined three algorithms are not one-time indistinguishable, i.e. that $cal(L)_"ots-real" equiv.not cal(L)_"ots-rand"$. For this, write down an explicit algorithm $cal(B)$ which sends one query to the library that it has access to black box. Based on the response $c$, $cal(B)$ outputs 0 if it thinks that it talked to $cal(L)_"ots-real"$ or 1 if it thinks that it talked to $cal(L)_"ots-rand"$. How likely is it that $cal(B)$ gives the right answer?

#solution()[
  SOLUTION WILL GO HERE
]

For the last exercise, we denote with $xor$ the XOR-function, which is defined by the following truth table:

#table(
  columns: 3,
  align: center,
  [$x$],
  [$y$],
  [$x xor y$],
  [0],
  [0],
  [0],
  [0],
  [1],
  [1],
  [1],
  [0],
  [1],
  [1],
  [1],
  [0],
)

As for the AND-function, we can define it coordinate-wise for vectors.

=== Exercise 3. (Why Keygen is important)

Let $lambda$ be a positive integer. We define $K = M = C = {0,1}^lambda$ and let $cal(B)_p$ be the probability distribution that outputs 0 with probability $p$ and 1 with probability $1-p$. Consider the following algorithms:

#grid(columns: (1fr, 1fr, 1fr), gutter: 1.5em, pseudocode-list(title: [Keygen()])[
  + *Let* $k$ be a vector of length $lambda$.
  + *For each* $i in {1,...,lambda}$ *set* $k[i] <- cal(B)_0.75$
], pseudocode-list(title: [Enc$(k, m in M)$])[
  + *Output* $k xor m$.
], pseudocode-list(title: [Dec$(k, c in C)$])[
  + *Output* $k xor c$.
])

1. Show that these three algorithms form an SKE scheme, i.e. that they are correct.
2. Let $lambda = 3$ and let $cal(A)$ be an algorithm which queries the $cal(L)_"ots-real"$ library with input $m = 111$. Compute the probability of each possible ciphertext obtained from the library.
3. Based on the algorithm $cal(A)$, consider a new algorithm $cal(B)$ that sends $m = 111$, waits for the response $c$ from the library. $cal(B)$ outputs 1 if $c = m$ and 0 otherwise. What is the probability that $cal(B)$ outputs 1 with $cal(L)_"ots-real"$, and what is the probability when it interacts with $cal(L)_"ots-rand"$?
4. Show that the three algorithms Keygen, Enc, Dec are not real-or-random secure, i.e. that $cal(L)_"ots-real" equiv.not cal(L)_"ots-rand"$. For this, apply the real-or-random-secure definition to the algorithm $cal(B)$ and show why it breaks security.
5. #emph[Bonus problem:] Is $cal(B)$ the attacker with the highest probability of guessing correctly? If not, find an optimal attack.

#solution()[
  SOLUTION WILL GO HERE
]
