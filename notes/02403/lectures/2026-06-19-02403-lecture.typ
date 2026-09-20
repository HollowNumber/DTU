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
  title: "Lecture - June 19, 2026",
  date: datetime(year: 2026, month: 6, day: 19),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

= Lecture 10

== F-distribution
=== Pooled variance setup
We want to investigate:
$
  H_0: mu_1 = mu_2
$

Then under the assumptions and the null hypothesis the test statistic:

$
  T_"obs" = (overline(Y)_1 - overline(Y)_2) / (S_p sqrt(1/n_1 + 1/n_2))
$

follows a t-distribution with $n_1 + n_2 - 2$ degrees of freedom, and hence:

$
  T^2_"obs" = ((overline(Y)_1 - overline(Y)_2)^2) / (S^2_p (1/n_1 + 1/n_2)) tilde F(1, n_1 + n_2 - 2)
$

where:
$
  S^2_p = ((n_1 - 1) S^2_1 + (n_2 - 1) S^2_2) / (n_1 + n_2 - 2)
$

=== Generalisation to k groups

We want to investigate $mu_1 = mu_2 = dots = mu_k$. The generalization of the two-sample t-test gives:

$
  F = (1/(k-1) sum_(i=1)^k n_i (overline(Y)_i - overline(Y))^2) / S^2_p tilde F(k-1, n-k)
$

where $S^2_p$ is the best (pooled) estimator for $sigma^2$ and $n = sum_i n_i$.

== Introduction

=== One-Way Analysis of Variance

$
  A: [2.8, 3.8, 3.4, 2.3] \
  B: [5.5, 6.3, 6.1, 5.7] \
  C: [5.8, 8.3, 6.9, 6.1]
$

Is there a difference (in mean) between groups A, B, and C? Analysis of variance (ANOVA) can be used for the analysis, provided the observations in each group can be assumed to be normally distributed.

The mean for each group is:

$
  overline(y)_A = (2.8 + 3.8 + 3.4 + 2.3) / 4 = 3.075 \
  overline(y)_B = (5.5 + 6.3 + 6.1 + 5.7) / 4 = 5.9 \
  overline(y)_C = (5.8 + 8.3 + 6.9 + 6.1) / 4 = 6.775
$

== Model and Hypotheses
=== One-Way Analysis of Variance - Model
The model can be written as:
$
  Y_(i,j) = mu_i + epsilon_(i,j), quad epsilon_(i,j) tilde N(0, sigma^2) "and iid."
$
such that $E[Y_(i,j)] = mu_i$. The null hypothesis is $H_0: mu_i = mu_j, forall (i,j)$.

The model can also be formulated as:
$
  vb(Y) = vb(X) beta + vb(epsilon), quad vb(epsilon) tilde N(0, sigma^2 I)
$

A simple parametrization of the design matrix $X$ is:
$
  vb(X)_1 = mat(
    bb(1)_(n_1), bb(0)_(n_1), dots.c, bb(0)_(n_1); bb(0)_(n_2), bb(1)_(n_2), dots.c, bb(0)_(n_2); dots.v, dots.v, dots.down, dots.v; bb(0)_(n_k), bb(0)_(n_k), dots.c, bb(1)_(n_k);
  )
$

where $beta_i = mu_i$ and the null hypothesis is $H_0: beta_i = beta_j$.

A more common parametrization (treatment-contrast) is $X_2$ with first column all-ones, and:
$
  H_0: beta_i = 0 "for" i > 1
$

The chapter 8 parametrization uses $Y_(i,j) = mu + alpha_i + epsilon_(i,j)$ with constraint $sum_i n_i alpha_i = 0$, and:
$
  H_0: alpha_i = 0 "for all" i
$

In all cases the null hypothesis corresponds to the reduced design matrix $X_0 = bb(1)$.

== Computation: Variance Decomposition and ANOVA Table

The total variation in data can be decomposed:
$
  "SST" = "SS(Tr)" + "SSE"
$

/ SST (Total): $display(sum_(i=1)^k sum_(j=1)^(n_i) (y_(i j) - overline(y))^2 = Y^TT (I - H_0) Y)$, with $n - 1$ degrees of freedom.

/ SS(Tr) (Treatment): $display(sum_(i=1)^k n_i (overline(y)_i - overline(y))^2 = Y^TT (H - H_0) Y)$, with $k - 1$ degrees of freedom. This is the between-group variation explained by the model.

