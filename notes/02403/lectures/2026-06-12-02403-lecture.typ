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
  title: "Lecture - June 12, 2026",
  date: datetime(year: 2026, month: 6, day: 12),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

= Lecture
== Matrix formulation of statistical models

#example(
  title: "two-observation model",
)[
  Plan a (small) sample with two observations $Y_1, Y_2$, iid. $N(mu, sigma^2)$-distributed. The estimator for the mean is $hat(mu) = 1/2 (Y_1 + Y_2)$. Show that the model can be written as
  $
    Y = bold(1) mu + epsilon; quad epsilon tilde N(0, sigma^2 I)
  $
  and that, inserting the estimators, the model can be written as
  $
    Y = bold(1) hat(mu) + r = A Y + (I - A) Y
  $
  with $A Y = bold(1) hat(mu)$.

  #solution()[
    With $Y = [Y_1, Y_2]^T$, $bold(1) = [1,1]^T$ and $epsilon = [epsilon_1, epsilon_2]^T$, the model $Y_i = mu + epsilon_i$ stacks directly into $Y = bold(1) mu + epsilon$ with $epsilon tilde N(0, sigma^2 I)$ since the $epsilon_i$ are iid. $N(0, sigma^2)$.

    The fitted values are $bold(1) hat(mu) = bold(1) dot 1/2 (Y_1 + Y_2) = 1/2 bold(1) bold(1)^T Y = A Y$ with
    $
      A = 1/2 mat(1, 1; 1, 1)
    $
    and the residuals are $r = Y - bold(1) hat(mu) = (I - A) Y$, so $Y = A Y + (I - A) Y$.
    We will be interested in the distributions related to $A Y$ and $(I - A) Y$.
  ]
]

== The $chi^2$-distribution and the multivariate normal

#theorem()[
  If $Z_i tilde N(0,1)$, $i in {1, ..., n}$, iid., then $sum_(i=1)^n Z_i^2 tilde chi^2(n)$. It follows directly that if $Z tilde N_n (0, I)$ then
  $
    Z^T Z tilde chi^2(n)
  $
]

#theorem(
  title: "Corollary 9.18",
)[
  If $Y tilde N_n (mu, Sigma)$ then
  $
    (Y - mu)^T Sigma^(-1) (Y - mu) tilde chi^2(n)
  $
]

#proof()[
  By the eigendecomposition (Lemma 9.3) $Sigma = V Lambda V^T$ with $V$ orthonormal. Define $Z = Lambda^(-1\/2) V^T (Y - mu)$, a linear transformation of a normal vector, with
  $
    E[Z] = 0; quad V[Z] = Lambda^(-1\/2) V^T Sigma V Lambda^(-1\/2) = Lambda^(-1\/2) Lambda Lambda^(-1\/2) = I
  $
  so $Z tilde N_n (0, I)$. Since $Sigma^(-1) = V Lambda^(-1) V^T = (Lambda^(-1\/2) V^T)^T (Lambda^(-1\/2) V^T)$:
  $
    (Y - mu)^T Sigma^(-1) (Y - mu) = Z^T Z tilde chi^2(n)
  $
]

The result can be used to draw *probability regions*: the set ${y : (y - mu)^T Sigma^(-1) (y - mu) <= chi^2_(1-alpha)(n)}$ is an ellipsoid containing $Y$ with probability $1 - alpha$.

#example()[
  Let $[Y_1, Y_2]^T tilde N(0, I)$ and define $Z = Y_1 + Y_2$. For the random vector $[Y_1, Z]^T$ write down $Sigma$ and draw a $95%$ probability region.

  #solution()[
    $
      V[Y_1] = 1; quad V[Z] = V[Y_1] + V[Y_2] = 2; quad "Cov"[Y_1, Z] = "Cov"[Y_1, Y_1 + Y_2] = 1
    $
    so
    $
      Sigma = mat(1, 1; 1, 2); quad Sigma^(-1) = mat(2, -1; -1, 1)
    $
    The $95%$ probability region is the ellipse
    $
      {(y_1, z) : 2 y_1^2 - 2 y_1 z + z^2 <= chi^2_(0.95)(2) approx 5.99}
    $
    tilted along the direction of positive correlation ($rho = 1\/sqrt(2) approx 0.71$).
  ]
]

