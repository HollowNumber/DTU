#import "@preview/lovelace:0.3.1": *
#import "@local/dtu-template:0.6.3": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#codly(languages: codly-languages)
#show: codly-init.with()

#show: dtu-note.with(
  course: "02231",
  course-name: "Cryptography fundamentals",
  title: "Lecture - September 14, 2026",
  date: datetime(year: 2026, month: 9, day: 14),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Fall",
)

= Reading notes

== Key Concepts

#definition(
  title: [7.1.1 (Keyed permutation)],
)[
  A keyed permutation consists of two functions $F : {0,1}^lambda times {0,1}^n -> {0,1}^n$ and $F^(-1) : {0,1}^lambda times {0,1}^n -> {0,1}^n$, satisfying $F^(-1)(K, F(K,X)) = X$ for all $K in {0,1}^lambda$ and $X in {0,1}^n$. $n$ is the blocklength, and the pair is written $F^(plus.minus)$.
]

#definition(
  title: [7.1.2 (Pseudorandom permutation, PRP)],
)[
  A keyed permutation $F^(plus.minus)$ is a secure PRP if the following libraries are indistinguishable:
  #align(center)[
    #grid(
      columns: (1fr, 1fr),
      gutter: 1.5em,
      pseudocode-list(title: [$cal(L)^F_"prp-real"$])[
        + $K <- {0,1}^lambda$
        + *prp.query*$(X)$:
          + *return* $F(K, X)$
      ],
      pseudocode-list(title: [$cal(L)^F_"prp-rand"$])[
        + $cal(Y) := emptyset$
        + *prp.query*$(X)$:
          + *if* $L[X]$ undefined *then*
            + *repeat* $Y <- {0,1}^n$ *until* $Y in.not cal(Y)$
            + $cal(Y) := cal(Y) union {Y}$
            + $L[X] := Y$
          + *end*
          + *return* $L[X]$
      ],
    )
  ]
  $cal(L)^F_"prp-rand"$ samples _without_ replacement, so it behaves exactly like a genuine, lazily-sampled permutation. PRPs are also called block ciphers.
]

#lemma(
  name: [Lemma 7.2.1 (PRF/PRP switching lemma)],
)[
  Sampling _with_ replacement is indistinguishable from sampling _without_ replacement, as long as the sampled values are $lambda$ bits long:
  #align(center)[
    #grid(
      columns: (1fr, 1fr),
      gutter: 1.5em,
      pseudocode-list(title: [with replacement])[
        + *query*$(X)$:
          + *if* $L[X]$ undefined *then*
            + $L[X] <- {0,1}^lambda$
          + *end*
          + *return* $L[X]$
      ],
      pseudocode-list(title: [without replacement])[
        + $cal(Y) := emptyset$
        + *query*$(X)$:
          + *if* $L[X]$ undefined *then*
            + *repeat* $Y <- {0,1}^lambda$ *until* $Y in.not cal(Y)$
            + $cal(Y) := cal(Y) union {Y}$
            + $L[X] := Y$
          + *end*
          + *return* $L[X]$
      ],
    )
  ]
  This is the only difference between $cal(L)^F_"prf-rand"$ and $cal(L)^F_"prp-rand"$ at matching output length $lambda$.

  #proof()[
    A distinguisher needs a collision under _with-replacement_ sampling. By the birthday bound (Lemma 4.5.7), after $q$ queries this happens with probability at most $"Birthday"(q, 2^lambda)$, negligible for polynomial $q$.
  ]
]

#definition(title: [7.3.1 (Feistel cipher)])[
  An $r$-round Feistel cipher with round functions $F_1, ..., F_r : {0,1}^n -> {0,1}^n$:
  #align(center)[
    #pseudocode-list(title: [$F(X_0 parallel X_1)$])[
      + *for* $i := 1$ *to* $r$:
        + $X_(i+1) := X_(i-1) xor F_i (X_i)$
      + *end*
      + *return* $X_r parallel X_(r+1)$
    ]
  ]
  Maps $2n$ bits to $2n$ bits if each $F_i$ maps $n$ bits to $n$ bits.
]

