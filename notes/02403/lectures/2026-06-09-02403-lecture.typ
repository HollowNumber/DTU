#import "@local/dtu-template:0.6.3":*
#import "@preview/unify:0.8.1": qty, unit, num, numrange, qtyrange
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
#show raw: set text(font: "Liga SFMono Nerd Font", ligatures: true)

#show: dtu-note.with(
  course: "02403",
  course-name: "Introduction to mathematical statistics",
  title: "Lecture - June 09, 2026",
  date: datetime(year: 2026, month: 6, day: 9),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

= Discrete vs. Continuous Random Variables

We distinguish between two types of random variables:

/ Discrete: Countable outcomes. E.g. number of people wearing glasses, number of flights departing from CPH per hour.

/ Continuous: Uncountable (interval-valued) outcomes. E.g. wind speed, transport time to DTU, blood sugar measurements, height.

*Convention:* Pre-experiment → capital $Y$ (random variable). Post-experiment → lowercase $y$ (realization/observation).

= Continuous Distributions

== Probability Density Function (pdf)

The pdf $f(y)$ describes the relative likelihood of outcomes. Key properties:

$
  P(a < Y <= b) = integral_a^b f(y) dif y
$

Note: $P(Y = y) = 0$ for all $y$ — no point mass exists for continuous distributions.

A valid pdf satisfies:
$
  f(y) >= 0 quad forall y, quad integral_(-oo)^(oo) f(y) dif y = 1
$

== Cumulative Distribution Function (cdf)

The cdf $F(y)$ gives the probability of being at most $y$:

$
  F(y) = P(Y <= y) = integral_(-oo)^y f(t) dif t
$

Key consequences:
- $f(y) = F'(y)$ (pdf is derivative of cdf)
- $P(a < Y <= b) = F(b) - F(a)$
- For continuous RVs: $P(Y <= y) = P(Y < y)$

== Mean and Variance

$
  mu = E[Y] = integral_(-oo)^(oo) y f(y) dif y
$

$
  sigma^2 = V[Y] = E[(Y - mu)^2] = integral_(-oo)^(oo) (y - mu)^2 f(y) dif y
$

= Concrete Continuous Distributions

#table(
  columns: (auto, 1fr, auto, auto, 2fr),
  stroke: 0.5pt,
  align: (left, center, center, center, left),
  table.header([*Distribution*], [*pdf*], [*$mu$*], [*$sigma^2$*], [*Typical use*]),
  [$Y ~ U(alpha, beta)$],
  [$display(1/(beta - alpha))$],
  [$display((alpha+beta)/2)$],
  [$display((beta-alpha)^2/12)$],
  [Uniform density on $(alpha, beta)$],
  [$Y ~ "Exp"(lambda)$],
  [$lambda e^(-lambda x)$],
  [$display(1/lambda)$],
  [$display(1/lambda^2)$],
  [Time between Poisson arrivals],
  [$Y ~ N(mu, sigma^2)$],
  [$display(1/(sigma sqrt(2pi)) e^(-(x-mu)^2 \/ (2sigma^2)))$],
  [$mu$],
  [$sigma^2$],
  [Measurement errors, sums of iid RVs],
  [$Y ~ "LN"(alpha, beta^2)$],
  [$display(1/(x beta sqrt(2pi)) e^(-("ln"(x)-alpha)^2 \/ (2beta^2)))$],
  [$e^(alpha + beta^2\/2)$],
  [$mu^2(e^(beta^2) - 1)$],
  [Concentrations, products of RVs],
)

= Calculation Rules for Mean and Variance

For random variable $Y$ and constants $a$, $b$:

$
  E[a Y + b] &= a E[Y] + b \
  V[a Y + b] &= a^2 V[Y]
$

For random variables $Y_1, dots, Y_n$:

$
  E[sum_(i=1)^n a_i Y_i] = sum_(i=1)^n a_i E[Y_i]
$

If additionally independent:

