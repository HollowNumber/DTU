#import "@local/dtu-template:0.6.3": *
#import "@preview/unify:0.8.1": num, numrange, qty, qtyrange, unit
#import "@preview/callisto:0.2.5"
#import "@preview/mitex:0.2.7": mitex
#import "@preview/cmarker:0.1.8"
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4"
#import "@preview/physica:0.9.8": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#codly(languages: codly-languages)
#show: codly-init.with()
#codly(fill: white, zebra-fill: black.lighten(95%), stroke: 1pt + black)

#show: dtu-note.with(
  course: "02403",
  course-name: "Introduction to mathematical statistics",
  title: "Lecture - June 10, 2026",
  date: datetime(year: 2026, month: 6, day: 10),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

== Non-linear function of random variables
=== Distrubution by simulation
we want to assess the distribution:

$
  Y = f(V_1,...,V_m)
$

where $V_1,...,V_m$ follow some specified distributions and f is some non-linear function.

to Simulate realisations $k (k>>1)$ of $V_1,dots,V_m$ we now have $v_(1,1),dots,v_(m,1),v_(1,2),..., v_(m,k)$

#example()[
  A Predator-Prey model is lotka-volterra model is given by the following system of coupled differential equations:

  $
    dd(x)/dd(t) = alpha x - beta x y \
    dd(y)/dd(t) = delta x y - gamma y
  $

  where $x$ is the prey population, $y$ is the predator population, and $alpha, beta, delta, gamma$ are parameters that govern the dynamics of the system.

  $K= y alpha e−beta y x gamma e−delta x$

  Assume that $alpha = 2/3, beta= 4/3, gamma= delta= 1$, and that:
  $
    X tilde N(1,1/(8^2)) \
    Y tilde N(1/2,1/(16^2))
  $

  further assume that X and Y are independent. Find (approximate)

  #solution()[
    ```py
    k = 10000
    alpha = 2/3
    beta = 4/3
    gamma = delta = 1
    sig_x = 1/8
    sig_y = 1/64
    mu_x = 1
    mu_y = 1/2
    x = stats.norm.rvs(size= k, loc = mu_x, scale = sig_x)
    y = stats.norm.rvs(size= k, loc = mu_y, scale = sig_y)
    K = y**alpha * np.exp(-beta * y) * x**gamma * np.exp(-delta * x)
    print("mu=",np.mean(K))
    print("sigma^2=",np.var(K, ddof = 1))
    print("sigma=",np.std(K,ddof = 1))
    ```

    $
           mu & = 0.11799946621549474 \
      sigma^2 & = 1.9150831331601936 dot 10^(-6) \
        sigma & = 0.0013838652872155562 \
    $
  ]
]

=== Error propagation
// TODO: finish this section
Generelisation:
$
  sigma^2_(f(Y_1,...,Y_n)) approx sum^n_(i=1) pdv(f, y_i)^2 sigma^2_(Y_i) + 2 sum^n_(i) sum^n_(j>i) pdv(f, y_i) pdv(f, y_j) sigma_(i j)
$

==== Error propagation by Taylor expansion
==== Error propagation - Matrix formulation

#example()[
  A simple predator-prey model is the Lotka-Volterra model

  Assume and that $E[X] = mu_x, E[Y] = mu_y, V[X] = sigma^2_x , V[Y] = sigma^2_y, "and" "Cov"(X,Y) = sigma_(x y)$
  Find the approximation of
  - The mean, variance and standard deviation of K
  - With $alpha = 2/3, beta= 4/3, gamma=delta=1, sigma^2_x = 1/8^2, sigma^2_y = 1/16^2, sigma_(x y) = 0, "and" mu_y = 1/2$, sketch the mean and variance of $K$ as a function of $mu_x$.

  #solution()[
    // TODO: finish this example with python
    ```py
    mu_x = np.arange(0.5,2,0.01)
    K = mu_y**alpha * np.exp(-beta * mu_y) * mu_x**gamma * np.exp(-delta * mu_x)
    Kx = K * (gamma / mu_x - delta)
    Ky = K * (alpha / mu_y - beta)
    Vk = Kx**2 * sig_x**2 +Ky**2 * sig_y**2
    fig, ax =plt.subplots(2,1)
    ax[0].plot(mu_x,K) ## mean
    ax[1].plot(mu_x,Vk) ## mean
    plt.tight_layout()
    ```
  ]
]