#lemma(
  name: [Claim 7.3.2 (Feistel ciphers are permutations)],
)[
  A Feistel cipher is a permutation on ${0,1}^(2n)$ regardless of what its round functions $F_1,...,F_r$ are, even if they aren't invertible themselves.

  #proof()[
    To invert a round, rearrange $X_(i+1) := X_(i-1) xor F_i (X_i)$ into $X_(i-1) = X_(i+1) xor F_i (X_i)$. $X_i$ is already known at that point, so $F_i$ only ever needs to be evaluated forwards, never inverted. Running this backwards from round $r$ to round $1$ inverts the whole cipher.
  ]
]

#definition(
  title: [7.3.3 (Keyed Feistel cipher)],
)[
  A Feistel cipher whose round functions are $F(K_1,dot), ..., F(K_r,dot)$, for a single keyed function $F$, is an $r$-round keyed Feistel cipher with round function $F$. $K_1,...,K_r$ is its key schedule. Since inverting still evaluates each $F(K_i, dot)$ forwards, the same keys are needed for both directions.

  A 2-round keyed Feistel cipher can never be a secure PRP, no matter the round function. Three rounds suffice, given a secure-PRF round function.
]

#theorem(
  title: [7.3.4 (Security of the three-round Feistel cipher)],
)[
  If $F$ is a secure PRF with input/output length $lambda$, the 3-round keyed Feistel cipher
  #align(center)[
    #pseudocode-list(title: [$F(K_1 parallel K_2 parallel K_3, X_0 parallel X_1)$])[
      + $X_2 := X_0 xor F(K_1, X_1)$
      + $X_3 := X_1 xor F(K_2, X_2)$
      + $X_4 := X_2 xor F(K_3, X_3)$
      + *return* $X_3 parallel X_4$
    ]
  ]
  is a secure PRP with blocklength $2lambda$.

  #proof()[
    By the switching lemma and Claim 7.3.2 (the cipher already has an inverse), it suffices to show this is a secure PRF. Treat $F(K_2,X_2)$ and $F(K_3,X_3)$ as OTP-style pads for $X_1$ and $X_2$: if $F$ is a secure PRF these pads are pseudorandom, as long as their inputs $X_2, X_3$ never repeat across queries. Replacing each round function with an independent random table and analyzing when $X_2$ or $X_3$ collide across two queries gives a bad-event probability of at most $q^2\/2^lambda + "Birthday"(q,2^lambda)$, negligible for polynomial $q$.

    The adversary cannot invert the cipher itself even though it has an inverse, since it doesn't know $K_1,K_2,K_3$ and so cannot evaluate $F(K_i,dot)$ in either direction.
  ]
]

#definition(
  title: [7.5.1 (Strong pseudorandom permutation, SPRP)],
)[
  A keyed permutation $F^(plus.minus)$ is a secure strong PRP if the following libraries are indistinguishable:
  #align(center)[
    #grid(
      columns: (1fr, 1fr),
      gutter: 1.5em,
      pseudocode-list(title: [$cal(L)^F_"sprp-real"$])[
        + $K <- {0,1}^lambda$
        + *sprp.query+*$(X)$:
          + *return* $F(K,X)$
        + *sprp.query-*$(Y)$:
          + *return* $F^(-1)(K,Y)$
      ],
      pseudocode-list(title: [$cal(L)^F_"sprp-rand"$])[
        + *sprp.query+*$(X)$:
          + *if* $L^+ [X]$ undefined *then*
            + *repeat* $Y <- {0,1}^n$ *until* $Y in.not cal(Y)$
            + $L^+ [X] := Y$; $L^- [Y] := X$; $cal(X) := cal(X) union {X}$; $cal(Y) := cal(Y) union {Y}$
          + *end*
          + *return* $L^+ [X]$
        + *sprp.query-*$(Y)$:
          + *if* $L^- [Y]$ undefined *then*
            + *repeat* $X <- {0,1}^n$ *until* $X in.not cal(X)$
            + $L^+ [X] := Y$; $L^- [Y] := X$; $cal(X) := cal(X) union {X}$; $cal(Y) := cal(Y) union {Y}$
          + *end*
          + *return* $L^- [Y]$
      ],
    )
  ]
  $L^+$ and $L^-$ stay consistent as inverses of each other, implementing a lazily-sampled random permutation together with its inverse. Modern block ciphers, AES included, are designed to be secure SPRPs, _not_ just plain PRPs.
]