== Projections and Cochran's theorem

#definition(
  title: "Orthogonal projections",
)[
  A matrix $P$ is an orthogonal projection matrix if and only if
  - $P$ is symmetric, i.e. $P = P^T$
  - $P$ is idempotent, i.e. $P^2 = P$
]

#theorem(
  title: "Properties of orthogonal projection matrices (Lemma 9.22)",
)[
  If $P$ is an orthogonal projection matrix, then
  + The eigenvalues $lambda_i$ of $P$ are either $0$ or $1$, and $"Rank"(P) = sum_i lambda_i$.
  + $"Rank"(P) = "Trace"(P)$.
  If $P$ is a projection matrix then $I - P$ is also a projection matrix.
]

#proof()[
  (Property 2.) $P$ symmetric gives $P = V Lambda V^T$ with $V$ orthonormal. By the cyclic property of the trace:
  $
    "Trace"(P) = "Trace"(V Lambda V^T) = "Trace"(Lambda V^T V) = "Trace"(Lambda) = sum_i lambda_i = "Rank"(P)
  $
  where the last equality is property 1.
]

#example()[
  For the two-observation model, show that $A = 1/2 bold(1) bold(1)^T$ and $I - A$ are both orthogonal projection matrices and find their ranks.

  #solution()[
    *Symmetry:* $A^T = 1/2 (bold(1) bold(1)^T)^T = A$, and $(I - A)^T = I - A$.

    *Idempotency:* using $bold(1)^T bold(1) = 2$:
    $
      A^2 = 1/4 bold(1) (bold(1)^T bold(1)) bold(1)^T = 1/4 bold(1) dot 2 dot bold(1)^T = A
    $
    and $(I - A)^2 = I - 2A + A^2 = I - A$.

    *Ranks:* $"Rank"(A) = "Trace"(A) = 1/2 + 1/2 = 1$ and $"Rank"(I - A) = "Trace"(I) - "Trace"(A) = 2 - 1 = 1$.
  ]
]

#theorem(
  title: "Cochran's theorem",
)[
  Let $Y tilde N_n (0, sigma^2 I)$, and let $H_i$ be orthogonal projection matrices such that
  $
    1/sigma^2 Y^T Y = 1/sigma^2 sum_(i=1)^K Y^T H_i Y
  $
  i.e. $sum_(i=1)^K H_i = I_n$, with $"Rank"(H_i) = p_i$ and $sum_i p_i = n$, then
  + $1/sigma^2 Y^T H_i Y tilde chi^2(p_i)$
  + $Y^T H_i Y$ and $Y^T H_j Y$ are independent for $i != j$.
]

#example(
  title: "a test statistic",
)[
  For the two-observation model, assuming $mu = 0$, what is the distribution of
  $
    F = (2 overline(Y)^2) / (r^T r)
  $

  #solution()[
    The numerator is the squared norm of the fitted values:
    $
      Y^T A Y = (A Y)^T (A Y) = norm(bold(1) overline(Y))^2 = 2 overline(Y)^2
    $
    and the denominator is $r^T r = Y^T (I - A) Y$. With $mu = 0$ we have $Y tilde N_2 (0, sigma^2 I)$, and $A + (I - A) = I$ with ranks $1 + 1 = 2 = n$, so by Cochran's theorem
    $
      1/sigma^2 Y^T A Y tilde chi^2(1); quad 1/sigma^2 Y^T (I - A) Y tilde chi^2(1)
    $
    and the two are independent. Hence
    $
      F = (Y^T A Y \/ 1) / (Y^T (I - A) Y \/ 1) tilde F(1, 1)
    $
    The $sigma^2$ cancels — the test statistic does not depend on the unknown variance.
  ]
]