$
  V[sum_(i=1)^n a_i Y_i] = sum_(i=1)^n a_i^2 V[Y_i]
$

= The Normal Distribution

== Standard Normal

$Z ~ N(0, 1)$. Any $Y ~ N(mu, sigma^2)$ standardizes via:

$
  Z = (Y - mu) / sigma ~ N(0,1)
$

== Key Relations Between Distributions

- $Y_1 ~ N(mu_1, sigma_1^2)$ and $Y_2 ~ N(mu_2, sigma_2^2)$ independent $=>$ $Y_1 + Y_2 ~ N(mu_1 + mu_2, sigma_1^2 + sigma_2^2)$
- Inter-arrival times $~ "Exp"(lambda)$ $<=>$ counts in fixed interval $~ "Poisson"(lambda t)$
- $Y ~ N(mu, sigma^2) => e^Y ~ "LN"(mu, sigma^2)$
- For iid $Y_i$ with mean $mu$, variance $sigma^2$: $overline(Y) = 1/n sum Y_i approx N(mu, sigma^2/n)$ (exact when $Y_i ~ N$)

= Examples

#example(title: "Uniform — Bus Waiting Time")[
  One bus per hour; you arrive at 08:00. Model: $Y ~ U(0, 60)$ (minutes).

  *Prob. waiting more than 15 min:*
  $
    P(Y > 15) = integral_(15)^(60) 1/45 dif y = 45/60 = 3/4
  $

  *Prob. waiting exactly 15 min:*
  $
    P(Y = 15) = 0 quad "— continuous distribution, zero point mass"
  $

  *Prob. waiting more than 1 hour:*
  $
    P(Y > 60) = 0 quad "— outside support of" U(0,60)
  $
]

#example(title: "Exponential — Car Inter-Arrival Time (June 2024)")[
Road 2: $lambda_2 = 15 "cars/hour"$. Let $T$ = time between arrivals (in minutes).

Convert rate: $lambda_(2,"min") = 15/60 = 1/4 "cars/min"$, so $T ~ "Exp"(1/4)$.

$
  P(T > 2) = 1 - F(2) = e^(-lambda_(2,"min") dot 2) = e^(-1/2) approx 0.6065
$

```python
  import scipy.stats as stats
  # Two equivalent parameterizations:
  print(1 - stats.expon.cdf(2,   loc=0, scale=1/(15/60)))  # scale = 1/λ_per_min
  print(1 - stats.expon.cdf(2/60, loc=0, scale=1/15))      # converting to hours
  # Both give ≈ 0.6065
  ```
]

#example(title: "Log-Normal — Product of RVs (June 2022)")[
  Let $Y_i ~ "LN"(mu, sigma^2)$ iid. Find $P(Y_1 Y_2 > k)$.

  Since $ln(Y_i) ~ N(mu, sigma^2)$:
  $
    ln(Y_1 Y_2) = ln(Y_1) + ln(Y_2) ~ N(2mu, 2sigma^2)
  $

  Therefore:
  $
    P(Y_1 Y_2 > k) = P(ln(Y_1 Y_2) > ln(k)) = 1 - Phi lr(((ln(k) - 2mu) / (sigma sqrt(2))))
  $
  where $Phi$ is the standard normal cdf.
]

#example(title: "Normal — Airline Overloading (June 2024)")[
$Y_i ~ N(70, 10^2)$ iid (passenger weight in kg), $n = 55$ passengers, max load 4000 kg.

By linearity and independence of the $Y_i$:
$
  S = sum_(i=1)^55 Y_i ~ N(55 dot 70,\ 55 dot 10^2) = N(3850, 5500)
$

$
  P(S > 4000) = 1 - Phi lr(((4000 - 3850) / sqrt(5500))) = 1 - Phi(2.023) approx 0.0216
$

So approximately *2.2% chance* of overloading.

