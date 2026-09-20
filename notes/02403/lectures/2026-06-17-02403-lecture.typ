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
  title: "Lecture - June 17, 2026",
  date: datetime(year: 2026, month: 6, day: 17),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring",
)
= Lecture 8

== Linear regression models
We have n pairs of data points $(x_i, y_i)$.

If the data points lie on a straight line, the relationship between x and y values can be described by the equation:

$
  y = beta_0 + beta_1 x
$

==== The simple linear regression model
#definition(
  title: "The linear regression model",
)[
  $
    Y_i = beta_0 + beta_1 x_i + epsilon_i, quad i = 1,dots,n
  $

  or:

  $
    Y = vec(Y_1, dots.v, Y_n) = mat(1, x_1; dots.v, dots.v; 1, x_n) vec(beta_0, beta_1) + vec(epsilon_1, dots.v, epsilon_n) = X beta + epsilon
  $

  where:
  - $Y_i$ is the dependent variable (response variable)
  - $x_i$ is the explanatory variable.
  - $epsilon_i$ is the error term. (residual)
  - We assume $epsilon_i tilde N(0,sigma^2)$ (and iid.)

]
=== Least squares method
we want to estimate the parameters $beta_0$ and $beta_1$.

this is done by minimising the variance of the residuals ($sigma^2$), which leads to minimising the sum of the squared residuals (Residual Sum of Squares, RSS):
#definition(title: "RSS")[
  $
    "RSS"(beta_0, beta_1) = sum_(i=1)^n (Y_i - beta_0 - beta_1 x_i)^2 = (Y - X beta)^TT (Y - X beta)
  $
]
that ism we choose $hat(beta_0)$ and $hat(beta_1)$ such that they minimise the RSS.

#theorem(title: "5.4 (for estimators)")[
  "Least squares" estimators for $beta_0$ and $beta_1$ are given by:

  $
    hat(beta)_1 = (sum_(i=1)^n (x_i - overline(x)) (Y_i - overline(Y))) / (sum^n_(i=1) (x_i - overline(x)^2)) \
    hat(beta)_0 = overline(Y) - hat(beta)_1 overline(x)
  $

  or

  $
    hat(beta) = (X^TT X)^(-1) X^TT Y
  $
]

#note-box(title: "Python")[
  ```python
  D = pd.DataFrame({'x': x, 'y': y})
  linfit = smf.ols(formula='y ~ x', data=D).fit()
  print(linfit.summary(slim=True))
  ```
  The row `Intercept` gives values related to $beta_0$, and `x` gives values related to $beta_1$.
]

== Statistics and linear regression
==== Standard errors for $hat(beta_0)$ and $hat(beta_1)$
#theorem(title: "5.8 (first part)")[
  $
    V[hat(beta)_0] = sigma^2/n + (overline(x)^2 sigma^2)/(sum^n_(i=1) (x_i - overline(x))^2) \
    V[hat(beta)_1] = sigma^2 / (sum^n_(i=1) (x_i - overline(x))^2) \
    "Cov"[hat(beta)_0, hat(beta)_1] = - (overline(x) sigma^2)/ (sum^n_(i=1) (x_i - overline(x))^2)
  $

  or

  $
    V[hat(beta)] = sigma^2 (X^TT X)^(-1)
  $
]

#theorem(title: "5.8 (second part)")[
  Since $sigma^2$ is unknown, we use the central estimate for $sigma^2$:
  $
    sigma^2 = (op("RSS")(hat(beta_0), hat(beta_1)))/(n-2) = (sum^n_(i=1) e^2_i)/(n-2)
  $

  #note-box(title: [Why divide by $n-2$])[
    - $H = X (X^TT X)^(-1) X^TT$
    - $tr(vb(I)-vb(H)) = n-2 = n - rank(vb(X))$
    - $1/sigma^2 sum^n_(i=1) e^2_i Y^TT (vb(I) - vb(H)) Y tilde chi^2(n-2)$
  ]
]

==== Standard errors for $hat(beta)_0$ and $hat(beta)_1$
$
  hat(sigma)_(beta_0) = hat(sigma) sqrt(1/n + (overline(x)^2)/(sum^n_(i=1) (x_i - overline(x))^2)) \
  hat(sigma)_(beta_1) = hat(sigma) / sqrt(sum^n_(i=1) (x_i - overline(x))^2)
$

or