/ SSE (Residual): $display(sum_(i=1)^k sum_(j=1)^(n_i) (y_(i j) - overline(y)_i)^2 = Y^TT (I - H) Y)$, with $n - k$ degrees of freedom. This is the within-group variation left unexplained.

=== Parameter Estimates

$
  hat(mu) = overline(y), quad hat(alpha)_i = overline(y)_i - overline(y), quad hat(sigma)^2 = "MSE" = "SSE" / (n - k)
$

=== ANOVA Table

#table(
  columns: (auto, auto, auto, auto, auto),
  table.header[*Source*][*df*][*SS*][*MS*][*F*],
  [Treatment], [$k-1$], [$"SS(Tr)"$], [$"MS(Tr)" = "SS(Tr)"/(k-1)$], [$F_"obs" = "MS(Tr)"/"MSE"$],
  [Residual], [$n-k$], [$"SSE"$], [$"MSE" = "SSE"/(n-k)$], [],
  [Total], [$n-1$], [$"SST"$], [], [],
)

#note-box(title: "Python")[
  ```python
  D = pd.DataFrame({'y': y, 'group': group})
  model = smf.ols('y ~ C(group)', data=D).fit()
  print(sm.stats.anova_lm(model, typ=1))
  ```
]

== Hypothesis Testing (F-test)

The F-test statistic (Theorem 8.6):
$
  F_"obs" = "MS(Tr)" / "MSE" = ("SS(Tr)" \/ (k-1)) / ("SSE" \/ (n-k)) tilde F(k-1, n-k) "under" H_0
$

Reject $H_0$ if $F_"obs" > F_(1-alpha)(k-1, n-k)$, i.e. p-value $= P(F > F_"obs") < alpha$.

== Variability and relation with the t-test for two samples

#theorem(title: "8.4")[
  The residual mean square is the average within-group variability:
  $
    "MSE" = "SSE" / (n-k) = ((n_1-1)s^2_1 + dots.c + (n_k-1)s^2_k) / (n-k)
  $

  When $k = 2$ this reduces to the pooled variance $S^2_p$, and:
  $
    F_"obs" = t^2_"obs"
  $
  where $t_"obs"$ is the pooled two-sample t-test statistic.
]

== Post hoc comparisons

ANOVA only tells you that *at least one* group mean differs. Post-hoc comparisons identify *which* pairs differ.

==== Method 8.9: Post hoc confidence interval

A $1-alpha$ confidence interval for the difference $mu_i - mu_j$ is:
$
  overline(y)_i - overline(y)_j plus.minus t_(1-alpha/2) sqrt("MSE" (1/n_i + 1/n_j))
$
where $t_(1-alpha/2)$ is from $t(n-k)$.

If all $M = k(k-1)/2$ pairwise intervals are computed, apply the Bonferroni correction $alpha_"Bonferroni" = alpha / M$.

==== Method 8.10: Post hoc pairwise hypothesis test

For $H_0: mu_i = mu_j$ vs $H_1: mu_i != mu_j$:
$
  t_"obs" = (overline(y)_i - overline(y)_j) / sqrt("MSE" (1/n_i + 1/n_j))
$
compared against $t(n-k)$. Apply Bonferroni correction $alpha_"Bonferroni" = alpha/M$ when doing all $M$ pairwise tests.

#note-box(title: "Python")[
  ```python
  from statsmodels.stats.multicomp import pairwise_tukeyhsd
  print(pairwise_tukeyhsd(endog=y, groups=group, alpha=0.05))
  ```
]

== Model validation

The model $Y_(i,j) = mu + alpha_i + epsilon_(i,j)$ requires checking:

- *Identically distributed*: compare within-group variation via boxplots — groups should have similar spread.
- *Normality*: Q-Q plot of residuals.
- *Independence*: if data is a time series, check for serial correlation.

#note-box(title: "Python")[
  ```python
  res = model.resid
  fig, ax = plt.subplots(1, 2, figsize=(10, 4))
  stats.probplot(res, dist="norm", plot=ax[0])
  ax[0].set_title('Q-Q plot of residuals')
  D.boxplot(column='y', by='group', ax=ax[1])
  plt.tight_layout()
  plt.show()
  ```
]