== AES

#definition(
  title: [Advanced Encryption Standard, AES],
)[
  AES is a substitution-permutation network, *not* a Feistel cipher, with blocklength $B=128$ and key length $lambda in {128,192,256}$ (AES-128/192/256). A key-expansion routine derives round keys $k_0,k_1,...,k_10$ (for $lambda=128$) from the master key $k$:
  #align(center)[
    #pseudocode-list(title: [AES.Enc$(k,m)$, $lambda=128$])[
      + $k_0,...,k_10 :=$ *KeyExpansion*$(k)$
      + *state* $:= m xor k_0$
      + *for* $i := 1$ *to* $10$:
        + *state* $:=$ *SubBytes*(*state*)
        + *state* $:=$ *ShiftRows*(*state*)
        + *if* $i != 10$: *state* $:=$ *MixColumns*(*state*)
        + *state* $:=$ *state* $xor k_i$
      + *end*
      + *return* *state*
    ]
  ]
  10 rounds for $lambda=128$ (12/14 rounds for $lambda=192\/256$). Every step but SubBytes is $FF_2$-linear, and every step is individually invertible, which is how AES.Dec runs the whole round function backwards without needing a Feistel-style trick.
]

#definition(
  title: [AES state and its four round steps],
)[
  The 16-byte state is arranged as a $4 times 4$ byte matrix $a_(i,j)$, $i,j in {0,...,3}$.

  / AddRoundKey: bytewise XOR of the state with the round-key matrix, $a_(i,j) := a_(i,j) xor k_(i,j)$. The only step that touches the key.

  / SubBytes: byte-wise substitution through a fixed S-box $S$, $a_(i,j) := S(a_(i,j))$. $S$ maps $00000000$ to itself, and every other byte to its multiplicative inverse over the field with $2^8$ elements. This is the *only non-linear* step in AES.

  / ShiftRows: cyclically shifts row $i$ left by $i$ positions, $i in {0,1,2,3}$. Row $0$ is untouched.

  / MixColumns: left-multiplies each column of the state by a fixed invertible $4 times 4$ matrix (equivalently, a fixed polynomial $c(x)$). Skipped in the final round.

  Each step is a bijection on its own input, so the whole round function is invertible without needing a Feistel structure -- unlike DES/3DES, AES gets invertibility "for free" from four separately-invertible steps rather than from the Feistel trick below.
]

=== Types of attackers
/ ciphertext-only attackers: The attacker only has acccess to some amount of ciphertexts, but no plaintexts.

/ Known-plaintext attackers: The attacker has access to a number of of plaintext/ciphertext pairs.

/ Chosen-plaintext attackers: The attacker can choose plaintexts and obtain their corresponding ciphertexts.

== Examples

#example(
  title: [Constructing a 3-round Feistel PRP],
)[
  Instantiate Theorem 7.3.4 concretely with $lambda = 4$ (so half-blocks are 4 bits, full blocks 8 bits). Fix round keys $K_1 = 0101$, $K_2 = 1100$, $K_3 = 0011$, and -- purely to make the arithmetic checkable by hand -- a toy round function $F(K,X) := K xor X$. (This particular $F$ is *not* claimed to be a secure PRF -- compare Claim 6.2.1 -- it is only used here to illustrate the Feistel *mechanics*; security is what Theorem 7.3.4 supplies once a genuine secure PRF is plugged in.)

  *Encryption* of $X_0 = 0011$, $X_1 = 1010$:
  $
    F(K_1,X_1) & = 0101 xor 1010 = 1111, quad & X_2 & := X_0 xor F(K_1,X_1) = 0011 xor 1111 = 1100 \
    F(K_2,X_2) & = 1100 xor 1100 = 0000, quad & X_3 & := X_1 xor F(K_2,X_2) = 1010 xor 0000 = 1010 \
    F(K_3,X_3) & = 0011 xor 1010 = 1001, quad & X_4 & := X_2 xor F(K_3,X_3) = 1100 xor 1001 = 0101
  $
  so the ciphertext is $C = X_3 parallel X_4 = 10100101$.

  *Decryption* runs the same three round-function evaluations in reverse order, exactly as in the proof of Claim 7.3.2 -- each step only ever evaluates $F$ forwards:
  $
    X_2 & := X_4 xor F(K_3,X_3) = 0101 xor 1001 = 1100 \
    X_1 & := X_3 xor F(K_2,X_2) = 1010 xor 0000 = 1010 \
    X_0 & := X_2 xor F(K_1,X_1) = 1100 xor 1111 = 0011
  $
  which recovers $X_0 parallel X_1 = 00111010$, the original plaintext.
]