== The multivariate normal distribution
#definition()[
  A random vector $vb(Y) in RR^n$ with pdf given by

  $
    f_(vb(Y))(vb(y)) =
    1 / ((2 pi)^(n/2) sqrt(mdet(vb(Sigma)))) \
    e^(-1/2 (vb(y) - vb(mu))^TT vb(Sigma)^(-1) (vb(y) - vb(mu)))
  $

  is said to follow a multivariate normal distribution. we write:
  $
    vb(Y) tilde N(vb(mu), vb(Sigma))
  $
  the expected value and variance-covariance are:
  $
    E[vb(Y)] = vb(mu) \
    V[vb(Y)] = vb(Sigma)
  $

  as usual, we write: $vb(Sigma) = vb(sigma) vb(R) vb(sigma)$ where $vb(sigma)$ is a diagonal matrix, and $vb(R)_(i,j)$ is the correlation between $Y_i$ and $Y_j$.

]

==== Independence and correlation
#theorem()[
  if $vb(Y) = [vb(Y_1)^TT, vb(Y_2)^TT]^TT tilde N(vb(mu), vb(Sigma))$ and $"Cov"[vb(Y_1), vb(Y_2)] = 0$

  where:
  - $vb(Y_1)$ is a $k$-dimensional vector
  - $vb(Y_2)$ is a $(n-k)$-dimensional vector
  - $vb(mu) = [vb(mu_1)^TT, vb(mu_2)^TT]^TT$
  - $vb(Sigma) = [[Sigma_11, Sigma_12], [Sigma_21, Sigma_22]]$

  then $vb(Y_1)$ and $vb(Y_2)$ are independent.
]
Hence in general zero correlation does not imply independence, but for the multivariate
normal it does.

==== Normalization
#theorem(
  title: "Normalization of normal random vectors",
)[
  if $vb(Y) tilde N(vb(mu), vb(Sigma))$ with the pdf of $vb(Y)$ then $ vb(Z) = vb(Sigma)^(-1/2) (vb(Y) - vb(mu)) tilde N(0, I) $

  with $vb(Sigma) = vb(V) vb(Lambda) vb(V)^T$ and $vb(Sigma)^(1/2) = vb(V) vb(Lambda)^(1/2) vb(V)^T$, where $vb(Lambda)$ is the diagonal matrix of eigenvalues of $vb(Sigma)$ and $vb(V)$ contains the corresponding eigenvectors.

  // Maybe this needs to be finished/expanded?
  // something about covariance matrices being symmetric and therefore A=V Lambda V^(-1) and A = V Lambda V^T and therefore A^(1/2) = V Lambda^(1/2) V^T
]

==== general definition
#definition(
  title: "Multivariate normal distribution",
)[
  Let $Z_i, i=1,...,n$, be iid. standard normal random variables, s.t. $vb(Z) = [Z_1, ..., Z_n]^TT$

  $
    vb(Z) tilde N(0, I)
  $

  Then the random vector $vb(Y) = vb(A) vb(Z) + vb(b)$, with $vb(A) in RR^(m times n)$ and $vb(b) in RR^m$ follows an $m$-dimensional multivariate normal distribution with:
  $
    E[vb(Y)] & = vb(b) \
    V[vb(Y)] & = vb(A) vb(A)^TT
  $
  this holds also when $vb(A) vb(A)^TT$ is not positive definite.
]

#example()[
  You put an item (with a known weight) onto to a scale and record the error made by the scale. The procedure is repeated two times and the mean and standard error of the scale is assumed to be $0 g$, and $1 g$ respectively. The outcome are denoted $Z_1$ and $Z_2$,
  Now define:

  $
    r_i = Z_i - dash(Z)
  $

  - what is the distribution of $vb(r) = [r_1,r_2]$
  - what is the distribution of $[r^TT , dash(Z)]$

  #solution()[
    Assume $Z_1, Z_2$ are i.i.d. $N(0, 1)$. Then:
    $
      dash(Z) = (Z_1 + Z_2) / 2 \
      r_1 = Z_1 - dash(Z) = (Z_1 - Z_2) / 2 \
      r_2 = Z_2 - dash(Z) = -(Z_1 - Z_2) / 2 = -r_1
    $

    *1. Distribution of $vb(r)$* \
    $vb(r) = [r_1, r_2]^TT$ follows a degenerate bivariate normal distribution:
    $
      vb(r) tilde N(
        [0, 0]^TT,
        mat(1/2, -1/2; -1/2, 1/2)
      )
    $

    *2. Distribution of $[vb(r)^TT, dash(Z)]^TT$* \
    Since $"Cov"(r_i, dash(Z)) = 0$, the sample mean is independent of the residuals. The joint distribution is:
    $
      [r_1, r_2, dash(Z)]^TT tilde N(
        [0, 0, 0]^TT,
        mat(1/2, -1/2, 0; -1/2, 1/2, 0; 0, 0, 1/2)
      ) = mat(vb(A), 0; 0, 1/2)
    $
  ]
]