$
  [hat(sigma)_(beta_0), hat(sigma)_(beta_1)] = hat(sigma) sqrt(diag((X^TT X)^(-1)))
$

=== Hypothesis tests and confidence intervals for $beta_0$ and $beta_1$
#definition()[
  We can conduct hypothesis tests for the parameters in a linear regression model:
  $
    H_(0,i): beta_i = beta_(i,0) \
    H_(1,i): beta_i != beta_(i,0)
  $
]

#theorem(title: "5.12")[
  Under the null hypotheses $(beta_0 = beta_(0,0) "and" b_1 = beta_(1,0))$ the test statistics are:
  $
    T_(beta_0) = (hat(beta)_0 - beta_(0,0)) / hat(sigma)_(beta_0) \
    T_(beta_1) = (hat(beta)_1 - beta_(1,0)) / hat(sigma)_(beta_1)
  $

  t-distributed with $n-2$ degrees of freedom.
]

==== Method 5.15
$1 - alpha$ confidence intervals for $beta_0$ and $beta_1$ are given by:
$
  hat(beta)_0 plus.minus t_(1-alpha/2) hat(sigma)_(beta_0) \
  hat(beta)_1 plus.minus t_(1-alpha/2) hat(sigma)_(beta_1)
$

where $t_(1-alpha/2)$ is the $1-alpha/2$ quantile of the t-distribution with $n-2$ degrees of freedom.

#note-box(title: "Python")[
  In Python, $hat(sigma)_(beta_0)$ and $hat(sigma)_(beta_1)$ can be found under `std err`.
  ```python
  linfit.conf_int(0.05)
  ```
]

==== Method 5.18: Confidence interval for the regression line
A simple linear regression model can be written as:
$
  Y_i tilde N(beta_0 + beta_1 x_i, sigma^2)
$

For a new observation $x_"new"$ we can find a confidence interval for $mu(x_"new") = beta_0 + beta_1 x_"new"$.

the $(1-alpha)$ confidence interval for the regression line at $x = x_"new"$ is given by:

$
  (hat(beta)_0 + hat(beta)_1 x_"new") plus.minus t_(1-alpha/2)(n-2) hat(sigma) sqrt(1/n + (x_"new" - overline(x))^2 / (sum^n_(i=1) (x_i - overline(x))^2))
$


=== Confidence and prediction intervals
==== Method 5.18: Prediction interval for a new observation
We want a prediction interval for a new observation $Y_"new"$ at $x = x_"new"$.

the $(1-alpha)$ prediction interval for a new observation $Y_"new"$ at $x = x_"new"$ is given by:

$
  (hat(beta)_0 + hat(beta)_1 x_"new") plus.minus t_(1-alpha/2)(n-2) hat(sigma) sqrt(1 + 1/n + (x_"new" - overline(x))^2 / (sum^n_(i=1) (x_i - overline(x))^2))
$

The prediction interval will contain the observed ynew in $100(1−alpha)%$
of cases.

For fixed $alpha$, the prediction interval is larger than the confidence interval

#note-box(title: "Python")[
  ```python
  Dn = pd.DataFrame({'x': xn})
  tab = linfit.get_prediction(Dn).summary_frame(alpha=0.05)
  ci = tab[['mean_ci_lower', 'mean_ci_upper']]
  pi = tab[['obs_ci_lower', 'obs_ci_upper']]
  ```
]

==== Confidence and prediction interval for a new observation
Set $x_"new" = [1, x_"new"]^TT$, then the confidence interval is:
$
  x_"new"^T hat(beta) plus.minus t_(1-alpha/2) hat(sigma) sqrt(x_"new"^T (X^TT X)^(-1) x_"new")
$
and the prediction interval is
$
  x_"new"^T hat(beta) plus.minus t_(1-alpha/2) hat(sigma) sqrt(1 + x_"new"^T (X^TT X)^(-1) x_"new")
$

=== Correlation
The explained variance in a model is $R^2$ and is given by:
$
  R^2 = 1 - (sum_i (y_i - hat(beta)_0 + hat(beta)_1 x_i)^2) / (sum_i (y_i - overline(y))^2)
$

it represents the proportion of the total variance explained by the model.

#definition(title: "Correlation from regression")[
  The correlation $rho$ measures the linear relationship between two stochastic variables. The estimated (empirical) correlation satisfies:
  $
    hat(rho) = sqrt(R^2) dot "sign"(hat(beta)_1)
  $
  where $"sign"(hat(beta)_1)$ is $-1$ for $hat(beta)_1 <= 0$ and $1$ for $hat(beta)_1 > 0$.

  Thus: positive correlation comes with a positive slope, negative correlation with a negative slope.
]