#example(
  title: [7.4.1 (Meet-in-the-middle attack)],
)[
  Suppose $F(K_L parallel K_R, X) = B(K_R, A(K_L,X))$ splits into two phases, each keyed by only half of a $lambda$-bit key. Given a sample $(X,Z)$ with $Z = F(K_L parallel K_R, X)$, the intermediate value satisfies $A(K_L,X) = Y = B^(-1)(K_R,Z)$.

  Attack, given one such sample $(X,Z)$:
  + Compute $A(K_L,X)$ for all $2^(lambda\/2)$ candidate values of $K_L$.
  + Compute $B^(-1)(K_R,Z)$ for all $2^(lambda\/2)$ candidate values of $K_R$.
  + The correct key pair is the one where these two lists agree on $Y$. If more than one pair agrees, repeat with another sample.

  Total cost $O(2^(lambda\/2))$, far below the naive $O(2^lambda)$ brute force.
]

== Important Points

- A secure PRP with blocklength $lambda$ is automatically a secure PRF, and a secure PRF with output length $lambda$ can be swapped in wherever a secure PRP is needed. PRF security only quantifies over _forward_ oracle access, so it says nothing about invertibility. Some secure PRFs happen to be permutations, others aren't.
- A 2-round keyed Feistel cipher is never a secure PRP. 3 rounds are enough if the round function is a secure PRF.
- Theorem 7.3.4's bound is $Theta(q^2\/2^lambda)$, so a blocklength-$2lambda$ Feistel cipher only gets about $lambda\/2$ bits of concrete security, even though the asymptotic result holds.
- Real ciphers deviate from the theoretical construction for efficiency (a PRG-based round function would need $3lambda$ PRG calls per block) and use many more rounds plus a key schedule derived from one short master key, rather than fully independent round keys.
- DES: 16-round Feistel cipher, 56-bit master key. Outdated, key too short, should never be used.
- AES: _not_ Feistel-structured, 128-bit blocklength, 128/192/256-bit keys. Still considered secure and the modern default choice.
- Meet-in-the-middle attacks only affect concrete security, since $O(2^(lambda\/2))$ is still exponential, but they're a reminder to never let an attacker brute-force two halves of a key independently.
- A 3-round keyed Feistel cipher is _not_ a secure SPRP even with a secure-PRF round function, since an adversary with access to $F^(-1)$ can peel off a round. 4 rounds suffice (Patarin).

= Exercises
These practice problems have the purpose of helping you understand the material better and learning the skills that are necessary to analyze cryptographic constructions, and sometimes to prepare you for the next class. All answers should be supported by a written justification. To gauge whether a justification is sufficient, ask yourself if your peers would be convinced by it without additional explanations.

We denote vectors as $x in {0,1}^lambda$. By $x[i]$ we denote the $i$th index of $x$, where $i in {1,...,lambda}$. As in the lecture, we write $k <- K$ if $k$ is sampled from the set $K$ such that it can be each element from $K$ with equal probability $1/abs(K)$.

=== Exercise 1. (Triple the DES!)

In the lecture you learned about the DES Pseudorandom Permutation (PRP) or block cipher, which has block size $B = 64$ and key length $lambda = 56$. We denote its algorithms as $"DES.Keygen"$, $"DES.Enc"$, $"DES.Dec"$. A well-known variation of the DES algorithm is called Triple-DES and works as follows:

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    pseudocode-list(title: [3DES.Keygen()])[
      + Compute $k_1,k_2,k_3 <- "DES.Keygen"()$.
      + *Output* $k = (k_1,k_2,k_3)$.
    ],
    pseudocode-list(title: [3DES.Enc$(k,m)$])[
      + Check that $k = (k_1,k_2,k_3)$.
      + *Output* $"DES.Enc"(k_3, "DES.Dec"(k_2, "DES.Enc"(k_1,m)))$.
    ],
  )
]

