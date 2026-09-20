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
  title: "Lecture - June 15, 2026",
  date: datetime(year: 2026, month: 6, day: 15),
  author: "Sebastian Faber Steffensen (s255609)",
  semester: "2026 Spring"
)

= Lecture 6
== Introduction and random sampling
=== Finite sample
Make sure individuals are chosen at random (don’t just ask your friends or users of a specific website)

=== Infinite sample
/ Controlled experiments:  Make sure you only vary the variable of interest (don’t contaminate your samles, use the same equitment, ect.)
/ Real life measurements: Make sure that measurements are taken in a standardlized way (e.g. don’t expose the temperature censor with direct sunlight, make it clear what measurements represent, ect.)

== Confidence interval
Consider the $1−alpha$ random interval $I(Y, alpha)$ for the variable $theta$ (e.g. $mu$ or $sigma^2$) such that:
$
  P(theta in I(Y, alpha)) = 1 - alpha
$
the interval (not $theta$) is random. The realization $I(y, alpha)$ is referred to as the confidence interval for $theta$

=== Confidence interval for the mean
Let $Y_1, ..., Y_n$ be iid. $tilde N(mu, sigma^2)$, then:

/ if $sigma^2$ is known: then $P(overline(Y) - z_(1-alpha/2) sigma/sqrt(n) < mu < overline(Y) + z_(1-alpha/2) sigma/sqrt(n)) = 1 - alpha$ implying that $I(Y,alpha) = (overline(Y) plus.minus z_(1-alpha/2) sigma/sqrt(n))$ and the $1-alpha$ confidence interval is: $ I(y,alpha) = overline(y) plus.minus z_(1-alpha/2) sigma/sqrt(n) = overline(y) plus.minus "ME" $ where $z_(1-alpha/2)$ is the $1-alpha/2$ quantile of the standard normal, and $"ME"$ is the margin of error.

/ if $sigma^2$ is unknown: then $P(overline(Y) - t_(1 - alpha/2) S/sqrt(n) < mu < overline(Y) + t_(1 - alpha/2) S/sqrt(n)) = 1 - alpha$ implying that $I(Y,alpha) = (overline(Y) plus.minus t_(1 - alpha/2) S/sqrt(n))$ and the $1-alpha$ confidence interval is: $ I(y,alpha) = overline(y) plus.minus t_(1 - alpha/2) s/sqrt(n) = overline(y) plus.minus "ME" $ where $t_(1 - alpha/2)$ is the $1-alpha/2$ quantile of the t-distribution with $n-1$ degrees of freedom, and $"ME"$ is the margin of error. 

=== Properties of confidence intervals
The Margin of error (for $sigma$ uknown) is:
$
  "ME" = t_(1 - alpha/2) S/sqrt(n)
$

The margin of error (and hence the confidence interval width)
- increase when $alpha$ decrease towards zero
- decrease when number of observations
- vary from sample to sample (since $s$ is random)

#example()[
  The quality assurance department at a candy factory has taken a random sample of $26$ chocolate bars of a certain brand. Each chocolate bar in the sample is weighted, and it is found that the average weight is $200.3$ grams and the observed standard deviation is $0.75$ grams.

  #conceptual-question()[
    What is the $95%$ confidence interval for the mean?
  ]

  #solution()[
    we get the following defined:
    $n = 26, quad
      overline(y) = 200.3, quad
      s = 0.75, quad
      alpha = 0.05$

    then the confidence interval is given by:
    
    $
      overline(y) plus.minus "ME" &= 200.3 plus.minus t_(1 - 0.05/2) 0.75/sqrt(26) \
      &= 200.3 plus.minus 0.35 \
      &= [200.0; 200.6]
    $
    
  ]
  
]
== Non-normal data, The Central Limit Theorem
#theorem(title: "3.14")[
  *In large samples the distribution of the average follows a normal distribution*

  let $overline(Y)$ be the average of a randomly drawn sample of size $n$ taken from a population with mean $mu$ and variance $sigma^2$. Then, the distribution of 
  $
    Z = (overline(Y) - mu) / (sigma/sqrt(n))
  $
  approaches the standard normal distribution, $N(0, 12)$, as $n -> oo$

  *That is, if n is large enough, we can (approximately) assume:*
  $
    (overline(Y)-mu) / (sigma/sqrt(n)) tilde N(0,1^2)
  $
]

#conceptual-question()[
  When is $n$ large enough? 
]

#solution()[
  rule of thumb: $n >= 30$ is often considered large enough, but it depends on the underlying distribution of the data. If the data is heavily skewed or has outliers, a larger sample size may be needed for the CLT to hold. Conversely, if the data is approximately normal, a smaller sample size may suffice.
]

== Confidence interval for variance and standard deviation
#theorem(title: $2.8.1$)[
  Assume $Y_1,...,Y_n$ are iid. $tilde N(mu, sigma^2)$, Random variables $Y_i tilde N(mu,sigma^2), i=1,dots,n$

  1. The central estimator for the variance is
     $
       S^2 = 1/(n-1) sum^n_(i=1) (Y_i - overline(Y))^2
     $
  2. The esimator is related to the $chi^2$-distribution by:
     $
        ((n-1) S^2)/(sigma^2) tilde chi^2(n-1)
     $

  The aim is to find a confidence interval for $sigma^2$, i.e. an interval such that

  $
    P(sigma^2 in I(Y, alpha)) = 1 - alpha
  $
]

==== Method 3.19: Confidence intervals for variance and standard deviation
let $Y_i tilde N(mu, sigma^2), i=1,...,n$ be iid. 

/ Variance:
A $100(1−alpha)%$ confidence interval for the variance $sigma^2$ is given by: 
$
  [((n-1)s^2)/chi^2_(1-alpha/2); ((n-1)s^2)/chi^2_(alpha/2)]
$
where the quantiles come from a $chi^2$-distribution with $n-1$ degrees of freedom.

/ Standard deviation:
A $100(1−alpha)%$ confidence interval for the standard deviation $sigma$ is given by:
$
  [sqrt(((n-1)s^2)/chi^2_(1-alpha/2)); sqrt(((n-1)s^2)/chi^2_(alpha/2))]  
$
== Hypothesis test
#definition()[
  We say that we are performing a hypothesis test when we decide to reject or accept a null hypothesis based on data.  

  A null hypothesis is rejected if $p"-value" < alpha$ ($alpha$ is chosen in advance).

  Otherwise, the null hypothesis is said to be ’accepted’. It is more accurate (and preferable) to say that the null hypothesis cannot be rejected.
]

=== Statistical Significance
An effect is said to be (statistically) significant if the p-value is less than the significance level α. This terminology is most meaningful when the null hypothesis is: $H_0: µ= mu_0 = 0$, which translates to the null hypothesis of "no effect."

It can also be said that $mu$ is *significantly different* from $mu_0$.

Sometimes, we also say that we ’accept’ the *alternative hypothesis*: $H_A: mu != mu_0$

// TODO: Finish notes
=== The t-test

=== Critical values and hypothesis test


== Type I and Type II errors
== One sample t-test and the LM
== Summary of Statistical Inference


#let _nb-json = json("notebooks/2026-06-15-02403-lecture.ipynb")
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
        block(width: 100%, spacing: 1em, callisto.read-mime(parts.at(0), format: "text/markdown"))
        let sol = (callisto.read-mime(parts.slice(1).join("\n\n**Solution:**"), format: "text/markdown"),)
        i += 1
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
        block(width: 100%, spacing: 1em, callisto.read-mime(cell.source, format: "text/markdown"))
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