#theorem(title: "Test for significant correlation")[
  Testing for significant correlation (linear relationship) between two variables:
  $
    H_0 : rho = 0, quad H_1 : rho != 0
  $
  is equivalent to:
  $
    H_0 : beta_1 = 0, quad H_1 : beta_1 != 0
  $
  where $beta_1$ is the slope in the simple linear regression model.
]

== Multiple linear regression

We can extend the model with more than one explanatory variable:
$
  Y_i = beta_0 + beta_1 x_(1,i) + dots.c + beta_p x_(p,i) + epsilon_i, quad epsilon_i tilde N(0,sigma^2) "and iid."
$

or:

$
  Y = vec(Y_1, dots.v, Y_n) = mat(1, x_11, dots.c, x_(p 1); dots.v, dots.v, , dots.v; 1, x_(1 n), dots.c, x_(p n)) vec(beta_0, dots.v, beta_p) + vec(epsilon_1, dots.v, epsilon_n) = X beta + epsilon, quad epsilon tilde N(0, sigma^2 I)
$

=== Parameter estimates
All results from simple linear regression carry over, with minor adjustments. The estimator is:
$
  hat(beta) = (X^TT X)^(-1) X^TT Y
$
with covariance matrix:
$
  V[hat(beta)] = sigma^2 (X^TT X)^(-1)
$
and central estimate for the residual variance:
$
  hat(sigma)^2 = "RSS" / (n - (p+1))
$

#note-box(title: "Python")[
  ```python
  D = pd.DataFrame({'x1': x1, 'x2': x2, 'y': y})
  linfit = smf.ols(formula='y ~ x1+x2', data=D).fit()
  print(linfit.summary(slim=True))
  ```
]

=== Hypothesis test (partial t-test)
The covariance matrix of the estimates is $hat(Sigma)_beta = hat(sigma)^2 (X^TT X)^(-1)$.

#theorem()[
  The observed t-statistic for the hypothesis $H_0 : beta_i = beta_(i,0)$ is:
  $
    t_(op("obs"),i) = (hat(beta)_i - beta_(i,0)) / sqrt((hat(Sigma)_beta)_(i i))
  $
  compared with a t-distribution with $n-(p+1)$ degrees of freedom.
]

=== Confidence and prediction intervals (multiple regression)
Let $x_"new" = [1, x_(1,"new"),dots,x_(p,"new")]^TT$.

#definition(title: "Variance of the mean estimator")[
  $
    V(hat(Y)_"new") = V(x_"new"^TT hat(beta)) = sigma^2 x_"new"^TT (X^TT X)^(-1) x_"new"
  $
]

#definition(title: "Prediction variance")[
  $
    V(Y_"new") = V(x_"new" hat(beta) + epsilon_"new") = sigma^2 (1 + x_"new"^TT (X^TT X)^(-1) x_"new")
  $
]

In practice $sigma^2$ is replaced by $hat(sigma)^2$, and we use the appropriate t-distribution quantiles.

== Model selection
There is no certain method to find the "best" model — selecting a model requires subjective decisions. Different procedures (forward, backward, or both) are used depending on circumstances. Statistical methods and tests exist to compare models.

=== Model extension (forward selection)
Not included in the book.
- Start with a simple linear regression model with one significant explanatory variable
- Extend the model with other explanatory variables one at a time
- Stop when there are no more significant extensions

=== Model reduction (backward selection)
Described in the book under section 6.5.
- Start with the full model
- Remove the "least significant" variable
- Stop when all remaining parameters are significant

== Model validation - Analysis of residuals
#theorem(title: "5.28")[
  - Check the normality assumption with a Q-Q plot.
  - Check for any systematic deviations by plotting the residuals $e_i$ as a function of the fitted values $hat(y)_i$.
]

#note-box(title: "Method 5.29")[
  Is the independence assumption reasonable?
]

#note-box(title: "Python")[
  ```python
  res = linfit.resid
  yfit = linfit.fittedvalues
  fig, ax = plt.subplots(2)
  stats.probplot(res, dist="norm", plot=ax[0])
  ax[1].scatter(yfit, res)
  ax[1].axhline(y=0)
  plt.tight_layout()
  plt.show()
  ```
]
