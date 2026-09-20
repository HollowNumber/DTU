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
#show raw: set text(font: "Liga SFMono Nerd Font", ligatures: true)

#show: dtu-note.with(
  course: "02403",
  course-name: "Introduction to mathematical statistics",
  title: "Lecture - June 11, 2026",
  date: datetime(year: 2026, month: 6, day: 11),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)

= Lecture
== The t-distribution

#definition()[
  if $Z tilde N(0,1)$ and $Q tilde chi^2(n)$ with Z and Q independent, then
  $
    T = Z/(sqrt(Q/n))
  $
  follows a t-distribution with $n$ degrees of freedom.
]

#theorem()[
  The probability function for a t-distribution is given by:
  $
    f_(T)(t) = (Gamma((n+1)/2))/(sqrt(n pi) Gamma(n/2)) (1 + t^2/n)^(-(n+1)/2); quad t in RR
  $
  where $n$ is the number of degrees of freedom and $Gamma()$ is the Gamma function.
]

=== The t-distribution as a sampling distribution

#theorem()[
  Let $Y_1,...,Y_n$ be iid. $tilde N(mu,sigma^2)$, then
  $
    T = (overline(Y) - mu) / (S \/ sqrt(n))
  $
  follows a t-distribution with $n-1$ degrees of freedom.
]

#proof()[
  We need to show that $T$ can be written as a standard normal divided by the square root of a $chi^2(n-1)$ variable, with independent numerator and denominator.

  + We have already shown that $overline(Y)$ and $S^2$ are independent.
  + $Z = (overline(Y) - mu) / (sigma \/ sqrt(n)) tilde N(0,1)$ and $Q = (n-1)/sigma^2 S^2 tilde chi^2(n-1)$
  + $
      T = (1/(sigma\/sqrt(n)) (overline(Y) - mu)) / sqrt((1/(sigma^2\/n) dot (n-1)/(n-1)) S^2\/n) = Z / sqrt(Q\/(n-1))
    $
    where $Z tilde N(0,1)$, hence $T$ follows a t-distribution with $n-1$ degrees of freedom.
]

#example(
  title: "confidence interval",
)[
  let $Y_1,...,Y_n$ be iid. $tilde N(mu,sigma^2)$ find $d$ such that $(0<alpha<0.5)$

  $
    1- alpha = P(overline(Y) - d dot S < mu < overline(Y) + d dot S)
  $

  #solution()[
    $
      P(overline(Y)−d dot S < µ < overline(Y) + d dot S) & = P(-d < (overline(Y) - mu)/S < d) \
                                                         & = P(-d sqrt(n) < (overline(Y) - mu)/(S/sqrt(n)) < d sqrt(n)) \
                                                         & = F_(T)(d sqrt(n)) - F_(T)(-d sqrt(n)) = 2 F_(T)(d sqrt(n)) - 1
    $
    by equating with $1−alpha$ and solving for $d$ we get:
    $
      d = 1/sqrt(n) F^(-1)_(T) (1-alpha/2) = t_(1-alpha/2)/sqrt(n)
    $
    where:
    - $t_(1-alpha/2)$ is the $1-alpha/2$ quantile of the t-distribution with $n-1$ degrees of freedom

    Hence we have:
    $
      1 - alpha = P(overline(Y) - t_(1-alpha/2)/sqrt(n) dot S < mu < overline(Y) + t_(1-alpha/2)/sqrt(n) dot S)
    $
    In practice: we are $95%$ confident that $mu$ is in the interval $overline(y) plus.minus t_(0.975) dot s\/sqrt(n)$.
  ]
]

== The F-distribution

#definition()[
  if $Q_1 tilde chi^2(n_1), Q_2 tilde chi^2(n_2)$, and $Q_1$ and $Q_2$ are independent, then
  $
    F = (Q_1\/n_1) / (Q_2\/n_2)
  $
  follows an F-distribution with $n_1$ and $n_2$ degrees of freedom.
]

#theorem()[
  The probability function for an $F$-distribution is given by
  $
    f_(F)(x) = frac((n_1/n_2)^(n_1/2) x^(n_1/2 - 1), B(n_1/2, n_2/2) (1+ n_1/n_2 x)^((n_1+n_2)/2)); quad x >= 0
  $
  where $B(v_1,v_2) = frac(Gamma(v_1) Gamma(v_2), Gamma(v_1 + v_2))$ is the beta function.
]

=== The F-distribution as a sampling distribution

#theorem()[
  Let $Y_(1,1),...,Y_(1,n_1)$ be iid. $N(mu_1, sigma_1^2)$ and let $Y_(2,1),...,Y_(2,n_2)$ be iid. $N(mu_2, sigma_2^2)$, then
  $
    F = (S_1^2 \/ sigma_1^2) / (S_2^2 \/ sigma_2^2) tilde F(n_1-1, n_2-1)
  $
  where $S_1^2$ and $S_2^2$ are the sample variances for $Y_1$ and $Y_2$.
]