== Functions of Normal random variables
==== The framework of statistisk inferens
Language and concepts:
- $mu$ and $sigma$ are parameters that describe the populationen
- $dash(x)$ is an estimate of $mu$ (an actual outcome, a number)
- $dash(X)$ and $S^2$ are estimatorers of $mu$ and $sigma^2$ (these are random variables)
- The concept ’statistic(s)’ is used for both

// TODO: only first 21/40 slides have been covered.
=== Normal distribution as a sample distribution
#definition(
  title: "Central Estimator",
)[
  an estimator $hat(theta)$ is central or non-biased if and only if the mean value of the estimator is equal to $theta$
]

#definition(title: "Consistent Estimator")[
  A central estimator $hat(theta)$ that converge in probability is called a consistent estimator
  (you can think of this as $V(hat(theta)_n) -> 0$
]

#definition(title: "Efficient Estimator")[
  Efficient Estimator $hat(theta)_1$ is a more efficient estimator for $theta$ than $hat(theta)_2$ if:

  - $hat(theta)_1$ and $hat(theta)_2$ are both central estimators of $theta$
  - The variance of $hat(theta)_1$ is less than the variance of $hat(theta)_2$
]

#definition(
  title: "Estimate",
)[
  When we have the actual sample and have calculated the summary statistic, we have an estimate (this is not a random variabele)
]

#example()[
  if $Y_1,dots,Y_n$ are iid. $N(mu,sigma^2)$ random variables, then:

  - $overline(Y) = hat(mu)$ is a central estimator for $mu (E[overline(Y) = mu])$
  - $overline(Y)$ is also a consistent estimator for $mu (V[overline(Y)] = (sigma^2)/n -> 0, quad n -> oo)$
  - $overline(y)$ is an estimate of $mu$
  - THe median is also a central and consistent estimator for $mu$, but it is not as efficient.
]

=== The $chi^2$-distribution
#example()[
  Let $Y_1 tilde N(mu,sigma^2)$ and $Y_2 tilde N(mu, sigma^2)$ be independent random variables, what is the mean value of:

  $
    Q = (Y_1 - overline(Y))^2 + (Y_2 - overline(Y))^2
  $

  #solution()[
    We can rewrite $Q$ as:
    $
      Q = (Y_1 - overline(Y))^2 + (Y_2 - overline(Y))^2 \
      = (Y_1 - Y_2)^2 / 2
    $

    Since $Y_1 - Y_2 tilde N(0, 2 sigma^2)$, we have that:
    $
      E[Q] = E[(Y_1 - Y_2)^2 / 2] = sigma^2
    $
    // TODO: validate this solution. it's hard to see where sigma is introduced, and this doesn't make use of $mu$ at all. but the solution on the blackboard does
  ]
]

#theorem()[
  The probability function of a $chi^2$-Distribution is given by:
  $
    f(y) = 1/(2^(n/2) Gamma(n/2)) y^(n/2 - 1) e^(-y/2); quad y >= 0
  $

  where $Gamma$ is the Gamma function. and $n$ is the degrees of freedom, which is the number of independent standard normal random variables that are squared and summed to get the chi-squared distribution.
]

#example()[
  if $y_1,dots,y_10$ are iid. $N(mu, sigma^2)$ and:
  $
    Q = 1/(sigma^2) sum^10_(i=1) (Y_i - mu)^2
  $

  what is $P(Q > 10)$?

  #solution()[
    Since $Q$ is a sum of squares of 10 independent standard normal random variables, it follows a chi-squared distribution with 10 degrees of freedom. Therefore, we can calculate $P(Q > 10)$ using the cumulative distribution function (CDF) of the chi-squared distribution:

    $
      P(Q > 10) = 1 - P(Q <= 10) = 1 - F_(chi^2)(10; "df"=10)
    $

    where $F_{chi^2}(x; "df")$ is the CDF of the chi-squared distribution with $"df"$ degrees of freedom evaluated at $x$. We can use statistical software or chi-squared distribution tables to find this value.
  ]
]



// TODO: 2025June (25,26) Assignment 1 d)-e)