+ Find the missing 3DES.Dec algorithm and argue why the overall scheme is correct.
+ In a so-called brute-force attack, an attacker tries out all possible keys from the keyspace until it finds the one which decrypts a ciphertext. Assume that we are given a DES plaintext/ciphertext pair $m, c = "DES.Enc"(k,m)$ for an unknown key $k$. Our goal is to find $k$. Further, assume for simplicity that one DES.Enc and thus DES.Dec-operation takes 1ns of time on a computer of your choice.
  + How many days does it take to recover the one (or more) keys which would have led to the given plaintext/ciphertext pair using the computer?
  + Assume you have 1024 such machines at your disposal. Can you use these machines to speed up the brute-force attack? How long will the attack take now?
  + Compute the same attack runtime for 3DES. You may want to compare the runtime of the attack to the age of the universe, which is estimated at 13.8 billion years.

#solution[

  1.
  #pseudocode-list(title: [3DES.Dec$(k,m)$])[
    + Check that $k = (k_1,k_2,k_3)$.
   + *Output* $"DES.Dec"(k_1, "DES.Enc"(k_2, "DES.Dec"(k_3, x)) )$.
  ]


  #let nano = (2 * calc.pow(2, 56))
  2.

    1. $2^56$ is the given keyspace of $k_1$ given a guess takes 1 ns that gives us $2 "ns" dot 2^56 = #nano "ns" <==> #calc.round(nano * 1.15574 * calc.pow(10, -14))$ days

    2. Given an even division between the $1024$ machines, that should take $1666/1024$ days, or equivalently $1.63$ days

    3. With 3DES we have a keyspace of $2^56 dot 2^56 dot 2^56$, assuming again 1 ns per encryption and decryption we get $7.483 dot 10^50 "ns"$ or equivalently $2.371 dot 10^34 "years"$ or in relation to the universe $1.7 dot 10^24 dot "age of the universe"$, with 1024 machines that brings it down to $approx 1.7 dot 10^21 dot "age of the universe"$


]

=== Exercise 2. (There are more PRFs)

In the class, you learned what a Pseudorandom Function, or PRF for short, is: It is a function $F : {0,1}^lambda times {0,1}^"in" -> {0,1}^"out"$ such that $cal(L)^F_"prf-real"$ and $cal(L)^F_"prf-rand"$ are indistinguishable.

Assume that you have such a PRF $F$ given. Let $r in {0,1}^"out"$ be any fixed, publicly known string, and define the function $G : {0,1}^lambda times {0,1}^"in" -> {0,1}^"out"$ as $G(k,x) = F(k,x) xor r$.

Show that $G$ is also a PRF. To prove this, it is instructive to follow the steps below:
+ Write down the *Lookup* functions in the libraries $cal(L)^G_"prf-real"$ and $cal(L)^G_"prf-rand"$.
+ Find a way to rewrite $cal(L)^G_"prf-real"$ into another library $overline(cal(L))^G_"prf-real"$ which uses $cal(L)^F_"prf-real"$.
+ You can now apply the hybrid technique to switch out $cal(L)^F_"prf-real"$ with $cal(L)^F_"prf-rand"$.
+ Based on this, find an argument how to complete indistinguishability of the resulting library with $cal(L)^G_"prf-rand"$.

#solution[
  
]

=== Exercise 3. (Breaking (versions of) AES)

In lecture, we discussed the design of AES. In this exercise, we want to get an understanding of the function of the different steps of AES by considering what happens to the security of AES when we remove those steps. You can assume that an attacker can get access to chosen plaintext-ciphertext pairs. Consider breaking AES by determining a new plaintext-ciphertext pair that the attacker has not been given.

+ (Warm-up) How difficult would it be to break AES if the AddRoundkey step was removed?
+ How difficult would it be to break AES if the MixColumns step was removed?
+ How difficult would it be to break AES if the ShiftRows step was removed?
+ (Harder) How difficult would it be to break AES if the SubBytes step was removed?