== The general linear model

#definition(
  title: "The general linear model",
)[
  The general linear model (LM) is a statistical model of the form
  $
    Y = X beta + epsilon; quad epsilon tilde N_n (0, sigma^2 I)
  $
  or equivalently $Y tilde N_n (X beta, sigma^2 I)$, where
  - $Y$ are the observations
  - $X$ is the design matrix
  - $beta$ is a vector of parameters
  - $epsilon$ are the residuals
]

Central questions: how do we construct $X$ (and is it unique)? How do we estimate $beta$? What is the best estimate of $sigma^2$?

#example(
  title: "the design matrix",
)[
  Two items A and B are weighed on a balance, first separately then together, giving observations $y_1, y_2, y_3$. Measurement errors are iid. normal. Write the design matrix when:
  + $beta_1$ is the weight of item 1 and $beta_2$ is the weight of item 2.
  + $beta_1$ is the weight of item 1 and $beta_2$ is the difference in weight between item 2 and 1.
  + $beta_1$ is the average weight of items 1 and 2, and $beta_2$ the deviation between the average and the individual weights.

  #solution()[
    Let $mu_1, mu_2$ be the true weights. The mean of the observations is $[mu_1, mu_2, mu_1 + mu_2]^T$ in all cases — only the parametrization changes.

    + $beta = [mu_1, mu_2]$:
      $
        X_1 = mat(1, 0; 0, 1; 1, 1)
      $
    + $beta = [mu_1, mu_2 - mu_1]$, i.e. $mu_2 = beta_1 + beta_2$:
      $
        X_2 = mat(1, 0; 1, 1; 2, 1)
      $
    + $beta = [(mu_1 + mu_2)/2, (mu_1 - mu_2)/2]$, i.e. $mu_1 = beta_1 + beta_2$, $mu_2 = beta_1 - beta_2$:
      $
        X_3 = mat(1, 1; 1, -1; 2, 0)
      $
    The design matrix is *not* unique — it depends on the chosen interpretation of $beta$.
  ]
]

#theorem(
  title: "Least squares estimator",
)[
  For the general linear model, the least squares estimator minimizes the residual sum of squares
  $
    hat(beta) = "argmin"_beta "RSS"(beta); quad "RSS"(beta) = r^T r = (Y - X beta)^T (Y - X beta)
  $
  and is given by
  $
    hat(beta) = (X^T X)^(-1) X^T Y; quad V[hat(beta)] = sigma^2 (X^T X)^(-1)
  $
]

#example()[
  In the items-on-a-scale example find the optimal parameters for each choice of design matrix.

  #solution()[
    *Parametrization 1:* $X_1^T X_1 = mat(2, 1; 1, 2)$, $(X_1^T X_1)^(-1) = 1/3 mat(2, -1; -1, 2)$, $X_1^T y = [y_1 + y_3, y_2 + y_3]^T$:
    $
      hat(beta)_1 = (2 y_1 - y_2 + y_3)/3; quad hat(beta)_2 = (-y_1 + 2 y_2 + y_3)/3
    $
    *Parametrization 2:* $X_2^T X_2 = mat(6, 3; 3, 2)$, giving
    $
      hat(beta)_1 = (2 y_1 - y_2 + y_3)/3; quad hat(beta)_2 = y_2 - y_1
    $
    *Parametrization 3:* $X_3^T X_3 = mat(6, 0; 0, 2)$, giving
    $
      hat(beta)_1 = (y_1 + y_2 + 2 y_3)/6; quad hat(beta)_2 = (y_1 - y_2)/2
    $
    All three agree: e.g. $hat(mu)_2 - hat(mu)_1 = y_2 - y_1$ matches $hat(beta)_2$ in parametrization 2.
  ]
]

#definition(
  title: "Orthogonal parametrization",
)[
  A parametrization is called orthogonal if $(X^T X)_(i j) = 0$ for $i != j$.
]