#example()[
  Let $Y_(1,1),dots,Y_(1,10)$ be iid. $N(mu_1,sigma^2)$ and let $Y_(2,1),dots,Y_(2,10)$ be iid. $N(mu_2,sigma^2)$. Find: $P(S^2_1/S^2_2 > 2)$

  where $S^2_1$ and $S^2_2$ are the sample variances of the two samples.

  - Assume that you in a concrete study observe $S^2_1/S^2_2 = 2$, what would your assessment of the assumption of equal variance in the two populations be?

  #solution()[
    Since $sigma_1^2 = sigma_2^2$, we have $F = S_1^2\/S_2^2 tilde F(9,9)$.
    $
      P(S_1^2\/S_2^2 > 2) = 1 - F_F (2) approx 0.146
    $
    Observing $s_1^2\/s_2^2 = 2$ occurs with probability $approx 14.6%$ under equal variances — not unusual, so there is no strong evidence against the assumption of equal variance.
  ]
]

== Sampling distributions in statistics

=== Two independent samples

Assume a study with two independent populations $Y_(1,1),...,Y_(1,n_1)$ and $Y_(2,1),...,Y_(2,n_2)$, with $Y_(1,i) tilde N(mu_1, sigma^2)$ iid. and $Y_(2,i) tilde N(mu_2, sigma^2)$ iid. (same $sigma^2$).

#definition(title: "Pooled variance")[
  The best estimator of the common $sigma^2$ is the pooled sample variance:
  $
    S_p^2 = ((n_1-1)S_1^2 + (n_2-1)S_2^2) / (n_1+n_2-2)
  $
]

#theorem()[
  Under the assumption $mu_1 = mu_2$:
  $
    T = (overline(X) - overline(Y)) / (S_p sqrt(1/n_1 + 1/n_2)) tilde t(n_1+n_2-2)
  $
]

=== Three independent samples

Assume samples from three independent populations $Y_(i,1),...,Y_(i,n_i)$, $i in {1,2,3}$, with $Y_(i,j) tilde N(mu_i, sigma^2)$ iid.

Under the hypothesis $mu_1 = mu_2 = mu_3 = mu$, let $overline(Y) = 1/(n_1+n_2+n_3) sum_(i=1)^3 sum_(l=1)^(n_i) Y_(i l)$. Then:

$
  F = (1/(3-1) sum_(i=1)^3 n_i (overline(Y)_i - overline(Y))^2) / S_p^2 tilde F(2, n_1+n_2+n_3-3)
$

#example(
  title: "one-way ANOVA F-test",
)[
  Three fertilizer treatments are applied to crops. Yields (kg) are recorded:
  - Treatment 1 ($n_1 = 4$): $overline(Y)_1 = 12$, $S_1^2 = 2$
  - Treatment 2 ($n_2 = 4$): $overline(Y)_2 = 15$, $S_2^2 = 3$
  - Treatment 3 ($n_3 = 4$): $overline(Y)_3 = 13$, $S_3^2 = 2.5$

  Test $H_0: mu_1 = mu_2 = mu_3$ at significance level $alpha = 0.05$.

  #solution()[
    *Step 1: Grand mean.* Total $n = 4+4+4 = 12$.
    $
      overline(Y) = (n_1 overline(Y)_1 + n_2 overline(Y)_2 + n_3 overline(Y)_3) / n
      = (4 dot 12 + 4 dot 15 + 4 dot 13) / 12 = 160/12 approx 13.33
    $

    *Step 2: Between-group sum of squares (numerator).* With $k = 3$ groups:
    $
      "SS"_"between" = sum_(i=1)^3 n_i (overline(Y)_i - overline(Y))^2 & = 4(12-13.33)^2 + 4(15-13.33)^2 + 4(13-13.33)^2 \
                                                                       & = 4(1.78) + 4(2.79) + 4(0.11) \
                                                                       & approx 18.67
    $
    Mean square between: $"MS"_"between" = "SS"_"between" \/ (k-1) = 18.67 \/ 2 approx 9.33$.

    *Step 3: Pooled variance (denominator).* All $n_i = 4$, so $n_i - 1 = 3$ each:
    $
      S_p^2 = ((n_1-1)S_1^2 + (n_2-1)S_2^2 + (n_3-1)S_3^2) / (n - k)
      = (3 dot 2 + 3 dot 3 + 3 dot 2.5) / (12-3)
      = 22.5 / 9 = 2.5
    $

    *Step 4: F-statistic.*
    $
      F = "MS"_"between" / S_p^2 = 9.33 / 2.5 approx 3.73
    $
    Under $H_0$ this follows $F(2, 9)$.

    *Step 5: Critical value and conclusion.* The $0.95$ quantile of $F(2,9)$ is $approx 4.26$.

    Since $F approx 3.73 < 4.26$, we *fail to reject* $H_0$ at $alpha = 0.05$ — there is insufficient evidence that the fertilizer treatments differ in mean yield.
  ]
]