```python
  import numpy as np
  import scipy.stats as stats

  mu    = 70 * 55          # 3850
  sigma = np.sqrt(55 * 100) # sqrt(5500)
  p_overload = 1 - stats.norm.cdf(4000, mu, sigma)  # ≈ 0.02156

  # Quick z-score estimate:
  z = (4000 - mu) / sigma   # ≈ 2.0226
  ```
]

#example(title: "Standard Normal — Measurement Error")[
Scale error $Z ~ N(0,1)$ (grams).

+ $P(Z <= -2) = Phi(-2) approx 0.0228$
+ $P(Z >= 2) = 1 - Phi(2) approx 0.0228$ (by symmetry, same as a)
+ $P(-1 <= Z <= 1) = Phi(1) - Phi(-1) approx 0.6827$
+ Find $d$: $P(-d < Z < d) = 0.95 => d = Phi^(-1)(0.975) approx 1.960$
+ General: $P(mu - d < Y < mu + d) = 0.95 => d = 1.960 sigma$

```python
  stats.norm.cdf(-2)             # a) ≈ 0.02275
  1 - stats.norm.cdf(2)          # b) ≈ 0.02275
  stats.norm.cdf(1) - stats.norm.cdf(-1)  # c) ≈ 0.6827
  stats.norm.ppf(0.975)          # d) ≈ 1.9600
  ```
]

= Multivariate Distributions

== Joint and Marginal Densities

For $bold(Y) = [Y_1, dots, Y_n]^T$, joint pdf $f(bold(y)) >= 0$ with $integral dots.c integral f dif bold(y) = 1$.

Marginal density of $Y_i$: integrate out all other variables.

For $bold(Y) = [Y_1^T, Y_2^T]^T$:
$
  f_(Y_1)(bold(y)_1) = integral f_(bold(Y))(bold(y)) dif bold(y)_2
$

== Independence

$Y_1$ and $Y_2$ are independent $"iff"$:
$
  f_(bold(Y))(bold(y)) = f_(Y_1)(bold(y)_1) f_(Y_2)(bold(y)_2)
$

Independence $=>$ $"Cov"(Y_1, Y_2) = 0$. The converse is *not* generally true.

== Covariance and Correlation

$
  "Cov"[Y_i, Y_j] = sigma_(i j) = integral integral (y_i - mu_i)(y_j - mu_j) f_(Y_i, Y_j)(y_i, y_j) dif y_i dif y_j
$

Correlation coefficient:
$
  rho_(i j) = "Cov"[Y_i, Y_j] / sqrt(V[Y_i] V[Y_j]) in [-1, 1]
$

The variance-covariance matrix decomposes as $bold(Sigma) = bold(sigma) bold(R) bold(sigma)$, where $bold(sigma)$ is diagonal with $sigma_(i i) = sqrt(Sigma_(i i))$ and $R_(i j) = rho_(i j)$.

== Calculation Rules (General)

For $Z_1 = a_0 + a_1 Y_1 + a_2 Y_2$ and $Z_2 = b_0 + b_1 Y_1 + b_2 Y_2$:

$
  E[Z_1]          &= a_0 + a_1 E[Y_1] + a_2 E[Y_2] \
  V[Z_1]          &= a_1^2 V[Y_1] + a_2^2 V[Y_2] + 2 a_1 a_2 "Cov"(Y_1, Y_2) \
  "Cov"[Z_1, Z_2] &= a_1 b_1 V[Y_1] + a_2 b_2 V[Y_2] + (a_1 b_2 + a_2 b_1)"Cov"(Y_1, Y_2)
$

Matrix form (for random vectors with $V[bold(Y)] = bold(Sigma)$, constant matrix $bold(A)$, vector $bold(b)$):
$
  E[bold(A) bold(Y)_1 + bold(b)] &= bold(A) E[bold(Y)_1] + bold(b) \
  V[bold(A) bold(Y)_1]           &= bold(A) bold(Sigma)^(11) bold(A)^T
$