An orthogonal parametrization implies the covariance between parameter estimators is zero (since $V[hat(beta)] = sigma^2 (X^T X)^(-1)$ is diagonal). Strong correlation between parameters is referred to as *multicollinearity*. In the items-on-a-scale example only parametrization 3 is orthogonal ($X_3^T X_3$ is diagonal).

=== The general linear model as a projection

The fitted values in an LM can be written as
$
  hat(Y) = X hat(beta) = X (X^T X)^(-1) X^T Y = H Y
$
and the observed residuals as
$
  r = Y - hat(Y) = (I - H) Y
$
where:
- $H$ is an orthogonal projection matrix (the "hat" matrix)
- $r$ and $hat(Y)$ are independent
- The dimension of the model is $"Trace"(H) = "Rank"(X) = p$
- If two design matrices have the same projection matrix the models are *equivalent*

=== Geometric interpretation

$hat(Y) = H Y$ is the orthogonal projection of $Y$ onto the column space of $X$. With
$
  norm(y) = sqrt(y^T y); quad norm(hat(y)) = sqrt(y^T H y); quad norm(y - hat(y)) = sqrt(y^T (I - H) y)
$
and since $hat(y)$ and $r = y - hat(y)$ are orthogonal it follows (Pythagoras) that
$
  norm(y)^2 = norm(hat(y))^2 + norm(y - hat(y))^2
$

#example(
  title: "items on a scale, test strategy",
)[
  Using the items-on-a-scale example, formulate a partitioning of variation of the form
  $
    Y^T Y = Y^T H_0 Y + Y^T (H_1 - H_0) Y + Y^T (I - H_1) Y
  $
  where $H_0$ corresponds to the assumption that the two items have the same weight. Under the assumption, what is the distribution of
  $
    F = (Y^T (H_1 - H_0) Y) / (Y^T (I - H_1) Y)
  $
  Assume you have observed $y = [10, 20, 40]$, is that unusual under the assumption?

  #solution()[
    *Projections.* $H_1$ is the hat matrix of the full model ($X_1$, rank 2). Under $H_0$: $mu_1 = mu_2 = beta$, the design matrix reduces to $X_0 = [1, 1, 2]^T$ and
    $
      H_0 = X_0 (X_0^T X_0)^(-1) X_0^T = 1/6 mat(1, 1, 2; 1, 1, 2; 2, 2, 4); quad H_1 = 1/3 mat(2, -1, 1; -1, 2, 1; 1, 1, 2)
    $
    $H_0$, $H_1 - H_0$ and $I - H_1$ are mutually orthogonal projection matrices with ranks $1 + 1 + 1 = 3 = n$, since $"span"(X_0) subset "span"(X_1)$.

    *Distribution.* Under $H_0$, $E[Y] = X_0 beta in "span"(X_0)$, so $(H_1 - H_0) Y = (H_1 - H_0) epsilon$ and $(I - H_1) Y = (I - H_1) epsilon$ involve only the noise. By Cochran's theorem (applied to $epsilon tilde N_3 (0, sigma^2 I)$) the two quadratic forms are independent $sigma^2 chi^2(1)$ variables, hence
    $
      F = (Y^T (H_1 - H_0) Y \/ 1) / (Y^T (I - H_1) Y \/ 1) tilde F(1, 1)
    $

    *Observed data.* With $y = [10, 20, 40]$: direct computation gives $y^T (H_1 - H_0) y = (y_1 - y_2)^2 / 2 = 50$ and $y^T (I - H_1) y = 100/3 approx 33.33$ (check: $y^T H_0 y = 110^2/6 approx 2016.67$ and $2016.67 + 50 + 33.33 = 2100 = y^T y$). So
    $
      F = 50 / (100\/3) = 1.5; quad P(F(1,1) > 1.5) approx 0.44
    $
    Not unusual at all — there is no evidence against the assumption of equal weights.
  ]
]