#example(title: "Marginals from Joint Density")[
  Joint: $f(y_1, y_2) = k y_1 y_2$ on $[0,1]^2$, zero elsewhere.

  *Find $k$:*
  $
    1 = integral_0^1 integral_0^1 k y_1 y_2 dif y_1 dif y_2 = k dot 1/2 dot 1/2 = k/4
    => k = 4
  $

  *Marginals:*
  $
    f_(Y_1)(y_1) = integral_0^1 4 y_1 y_2 dif y_2 = 4 y_1 dot 1/2 = 2 y_1, quad y_1 in [0,1]
  $
  By symmetry: $f_(Y_2)(y_2) = 2 y_2$.

  *Independence check:* $f(y_1, y_2) = 4 y_1 y_2 = (2 y_1)(2 y_2) = f_(Y_1)(y_1) f_(Y_2)(y_2)$ ✓

  *Moments:*
  $
    E[Y_1] = integral_0^1 y_1 dot 2 y_1 dif y_1 = 2/3, quad
    "Cov"[Y_1, Y_2] = 0 quad "— independent"
  $
]

#example(title: "Covariance Matrix — Linear Combination")[
  $Y_1 ~ N(2, 3)$, $Y_2 ~ N(0, 1)$, $"Cov"(Y_1, Y_2) = 0$. Let $Z = Y_1 + 2 Y_2$.

  $
    E[Z]          &= E[Y_1] + 2 E[Y_2] = 2 + 0 = 2 \
    V[Z]          &= V[Y_1] + 4 V[Y_2] = 3 + 4 = 7 \
    "Cov"[Y_1, Z] &= "Cov"[Y_1, Y_1 + 2 Y_2] = V[Y_1] + 2 "Cov"[Y_1, Y_2] = 3
  $

  Variance-covariance matrix of $[Y_1, Z]^T$:
  $
    bold(Sigma) = mat(3, 3;3, 7)
  $

  Diagonal std.\ dev.\ matrix and correlation matrix:
  $
    bold(sigma) = mat(sqrt(3), 0;0, sqrt(7)), quad
    bold(R) = mat(1, 3/(sqrt(3) sqrt(7));3/(sqrt(3) sqrt(7)), 1) approx mat(1, 0.655;0.655, 1)
  $
]

// EXERCISES + CALLISTO MATH

#let _nb-json = json("notebooks/2026-06-09-02403-lecture.ipynb")
#let _nb-lang = _nb-json.metadata.language_info.name
#let _nb = callisto.config(nb: _nb-json)

#{
  let cells = (_nb.cells)()
  let in-args = (lang: _nb-lang, raw-lang: none)
  let i = 0
  while i < cells.len() {
    let cell = cells.at(i)
    if cell.cell_type == "markdown" {
      let parts = cell.source.split("\n\n**Solution:**")
      if parts.len() >= 2 {
        // Question part — outside the solution box
        block(width: 100%, spacing: 1em,
          callisto.read-mime(parts.at(0), format: "text/markdown")
        )
        // Seed the solution content with the answer text
        let sol = (
          callisto.read-mime(
            parts.slice(1).join("\n\n**Solution:**"),
            format: "text/markdown"
          ),
        )
        i += 1
        // Absorb all following code cells into the same solution block
        while i < cells.len() and cells.at(i).cell_type == "code" {
          let c = cells.at(i)
          let code-part = {
            callisto.templates.notebook-input(c, input-args: in-args)
            callisto.templates.notebook-output(c, output-args: (:))
          }
          sol = sol + (code-part,)
          i += 1
        }
        solution(sol.join())
      } else {
        block(width: 100%, spacing: 1em,
          callisto.read-mime(cell.source, format: "text/markdown")
        )
        i += 1
      }
    } else if cell.cell_type == "code" {
      callisto.templates.notebook-input(cell, input-args: in-args)
      callisto.templates.notebook-output(cell, output-args: (:))
      i += 1
    } else {
      i += 1
    }
  }
}